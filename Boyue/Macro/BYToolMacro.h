//
//  BYToolMacro.h
//  Boyue
//
//  Created by 胡正康 on 2019/1/31.
//

#ifndef BYToolMacro_h
#define BYToolMacro_h
#if DEBUG
#define SLLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d\n<%s>\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#elif DEVELOP
#define SLLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d\n<%s>\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#else
#define SLLog(FORMAT, ...) nil;
//#define SLLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d\n<%s>\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);

#endif

// 判断字段时候为空的情况
#define IF_NULL_TO_STRING(x) ([(x) isEqual:[NSNull null]]||(x)==nil)? @"":STRING(x)


// itoast
// 成功提示
#define HUD_SUCCESS(str)    [SYShowHUD showSuccess:str];
// 失败提示
#define HUD_ERROR(str)      [SYShowHUD showError:str];
// 文字提示
#define HUD_TIP(str)        [SYShowHUD showTip:str];
//菊花等待
#define HUD_SHOW        [SYShowHUD showWait];
//无背景菊花等待
#define HUD_NOBGSHOW        [SYShowHUD showNoBgWaitWith:NO];
#define HUD_NOBGSHOWTOUCH        [SYShowHUD showNoBgWaitWith:YES];

//隐藏菊花
#define HUD_HIDE        [SYShowHUD hideWait];

/******************************Code***************************/
#define CODE_SUCCESS  [result[@"code"]intValue] == 10000

#define CODE_10061  [result[@"code"]intValue] == 10061
#define CODE_10060  [result[@"code"]intValue] == 10060
#define CODE_19003  [result[@"code"]intValue] == 19003
#define CODE_19001  [result[@"code"]intValue] == 19001
#define CODE_20003  [result[@"code"]intValue] == 20003
#define CODE_20004  [result[@"code"]intValue] == 20004
#define CODE_34000  [result[@"code"]intValue] == 34000
#define CODE_19004  [result[@"code"]intValue] == 19004
#define CODE_20000  [result[@"code"]intValue] == 20000
#define CODE_18000  [result[@"code"]intValue] == 18000
#define CODE_18006  [result[@"code"]intValue] == 18006
#define CODE_18005  [result[@"code"]intValue] == 18005
#define CODE_18018  [result[@"code"]intValue] == 18018


//=====================单例==================
// @interface
#define singleton_interface(className) \
+ (className *)shared;


// @implementation
#define singleton_implementation(className) \
static className *_instance; \
+ (id)allocWithZone:(NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [super allocWithZone:zone]; \
}); \
return _instance; \
} \
+ (className *)shared \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instance = [[self alloc] init]; \
}); \
return _instance; \
}
//========================end==================

#endif /* BYToolMacro_h */
