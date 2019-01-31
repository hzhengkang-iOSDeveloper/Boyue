//
//  NSString+Extension.h
//  Shopping2.0
//
//  Created by chenpeng on 17/3/6.
//  Copyright © 2017年 
//

#import <Foundation/Foundation.h>

@interface NSString (Extension)

/**
 *  @brief  根据一定宽度返回高度
 *  @category
 *  @param  goalString      目标字符串
 *  @param  font            字号
 *  @param  width         固定的宽/高
 **/
+ (CGFloat)getStringHeightWith:(NSString *)goalString withStringFont:(UIFont *)font withWidth:(CGFloat)width ;


/**
 *  @brief  根据传入的range和color返回一个特殊富文本
 *  @category
 *  @param  range      传入的range
 *  @param  color      传入的color
 *  @param  width      传入的font
 **/
- (NSMutableAttributedString *)getAttrStringWithRange:(NSRange)range color:(id)color font:(id)font;

/**
 *  @brief  时间戳转化为时间年月日用点隔开(不显示秒)
 *  @category
 *  @param  timeString      字符串格式的时间戳
 **/
+ (NSString *)usePointNoSecondTimeWithTimeIntervalString:(NSString *)timeString;

/**
 *  @brief  时间戳转化为时间(不显示秒)
 *  @category
 *  @param  timeString      字符串格式的时间戳
 **/
+ (NSString *)noSecondTimeWithTimeIntervalString:(NSString *)timeString;

/**
 *  @brief  时间戳转化为时间
 *  @category
 *  @param  timeString      字符串格式的时间戳
 **/
+ (NSString *)timeWithTimeIntervalString:(NSString *)timeString;


/**
 *  @brief  时间戳转化为时间
 *  @category
 *  @param  timeString      字符串格式的时间戳
 **/
+ (NSString *)mostSimpleTimeWithTimeIntervalString:(NSString *)timeString;

/**
 *  @brief  时间戳转化为时间 xx月xx日
 *  @category
 *  @param  timeString      字符串格式的时间戳
 **/
+ (NSString *)simpleMouthAndDayTimeWithTimeIntervalString:(NSString *)timeString;

/**
 *  @brief  时间戳转化为时间 xx月xx日xx:xx
 *  @category
 *  @param  timeString      字符串格式的时间戳
 **/
+ (NSString *)UseMouthAndDayHoursTimeWithTimeIntervalString:(NSString *)timeString;

/**
 *  @brief  时间戳转化为时间 某个时间到某个时间
 *  @category
 *  @param  timeString      字符串格式的时间戳
 **/
+ (NSString *)UseTimeToTimeMouthAndDayHoursTimeWithTimeIntervalFirstString:(NSString *)fTimeString SecondString:(NSString *) sTimeString;

/**
 *  @brief  时间戳转化为时间
 *  @category
 *  @param  timeString      字符串格式的时间戳
 **/
+ (NSString *)simpleTimeWithTimeIntervalString:(NSString *)timeString;

/**
 *  @brief  时间戳转化为时间(用点来隔开的年.月.日)
 *  @category
 *  @param  timeString      字符串格式的时间戳
 **/
+ (NSString *)simplePointTimeWithTimeIntervalString:(NSString *)timeString;
/**
 *  @brief  时间戳转化为时间(用点来隔开的月.日)
 *  @category
 *  @param  timeString      字符串格式的时间戳
 **/
+ (NSString *)simpleNew_PointTimeWithTimeIntervalString:(NSString *)timeString;
/**
 *  @brief  时间戳转化为自定义时间格式
 *  @category
 *  @param  timeString      字符串格式的时间戳
 *  @param  format      自定义的时间格式
 **/
+ (NSString *)CustomerTimeWithTimeIntervalString:(NSString *)timeString  withFormatter:(NSString *)format;
/**
 * 获取当前时间戳
 */
+ (NSString *)nowTime;

/**
 * 计算指定时间与当前的时间差
 * @param timeString   某一指定时间
 * @return 多少(秒or分or天or月)+前 (比如，3天前、10分钟前)
 */
+ (NSString *) compareCurrentTime:(NSString *)timeString;

/**
 * 字符串转base64
 * @param str   目标字符串
 * @return base64后的字符串
 */
+ (NSString *)base64String:(NSString *)str;

/**
 * 字符串转base64 UTF8编码
 * @param str   目标字符串
 * @return base64后的字符串
 */
+ (NSString *)base64UTF8String:(NSString *)str;

/**
 * 字符串转MD5
 * @param input   目标字符串
 * @return MD5后的字符串
 */
+ (NSString *) md5:(NSString *) input;
/**
 * 字符串去空格
 * @param input   目标字符串
 * @return 去除空格后的字符串
 */
+ (NSString *)removeEmpty:(NSString *) input;
/**
 * 字符串去空格(用于搜索去拼音空格)
 * @param input   目标字符串
 * @return 去除空格后的字符串
 */
+ (NSString *)removeEmptyForSearch:(NSString *) input;
/**
 * 字符串去首尾空格
 * @param input   目标字符串
 * @return 去除空格后的字符串
 */
+ (NSString *)removeFirstAndLastEmpty:(NSString *) input;
/**
 * 字符串去换行
 * @param input   目标字符串
 * @return 去除换行后的字符串
 */
+ (NSString *)removeNewline:(NSString *)input;
/**
 * 32位随机字符串
 */
+ (NSString *)shuffledAlphabet;

+ (NSString *)getNowTimeWithString:(NSString *)aTimeString;

+ (NSDictionary *)getNowTimeDictWithString:(NSString *)aTimeString;

/**
 给钱加逗号(可带.00)
 
 @param priceStr 传入的钱
 @return 返回带逗号的钱  
 */
+ (NSString *)addCommaInMoneyWithString:(NSString *)priceStr;

/**
 判断字符串里面是否包含表情
 
 @param string 传入的字符串
 @return 返回YES代表有表情,NO代表没有
 */
+ (BOOL)stringContainsEmoji:(NSString *)string;

/*
 是否为网址
 */
- (BOOL)isWebUrl;
//根据时间戳获取星期几
+ (NSString *)getWeekDayFordate:(NSString *)data;
//MARK:获取时间组件
- (NSInteger)getYearWithFormatter:(NSString *)formatter;
- (NSInteger)getMonthWithFormatter:(NSString *)formatter;
- (NSInteger)getDayWithFormatter:(NSString *)formatter;
- (NSInteger)getHourWithFormatter:(NSString *)formatter;
- (NSInteger)getMinuteWithFormatter:(NSString *)formatter;
- (NSInteger)getSecondWithFormatter:(NSString *)formatter;
- (NSDate *)getDateWithFormatter:(NSString *)formatter;
/**
 @param formatTime 待转时间字符串
 @param format 时间字符串格式
 @return 时间戳
 */
+ (NSInteger)timeSwitchTimestamp:(NSString *)formatTime andFormatter:(NSString *)format;

+ (NSMutableAttributedString *)attributeStringWithLeftStr:(NSString *)leftStr
                                                 rightStr:(NSString *)rightStr
                                                 leftFont:(UIFont *)leftFont
                                                rightFont:(UIFont *)rightFont;

+ (NSMutableAttributedString *)attributeStringWithLeftStr:(NSString *)leftStr
                                                 rightStr:(NSString *)rightStr
                                                 leftFont:(UIFont *)leftFont
                                                rightFont:(UIFont *)rightFont
                                                leftColor:(UIColor *)leftColor
                                               rightColor:(UIColor *)rightColor;
/**返回 时:分:秒 */
+ (NSString *)getMMSSFromSS:(NSString *)totalTime;
//计算视频大小
+ (CGFloat)fileVideoSize:(NSURL *)path;


/**
 判断字符串是否有效
 */
- (BOOL)isValidStr;

+ (NSString *)GetHttpErrorInfoWithError:(NSError *)error;

@end
