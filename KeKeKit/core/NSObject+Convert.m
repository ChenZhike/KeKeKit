//
//  NSObject+Convert.m
//  KeKeKit
//
//  Created by CZK on 2019/4/13.
//  Copyright © 2019 czk. All rights reserved.
//

#import "NSObject+Convert.h"

@implementation NSObject (Convert)
-(NSNumber*)mustNum
{
  NSNumber*final=  [self isKindOfClass:[NSNumber class]]?(NSNumber*)self:@([(NSString*)self intValue]);
    return final;
}
-(NSString*)numOrStringValue
{
    if ([self isKindOfClass:[NSNumber class]]) {
        return [(NSNumber*)self stringValue];
    }else
        {
        return (NSString*)self;
        }
}
-(id)tryPerformSelWithName:(NSString*)selName
{
    SEL bsel=@selector(selName);
    if ([self respondsToSelector:bsel]) {
        id obj=[self performSelector:bsel];
        return obj;
    }
    return nil;
}
- (id)performSelector:(SEL)aSelector
          withObjects:(NSArray *)arguments{

    //1.根据SEL实例化方法签名
    NSMethodSignature *signature = [[self class]instanceMethodSignatureForSelector:aSelector];
    //2.判断方法是否存在
    if (signature == nil) {
        //抛出异常
        NSLog(@"不存在这个方法");
        return nil;
    }
    //3.通过类方法实例化NSInvaction对象,设置target,selector
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    [invocation setTarget:self];
    [invocation setSelector:aSelector];

    //获取参数的个数,默认方法都有 self,_cmd两个参数
    NSInteger signatureParmCount = signature.numberOfArguments - 2;
    NSInteger resultCount = MIN(signatureParmCount, arguments.count);

    //设置方法参数
    for (NSInteger i = 0; i < resultCount; i++) {
        id argument = arguments[i];
        if ([argument isKindOfClass:[NSNull class]]) continue;
        [invocation setArgument:&argument atIndex:i+2];
    }
    [invocation invoke];

    //返回值,获取返回值的长度,大于0表示有返回值
    id returnArgument = nil;
    if (signature.methodReturnLength) {
        [invocation getReturnValue:&returnArgument];
    }
    return returnArgument;
}
@end
