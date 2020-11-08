    //
    //  NSString+PopularStyle.m
    //  JinZi
    //
    //  Created by KeKe on 16/1/20.
    //  Copyright © 2016年 fengjinbiao. All rights reserved.
    //

#import "NSString+PopularStyle.h"

@implementation NSString (PopularStyle)
-(NSString*)phoneSpaceStyle//4个一个空格
{
    NSMutableString*resultStr=[[NSMutableString alloc]initWithString:self];
    if (self.length==11) {
        [resultStr insertString:@" " atIndex:4];
        [resultStr insertString:@" " atIndex:9];
    }
    else
        {
        return self;
        }

    return resultStr;
}
-(NSString*)phoneStarStyle
{
    NSString*resultstr=[self stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"****"];
    return resultstr;
}
-(NSString*)phoneChaStyle
{
    NSString*resultstr=nil;
    if (self.length>=8) {
        resultstr=[self stringByReplacingCharactersInRange:NSMakeRange(3, 4) withString:@"xxxx"];
    }
    else
        {
        resultstr=self;
        }
    return resultstr;
}
-(NSString*)socialNumShowText
{
    NSString*result=self;
    if ([result intValue]>=10000) {
        result=[NSString stringWithFormat:@"%.1f",[result floatValue]/10000 ];
        if ([result hasSuffix:@".0"]) {
            result=[result substringToIndex:result.length-1-1];
        }
        result=[NSString stringWithFormat:@"%@W",result];
    }

    return  result;
}
-(NSString*)durationShowText
{
    int value=[self intValue];
    int min=value/60;
    int second=value%60;
    NSString*minstr= [self W2str:min];
    NSString*secstr= [self W2str:second];
    NSString*result=[NSString stringWithFormat:@"%@:%@",minstr,secstr];
    return result;
}
-(NSString*)W2str:(int)num
{
    NSString*resultstr;
    if (num<10)
        {
        resultstr=[NSString stringWithFormat:@"0%d",num];
        }
    else
        {
        resultstr=[NSString stringWithFormat:@"%d",num];
        }
    return resultstr;

}
+(NSString*)nowYearMonth
{
    NSDateFormatter *formate = [[NSDateFormatter alloc] init];
    NSString *formateString = @"yyyy-MM";
    [formate setDateFormat:formateString];
    NSString*text=[formate stringFromDate:[NSDate date]];
    return text;
}
+(NSString*)nowYear
{
    NSDateFormatter *formate = [[NSDateFormatter alloc] init];
    NSString *formateString = @"yyyy";
    [formate setDateFormat:formateString];
    NSString*text=[formate stringFromDate:[NSDate date]];
    return text;
}
+(NSString*)dayStrWithDate:(NSDate*)date
{
    NSDateFormatter *formate = [[NSDateFormatter alloc] init];
    NSString *formateString = @"yyyy-MM-dd";
    [formate setDateFormat:formateString ];
    return [formate stringFromDate:date];
}
+(NSString*)dayTimeStrWithDate:(NSDate*)date
{
    NSDateFormatter *formate = [[NSDateFormatter alloc] init];
    NSString *formateString = @"yyyy-MM-dd HH:mm:ss";
    [formate setDateFormat:formateString ];
    return [formate stringFromDate:date];
}
-(NSString *)translateToNum

{
    NSString *str = self;

    NSArray *arabic_numerals = @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"0",@"0"];
    NSArray *chinese_numerals = @[@"一",@"二",@"三",@"四",@"五",@"六",@"七",@"八",@"九",@"零", @"十"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:arabic_numerals forKeys:chinese_numerals];

    NSMutableArray *sums = [NSMutableArray array];

    for (int i = 0; i < str.length; i ++) {
        NSString *substr = [str substringWithRange:NSMakeRange(i, 1)];
        NSString *sum = substr;
        if([chinese_numerals containsObject:substr]){
            NSLog(@"=====%@", substr);
            if([substr isEqualToString:@"十"] && i < str.length){
                NSString *nextStr = [str substringWithRange:NSMakeRange(i+1, 1)];
                NSLog(@"-----%@", nextStr);
                if([chinese_numerals containsObject:nextStr]){
                    continue;
                }
            }
            sum = [dictionary objectForKey:substr];
        }
        NSLog(@"====%@", sum);
        [sums addObject:sum];
    }

    NSString *sumStr = [sums  componentsJoinedByString:@""];
    return sumStr;

}
-(NSString*)substringAfterStr:(NSString*)str
{
    NSInteger location=[self rangeOfString:str].location;
    NSString*result=nil;
    if (location!=NSNotFound) {
        NSInteger subindex=location+str.length;
        result=[self substringFromIndex:subindex];
    }
    return result;
}
-(NSString*)substringWithStartIndex:(int)startindex endindex:(int)endindex
{
    NSString*result=nil;
    NSRange content_range=NSMakeRange(startindex, endindex-startindex+1);
    NSInteger maxindex=self.length-1;
    if (startindex<=maxindex&&endindex<maxindex) {
        result=[self substringWithRange:content_range];
    }
    return  result;

}
-(BOOL)pinyinEqual:(NSString*)str
{
    NSString *self_pinyin = [self pinyin];
    NSString *str_pinyin = [str pinyin];
    return [self_pinyin isEqualToString:str_pinyin];
}
-(NSString *)pinyin

{

    //转成了可变字符串

    NSMutableString *str = [NSMutableString stringWithString:self];

    //先转换为带声调的拼音

    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformMandarinLatin,NO);

    //再转换为不带声调的拼音

    CFStringTransform((CFMutableStringRef)str,NULL, kCFStringTransformStripDiacritics,NO);

    //转化为大写拼音

//    NSString *pinYin = [str capitalizedString];

    //获取并返回首字母

    return str;

}
static inline int min(int a, int b) {
    return a < b ? a : b;
}

+(float)likePercentByCompareOriginText:(NSString *)originText targetText:(NSString *)targetText{

    //length
    int n = (int)originText.length;
    int m = (int)targetText.length;
    if (n == 0 || m == 0) {
        return 0.0;
    }

    //Construct a matrix, need C99 support
    int N = n+1;
    int **matrix;
    matrix = (int **)malloc(sizeof(int *)*N);

    int M = m+1;
    for (int i = 0; i < N; i++) {
        matrix[i] = (int *)malloc(sizeof(int)*M);
    }

    for (int i = 0; i<N; i++) {
        for (int j=0; j<M; j++) {
            matrix[i][j]=0;
        }
    }

    for(int i=1; i<=n; i++) {
        matrix[i][0]=i;
    }
    for(int i=1; i<=m; i++) {
        matrix[0][i]=i;
    }
    for(int i=1;i<=n;i++)
    {
        unichar si = [originText characterAtIndex:i-1];
        for(int j=1;j<=m;j++)
        {
            unichar dj = [targetText characterAtIndex:j-1];
            int cost;
            if(si==dj){
                cost=0;
            }
            else{
                cost=1;
            }
            const int above = matrix[i-1][j]+1;
            const int left = matrix[i][j-1]+1;
            const int diag = matrix[i-1][j-1]+cost;
            matrix[i][j] = min(above, min(left,diag));
        }
    }
    return 100.0 - 100.0*matrix[n][m]/MAX(m,n);
}

@end
