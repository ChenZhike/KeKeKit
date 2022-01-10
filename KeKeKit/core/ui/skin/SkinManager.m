//
//  SkinManager.m
//  KeKeKit
//
//  Created by 陈志科 on 2022/1/5.
//

#import "SkinManager.h"

#pragma mark-皮肤
NSString * const SkinViewBackColor=@"SkinViewBackColor";
NSString * const SkinTopViewBackColor=@"SkinTopViewBackColor";
NSString * const SkinTopViewTitleFont=@"SkinTopViewTitleFont";
NSString * const SkinTableBackColor=@"SkinTableBackColor";




SkinDictKey const SkinDictKeyName    = @"skinName";
SkinDictKey const SkinDictKeyColor   = @"skinColor";
SkinDictKey const SkinDictKeyIndex   = @"skinIndex";

static SkinManager * _shareInstance = nil;

@interface SkinManager ()

@property (nonatomic, strong) UIImage *navImage;

@end

@implementation SkinManager

+(instancetype)sharedInstance{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareInstance = [[SkinManager alloc] init];
    });
    return _shareInstance;
}
+(NSDictionary*)defaultDic
{
    return @{
        SkinViewBackColor:NatureColorNearlyWhite
        ,SkinTableBackColor:NatureColorNearlyWhite
        ,SkinTopViewTitleFont:font(17)
        ,SkinTopViewBackColor:[UIColor blueColor]
    };
}
-(instancetype)init{
    if (self = [super init]) {
        [self makeThemeList];
        
        NSNumber * current = [g_default objectForKey:SkinDictKeyIndex];
        if (current == nil) {
//
            [g_default setObject:[NSNumber numberWithUnsignedInteger:SkinType_DarkPurple] forKey:SkinDictKeyIndex];
            [g_default synchronize];
            current = [NSNumber numberWithUnsignedInteger:SkinType_DarkPurple];
        }
        
        NSDictionary * skinDict = [self searchSkinByIndex:[current unsignedIntegerValue]];
        if(skinDict){
            _themeName = skinDict[SkinDictKeyName];
            _themeColor = skinDict[SkinDictKeyColor];
            _themeIndex = [skinDict[SkinDictKeyIndex] unsignedIntegerValue];
        }
        self.color_dic=@{@"black":HexColor(@"333333"),@"gray":HexColor(@"929292"),@"gray_light":HexColor(@"b7b7b7"),@"view_back":RGB(249, 250, 243,1)};
        
    }
    return self;
}

-(void)makeThemeList{
    NSMutableArray * skinList = [NSMutableArray array];

    // 以前的黑色 0x4FC557
    // 极简风格
    [skinList addObject:[self makeASkin:@"浅豆绿" color:HexColor(@"61D999") index:SkinType_PeaGreen]];//浅豆绿
    [skinList addObject:[self makeASkin:@"清水蓝" color:HexColor(@"80BFFF") index:SkinType_ClearBlue]];//清水蓝
    [skinList addObject:[self makeASkin:@"珊瑚红" color:HexColor(@"FF8080") index:SkinType_CoralRed]];//珊瑚红
    [skinList addObject:[self makeASkin:@"流霞粉" color:HexColor(@"FFA5C9") index:SkinType_NephelinePowder]];//流霞粉
    
    //普通风格
    [skinList addObject:[self makeASkin:@"JX_Theme_ViridianGreen" color:HexColor(@"55BEB7") index:SkinType_CobaltPaleGreen]];//淡钴绿 默认
    [skinList addObject:[self makeASkin:@"葡萄紫" color:HexColor(@"6C53AB") index:SkinType_DarkPurple]];//葡萄紫
    [skinList addObject:[self makeASkin:@"商务蓝" color:HexColor(@"148AFF") index:SkinType_BusinessBlue]];//商务蓝
    [skinList addObject:[self makeASkin:@"经典红" color:HexColor(@"fd504e") index:SkinType_ComposedRed]];//经典红

    
    NSMutableArray * skinNameList = [NSMutableArray array];
    for (NSDictionary * skinDict in skinList) {
        [skinNameList addObject:skinDict[SkinDictKeyName]];
    }
    
    _skinNameList = skinNameList;
    _skinList = skinList;
}

-(NSDictionary *)makeASkin:(NSString *)name color:(UIColor *)color index:(SkinType)skinType{
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    [dict setObject:name forKey:SkinDictKeyName];
    [dict setObject:color forKey:SkinDictKeyColor];
    [dict setObject:[NSNumber numberWithUnsignedInteger:skinType] forKey:SkinDictKeyIndex];
    
    return dict;
}

-(NSDictionary *)searchSkinByIndex:(NSInteger)index{
    for (int i = 0; i<_skinList.count; i++) {
        NSDictionary * skinDict = _skinList[i];
        if ([skinDict[SkinDictKeyIndex] unsignedIntegerValue] == index) {
            
            return skinDict;
        }
    }
    return nil;
}


-(void)switchSkinIndex:(NSUInteger)index{
    NSDictionary * skinDict = [self searchSkinByIndex:index];
    if(skinDict){
        _themeName = skinDict[SkinDictKeyName];
        _themeColor = skinDict[SkinDictKeyColor];
        _themeIndex = [skinDict[SkinDictKeyIndex] unsignedIntegerValue];
        self.navImage = nil;
        [g_default setObject:[NSNumber numberWithUnsignedInteger:_themeIndex] forKey:SkinDictKeyIndex];
        [g_default synchronize];
    }
}

-(UIImage *)themeImage:(NSString *)imageName{
    NSString * imageStr = [imageName copy];
    if ([imageName rangeOfString:@"@2x"].location != NSNotFound) {
        imageStr = [imageName stringByReplacingOccurrencesOfString:@"@2x" withString:@""];
    }else if ([imageName rangeOfString:@"@3x"].location != NSNotFound){
        imageStr = [imageName stringByReplacingOccurrencesOfString:@"@3x" withString:@""];
    }
    
    if(_themeIndex != 0){
        imageStr = [NSString stringWithFormat:@"%@_%tu",imageStr,_themeIndex];
    }
    UIImage * img = [UIImage imageNamed:imageStr];
    if (img) {
        return img;
    }else{
        return [UIImage imageNamed:imageName];
    }
        
}

-(NSString *)themeImageName:(NSString *)imageName{
    NSString * imageStr;
    if ([imageName rangeOfString:@"@2x"].location != NSNotFound) {
        imageStr = [imageName stringByReplacingOccurrencesOfString:@"@2x" withString:@""];
    }else if ([imageName rangeOfString:@"@3x"].location != NSNotFound){
        imageStr = [imageName stringByReplacingOccurrencesOfString:@"@3x" withString:@""];
    }
    
    imageStr = [NSString stringWithFormat:@"%@_%tu",imageStr,_themeIndex];
   
    return imageStr;
}

-(UIImage *)themeTintImage:(NSString *)imageName{
    
    if ([imageName isEqualToString:@"navBarBackground"] && self.navImage) {
        return self.navImage;
    }else {

        UIImage * tintImage = [[UIImage imageNamed:imageName] imageWithTintColor:self.themeColor];
        if ([imageName isEqualToString:@"navBarBackground"] && !self.navImage) {
            self.navImage = tintImage;
        }
        return tintImage;
    }
}


-(void)resetInstence{
    _shareInstance = [self init];
}
#pragma mark-keke
-(UIColor*)getColorWithName:(NSString*)name{
    UIColor* obj=[self.color_dic objectForKey:name];
    return obj;
}


@end
