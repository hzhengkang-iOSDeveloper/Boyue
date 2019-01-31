//
//  NSString+Extension.m
//  Shopping2.0
//
//  Created by chenpeng on 17/3/6.
//  Copyright © 2017年 HongHui(Shanghai)Information Technology Service Co.,Ltd. All rights reserved.
//

#import "NSString+Extension.h"
#import<CommonCrypto/CommonDigest.h>
#import <AVFoundation/AVFoundation.h>
@implementation NSString (Extension)


/**
 *  @brief  根据一定宽度返回高度
 *  @category
 *  @param  goalString      目标字符串
 *  @param  font            字号
 *  @param  width          固定的宽
 **/
+ (CGFloat)getStringHeightWith:(NSString *)goalString withStringFont:(UIFont *)font withWidth:(CGFloat)width {
    
    CGSize sizeC = CGSizeMake(width, MAXFLOAT);
    
    CGSize sizeFileName = [goalString boundingRectWithSize:sizeC
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                attributes:@{NSFontAttributeName:font}
                                                   context:nil].size;
    if ([goalString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]].length == 0) {
        return 0;
    }
    return sizeFileName.height;
}

/**
 *  @brief  根据传入的range和imageName返回一个特殊富文本
 *  @category
 *  @param  range      传入的range
 *  @param  imageName      传入的imageName
 **/
- (NSMutableAttributedString *)getAttrStringWithIndex:(NSInteger)index imageName:(NSString *)imageName imageSize:(CGSize)imageSize {
    
    // 添加图片
    NSTextAttachment *attch2 = [[NSTextAttachment alloc] init];
    attch2.image = ImageNamed(imageName);
    // 设置图片大小
    attch2.bounds = CGRectMake(0, -3, imageSize.width, imageSize.height);
    // 创建带有图片的富文本
    NSAttributedString *str1 = [NSAttributedString attributedStringWithAttachment:attch2];
    NSMutableAttributedString *goalAttrString = [[NSMutableAttributedString alloc] initWithString:self];
    [goalAttrString insertAttributedString:str1 atIndex:index];
    return goalAttrString;
}

/**
 *  @brief  根据传入的range和color返回一个特殊富文本
 *  @category
 *  @param  range      传入的range
 *  @param  color      传入的color
 *  @param  width      传入的font
 **/
- (NSMutableAttributedString *)getAttrStringWithRange:(NSRange)range color:(id)color font:(id)font {
    NSMutableAttributedString *goalAttrString = [[NSMutableAttributedString alloc]initWithString:self];
    if ((range.location+range.length) <= self.length) {
        if ([color isKindOfClass:[UIColor class]]) {
            [goalAttrString addAttribute:NSForegroundColorAttributeName value:color range:range];
        }
        if ([font isKindOfClass:[UIFont class]]) {
            [goalAttrString addAttribute:NSFontAttributeName value:font range:range];
        }
    }
    return goalAttrString;
}

/**
 *  @brief  时间戳转化为时间年月日用点隔开(不显示秒)
 *  @category
 *  @param  timeString      字符串格式的时间戳
 **/
+ (NSString *)usePointNoSecondTimeWithTimeIntervalString:(NSString *)timeString {
    
    if ([timeString intValue] <= 0) {
        return @"";
    }
    
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy.MM.dd HH:mm"];
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

/**
 *  @brief  时间戳转化为时间(不显示秒)
 *  @category
 *  @param  timeString      字符串格式的时间戳
 **/
+ (NSString *)noSecondTimeWithTimeIntervalString:(NSString *)timeString {
    
    if ([timeString intValue] <= 0) {
        return @"";
    }
    
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

/**
 *  @brief  时间戳转化为时间
 *  @category
 *  @param  timeString      字符串格式的时间戳
 **/
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString {
    
    if ([timeString intValue] <= 0) {
        return @"";
    }
    
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

/**
 *  @brief  时间戳转化为时间
 *  @category
 *  @param  timeString      字符串格式的时间戳
 **/
+ (NSString *)mostSimpleTimeWithTimeIntervalString:(NSString *)timeString {
    
    if ([timeString intValue] <= 0) {
        return @"";
    }
    
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"MM.dd"];
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

/**
 *  @brief  时间戳转化为时间 xx月xx日xx:xx
 *  @category
 *  @param  timeString      字符串格式的时间戳
 **/
+ (NSString *)UseMouthAndDayHoursTimeWithTimeIntervalString:(NSString *)timeString {
    
    if ([timeString intValue] <= 0) {
        return @"";
    }
    
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"MM月dd日 HH:mm"];
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

/**
 *  @brief  时间戳转化为时间 某个时间到某个时间
 *  @category
 *  @param  timeString      字符串格式的时间戳
 **/
+ (NSString *)UseTimeToTimeMouthAndDayHoursTimeWithTimeIntervalFirstString:(NSString *)fTimeString SecondString:(NSString *) sTimeString {
    
    if ([fTimeString intValue] <= 0) {
        return @"";
    }
    
    if ([sTimeString intValue] <= 0) {
        return @"";
    }
    
    // 格式化时间1
    NSDateFormatter* formatter1 = [[NSDateFormatter alloc] init];
    formatter1.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter1 setDateStyle:NSDateFormatterMediumStyle];
    [formatter1 setTimeStyle:NSDateFormatterShortStyle];
    [formatter1 setDateFormat:@"MM月dd日 HH:mm"];
    
    // 格式化时间2
    NSDateFormatter* formatter2 = [[NSDateFormatter alloc] init];
    formatter2.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter2 setDateStyle:NSDateFormatterMediumStyle];
    [formatter2 setTimeStyle:NSDateFormatterShortStyle];
    [formatter2 setDateFormat:@"HH:mm"];
    
    
    NSDate* date1 = [NSDate dateWithTimeIntervalSince1970:[fTimeString doubleValue]];
    NSString* dateString1 = [formatter1 stringFromDate:date1];
    
    NSDate* date2 = [NSDate dateWithTimeIntervalSince1970:[sTimeString doubleValue]];
    NSString* dateString2 = [formatter2 stringFromDate:date2];
    
    return [NSString stringWithFormat:@"%@-%@",dateString1,dateString2];
}


/**
 *  @brief  时间戳转化为时间 xx月xx日
 *  @category
 *  @param  timeString      字符串格式的时间戳
 **/
+ (NSString *)simpleMouthAndDayTimeWithTimeIntervalString:(NSString *)timeString {
    
    if ([timeString intValue] <= 0) {
        return @"";
    }
    
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"MM月dd日"];
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}


/**
 *  @brief  时间戳转化为时间
 *  @category
 *  @param  timeString      字符串格式的时间戳
 **/
+ (NSString *)simpleTimeWithTimeIntervalString:(NSString *)timeString {
    
    if ([timeString intValue] <= 0) {
        return @"";
    }
    
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

/**
 *  @brief  时间戳转化为时间(用点来隔开的年.月.日)
 *  @category
 *  @param  timeString      字符串格式的时间戳
 **/
+ (NSString *)simplePointTimeWithTimeIntervalString:(NSString *)timeString {
    
    if ([timeString intValue] <= 0) {
        return @"";
    }
    
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy.MM.dd"];
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

/**
 *  @brief  时间戳转化为时间(用点来隔开的月.日)
 *  @category
 *  @param  timeString      字符串格式的时间戳
 **/
+ (NSString *)simpleNew_PointTimeWithTimeIntervalString:(NSString *)timeString {
    
    if ([timeString intValue] <= 0) {
        return @"";
    }
    
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"M.d"];
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

/**
 *  @brief  时间戳转化为自定义时间格式
 *  @category
 *  @param  timeString      字符串格式的时间戳
 *  @param  format      自定义的时间格式
 **/
+ (NSString *)CustomerTimeWithTimeIntervalString:(NSString *)timeString  withFormatter:(NSString *)format {
    
    if ([timeString intValue] <= 0) {
        return @"";
    }
    
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format];
    
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}
/**
 * 获取当前时间戳
 */
+ (NSString *)nowTime {
    NSDate* date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a=[date timeIntervalSince1970];
    return [NSString stringWithFormat:@"%.0f", a];
}

/**
 * 计算指定时间与当前的时间差
 * @param timeString   某一指定时间
 * @return 多少(秒or分or天or月or年)+前 (比如，3天前、10分钟前)
 */
+ (NSString *) compareCurrentTime:(NSString *)timeString {
    
    NSTimeInterval timeInterval = [[NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]] timeIntervalSinceNow];
    timeInterval = -timeInterval;
    long temp = 0;
    NSString *result;
    if (timeInterval < 60) {
        result = [NSString stringWithFormat:@"刚刚"];
    }
    else if((temp = timeInterval/60) < 60){
        result = [NSString stringWithFormat:@"%ld分钟前",temp];
    }
    
    else if((temp = temp/60) < 24){
        result = [NSString stringWithFormat:@"%ld小时前",temp];
    }
    
    else if((temp = temp/24) < 30){
        result = [NSString stringWithFormat:@"%ld天前",temp];
    }
    
    else if((temp = temp/30) < 12){
        result = [NSString stringWithFormat:@"%ld个月前",temp];
    }
    else{
        result = [self timeWithTimeIntervalString:timeString];
    }
    
    return  result;
}

/**
 * 字符串转base64
 * @param str   目标字符串
 * @return base64后的字符串
 */
+ (NSString *)base64String:(NSString *)str {
    NSData* originData = [str dataUsingEncoding:NSASCIIStringEncoding];
    NSString* encodeResult = [originData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    return encodeResult;
}

/**
 * 字符串转base64 UTF8编码
 * @param str   目标字符串
 * @return base64后的字符串
 */
+ (NSString *)base64UTF8String:(NSString *)str {
    NSData* originData = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSString* encodeResult = [originData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    return encodeResult;
}

/**
 * 字符串转MD5
 * @param input   目标字符串
 * @return MD5后的字符串
 */
+ (NSString *) md5:(NSString *) input {
    const char *cStr = [input UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return  output;
}
/**
 * 字符串去空格
 * @param input   目标字符串
 * @return 去除空格后的字符串
 */
+ (NSString *)removeEmpty:(NSString *) input {
    return [input stringByReplacingOccurrencesOfString:@" " withString:@""];
}
/**
 * 字符串去空格(用于搜索去拼音空格)
 * @param input   目标字符串
 * @return 去除空格后的字符串
 */
+ (NSString *)removeEmptyForSearch:(NSString *) input {
    return [input stringByReplacingOccurrencesOfString:@" " withString:@""];
}
/**
 * 字符串去首尾空格
 * @param input   目标字符串
 * @return 去除空格后的字符串
 */
+ (NSString *)removeFirstAndLastEmpty:(NSString *) input {
    return [input stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}
/**
 * 字符串去换行
 * @param input   目标字符串
 * @return 去除换行后的字符串
 */
+ (NSString *)removeNewline:(NSString *)input {
    return [input stringByReplacingOccurrencesOfString:@"\n" withString:@""];
}
/**
 * 32位随机字符串
 */
+ (NSString *)shuffledAlphabet {
    NSString *alphabet = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ012345";
    
    // Get the characters into a C array for efficient shuffling
    NSUInteger numberOfCharacters = [alphabet length];
    unichar *characters = calloc(numberOfCharacters, sizeof(unichar));
    [alphabet getCharacters:characters range:NSMakeRange(0, numberOfCharacters)];
    
    // Perform a Fisher-Yates shuffle
    for (NSUInteger i = 0; i < numberOfCharacters; ++i) {
        NSUInteger j = (arc4random_uniform(numberOfCharacters - i) + i);
        unichar c = characters[i];
        characters[i] = characters[j];
        characters[j] = c;
    }
    
    // Turn the result back into a string
    NSString *result = [NSString stringWithCharacters:characters length:numberOfCharacters];
    free(characters);
    return result;
}

+ (NSString *)getNowTimeWithString:(NSString *)aTimeString{
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    // 截止时间date格式
    NSDate  *expireDate = [formater dateFromString:aTimeString];
    NSDate  *nowDate = [NSDate date];
    // 当前时间字符串格式
    NSString *nowDateStr = [formater stringFromDate:nowDate];
    // 当前时间date格式
    nowDate = [formater dateFromString:nowDateStr];
    
    NSTimeInterval timeInterval =[expireDate timeIntervalSinceDate:nowDate];
    
    int days = (int)(timeInterval/(3600*24));
    int hours = (int)((timeInterval-days*24*3600)/3600);
    int minutes = (int)(timeInterval-days*24*3600-hours*3600)/60;
    int seconds = timeInterval-days*24*3600-hours*3600-minutes*60;
    
    NSString *dayStr;NSString *hoursStr;NSString *minutesStr;NSString *secondsStr;
    //天
    dayStr = [NSString stringWithFormat:@"%d",days];
    //小时
    hoursStr = [NSString stringWithFormat:@"%d",hours];
    //分钟
    if(minutes<10)
        minutesStr = [NSString stringWithFormat:@"0%d",minutes];
    else
        minutesStr = [NSString stringWithFormat:@"%d",minutes];
    //秒
    if(seconds < 10)
        secondsStr = [NSString stringWithFormat:@"0%d", seconds];
    else
        secondsStr = [NSString stringWithFormat:@"%d",seconds];
    if (hours<=0&&minutes<=0&&seconds<=0) {
        return @"00：00：00";
    }
    if ([hoursStr intValue]<10) {
        hoursStr = [NSString stringWithFormat:@"0%@",hoursStr];
    }
    if (days) {
        return [NSString stringWithFormat:@"%@天%@:%@:%@", dayStr,hoursStr, minutesStr,secondsStr];
    }
    return [NSString stringWithFormat:@"%@:%@:%@",hoursStr , minutesStr,secondsStr];
}

+ (NSDictionary *)getNowTimeDictWithString:(NSString *)aTimeString{
    NSDateFormatter* formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    // 截止时间date格式
    NSDate  *expireDate = [formater dateFromString:aTimeString];
    NSDate  *nowDate = [NSDate date];
    // 当前时间字符串格式
    NSString *nowDateStr = [formater stringFromDate:nowDate];
    // 当前时间date格式
    nowDate = [formater dateFromString:nowDateStr];
    
    NSTimeInterval timeInterval =[expireDate timeIntervalSinceDate:nowDate];
    
    int days = (int)(timeInterval/(3600*24));
    int hours = (int)((timeInterval-days*24*3600)/3600);
    int minutes = (int)(timeInterval-days*24*3600-hours*3600)/60;
    int seconds = timeInterval-days*24*3600-hours*3600-minutes*60;
    
    NSString *dayStr;NSString *hoursStr;NSString *minutesStr;NSString *secondsStr;
    //天
    dayStr = [NSString stringWithFormat:@"%d",days];
    //小时
    hoursStr = [NSString stringWithFormat:@"%d",hours];
    //分钟
    if(minutes<10)
        minutesStr = [NSString stringWithFormat:@"0%d",minutes];
    else
        minutesStr = [NSString stringWithFormat:@"%d",minutes];
    //秒
    if(seconds < 10)
        secondsStr = [NSString stringWithFormat:@"0%d", seconds];
    else
        secondsStr = [NSString stringWithFormat:@"%d",seconds];
    if (hours<=0&&minutes<=0&&seconds<=0) {
        return @{@"day":@"0",
                 @"hour":@"00",
                 @"minute":@"00",
                 @"second":@"00"};
    }
    if ([hoursStr intValue]<10) {
        hoursStr = [NSString stringWithFormat:@"0%@",hoursStr];
    }

    return @{@"day":dayStr,
             @"hour":hoursStr,
             @"minute":minutesStr,
             @"second":secondsStr};
}


/**
 给钱加逗号(可带.00)

 @param priceStr 传入的钱
 @return 返回带逗号的钱
 */
+ (NSString *)  addCommaInMoneyWithString:(NSString *)priceStr {
    
    NSMutableString *tempStr = priceStr.mutableCopy;
    NSRange range = [priceStr rangeOfString:@"."];
    NSInteger index = 0;
    if (range.length > 0) {
        index = range.location;
    } else {
        index = priceStr.length;
    }
    while ((index - 3) > 0) {
        index -= 3;
        [tempStr insertString:@"," atIndex:index];
    }
    
    return tempStr;
}

/**
 判断字符串里面是否包含表情
 
 @param string 传入的字符串
 @return 返回YES代表有表情,NO代表没有
 */
+ (BOOL)stringContainsEmoji:(NSString *)string
{
    __block BOOL returnValue = NO;
    
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length])
                               options:NSStringEnumerationByComposedCharacterSequences
                            usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                const unichar hs = [substring characterAtIndex:0];
                                if (0xd800 <= hs && hs <= 0xdbff) {
                                    if (substring.length > 1) {
                                        const unichar ls = [substring characterAtIndex:1];
                                        const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                                        if (0x1d000 <= uc && uc <= 0x1f77f) {
                                            returnValue = YES;
                                        }
                                    }
                                } else if (substring.length > 1) {
                                    const unichar ls = [substring characterAtIndex:1];
                                    if (ls == 0x20e3) {
                                        returnValue = YES;
                                    }
                                } else {
                                    if (0x2100 <= hs && hs <= 0x27ff) {
                                        returnValue = YES;
                                    } else if (0x2B05 <= hs && hs <= 0x2b07) {
                                        returnValue = YES;
                                    } else if (0x2934 <= hs && hs <= 0x2935) {
                                        returnValue = YES;
                                    } else if (0x3297 <= hs && hs <= 0x3299) {
                                        returnValue = YES;
                                    } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                                        returnValue = YES;
                                    }
                                }
                            }];
    
    return returnValue;
}

- (BOOL)isWebUrl{
    NSString *strUrl = [self stringByReplacingOccurrencesOfString:@" " withString:@""];
    NSRegularExpression *regularexpression = [[NSRegularExpression alloc]
                                              initWithPattern:@"(http|ftp|https):\\/\\/[\\w\\-_]+(\\.[\\w\\-_]+)+([\\w\\-\\.,@?^=%&amp;:/~\\+#]*[\\w\\-\\@?^=%&amp;/~\\+#])?"
                                              options:NSRegularExpressionCaseInsensitive
                                              error:nil];
    NSUInteger numberofMatch = [regularexpression numberOfMatchesInString:strUrl
                                                                  options:NSMatchingReportProgress
                                                                    range:NSMakeRange(0, strUrl.length)];
    
    if(numberofMatch > 0) {
        return YES;
    }else{
        return NO;
    }
}

+ (NSMutableAttributedString *)attributeStringWithLeftStr:(NSString *)leftStr
                                                 rightStr:(NSString *)rightStr
                                                 leftFont:(UIFont *)leftFont
                                                rightFont:(UIFont *)rightFont
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",leftStr,rightStr]];
    [attributedString addAttribute:NSFontAttributeName value:leftFont range:NSMakeRange(0, leftStr.length)];
    [attributedString addAttribute:NSFontAttributeName value:rightFont range:NSMakeRange(leftStr.length, rightStr.length)];
    return attributedString;
}

+ (NSMutableAttributedString *)attributeStringWithLeftStr:(NSString *)leftStr
                                                 rightStr:(NSString *)rightStr
                                                 leftFont:(UIFont *)leftFont
                                                rightFont:(UIFont *)rightFont
                                                leftColor:(UIColor *)leftColor
                                               rightColor:(UIColor *)rightColor
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@%@",leftStr,rightStr]];
    [attributedString addAttribute:NSForegroundColorAttributeName value:leftColor range:NSMakeRange(0, leftStr.length)];
    [attributedString addAttribute:NSForegroundColorAttributeName value:rightColor range:NSMakeRange(leftStr.length, rightStr.length)];
    [attributedString addAttribute:NSFontAttributeName value:leftFont range:NSMakeRange(0, leftStr.length)];
    [attributedString addAttribute:NSFontAttributeName value:rightFont range:NSMakeRange(leftStr.length, rightStr.length)];
    return attributedString;
}

//根据时间戳获取星期几
+ (NSString *)getWeekDayFordate:(NSString *)data
{
    long long newData = [data longLongValue];
    NSArray *weekday = [NSArray arrayWithObjects: [NSNull null], @"周日", @"周一", @"周二", @"周三", @"周四", @"周五", @"周六", nil];
    
    NSDate *newDate = [NSDate dateWithTimeIntervalSince1970:newData];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [calendar components:NSCalendarUnitWeekday fromDate:newDate];
    
    NSString *weekStr = [weekday objectAtIndex:components.weekday];
    return weekStr;
}

//MARK:单独获取年月日时分秒
- (NSInteger)getYearWithFormatter:(NSString *)formatter {
    return [self getDateWithFormatter:formatter].year;
}

- (NSInteger)getMonthWithFormatter:(NSString *)formatter {
    return [self getDateWithFormatter:formatter].month;
}

- (NSInteger)getDayWithFormatter:(NSString *)formatter {
    return [self getDateWithFormatter:formatter].day;
}

- (NSInteger)getHourWithFormatter:(NSString *)formatter {
    return [self getDateWithFormatter:formatter].hour;
}

- (NSInteger)getMinuteWithFormatter:(NSString *)formatter {
    return [self getDateWithFormatter:formatter].minute;
}

- (NSInteger)getSecondWithFormatter:(NSString *)formatter {
    return [self getDateWithFormatter:formatter].second;
}

//MARK:获取下发日期的年月日时分秒
- (NSDate *)getDateWithFormatter:(NSString *)formatter {
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:formatter];
    NSDate *date =[dateFormat dateFromString:self];
    return date;
}

+ (NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:format]; //(@"YYYY-MM-dd hh:mm:ss") ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate* date = [formatter dateFromString:formatTime]; //------------将字符串按formatter转成nsdate
    //时间转时间戳的方法:
    NSInteger timeSp = [[NSNumber numberWithDouble:[date timeIntervalSince1970]] integerValue];
    SLLog(@"将某个时间转化成 时间戳&&&&&&&timeSp:%ld",(long)timeSp); //时间戳的值
    return timeSp;
}

/**返回 时:分:秒 */
+ (NSString *)getMMSSFromSS:(NSString *)totalTime {
    NSInteger seconds = [totalTime integerValue];
    //format of hour
//    NSString *str_hour = [NSString stringWithFormat:@"%02ld",seconds/3600];
    //format of minute
    NSString *str_minute = [NSString stringWithFormat:@"%02ld",(seconds%3600)/60];
    //format of second
    NSString *str_second = [NSString stringWithFormat:@"%02ld",seconds%60];
    //format of time
//    NSString *format_time = [NSString stringWithFormat:@"%@:%@:%@",str_hour,str_minute,str_second];
    NSString *format_time = [NSString stringWithFormat:@"%@:%@",str_minute,str_second];
    return format_time;
}

#pragma mark 计算视频大小
+ (CGFloat)fileVideoSize:(NSURL *)path
{
    return [[NSData dataWithContentsOfURL:path] length]/1024.00 ;
}

//MARK:字符串是否有效
- (BOOL)isValidStr {
    if ([self isKindOfClass:[NSString class]] && ![self isKindOfClass:[NSNull class]] && ([[self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length] > 0) && ![self isEqualToString:@"(null)"] && ![self isEqualToString:@"<null>"]) {
        return YES;
    }
    return NO;
}

+ (NSString *)GetHttpErrorInfoWithError:(NSError *)error
{
    NSString *tips;
    switch (error.code) {
        case -1001:
            //超时
            tips = @"请求超时，请检查您的网络状态";
            break;
        case -1005:
            //网络错误
            tips = @"当前网络不可用，请检查您的网络设置";
            break;
        case -1009:
            //脱机
            tips = @"数据请求失败，请检查您的网络设置";
            break;
        default:
            tips = @"数据请求失败，请重新尝试请求数据";
            break;
    }
    return tips;
}

@end
