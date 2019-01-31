//
//  BYUtilsMacro.h
//  Boyue
//
//  Created by 胡正康 on 2019/1/31.
//

#ifndef BYUtilsMacro_h
#define BYUtilsMacro_h
// 转换为字符串
#define STRING(x) [NSString stringWithFormat:@"%@",x]
#define s_Num(num) [NSString stringWithFormat:@"%d",num]
#define s_Integer(num) [NSString stringWithFormat:@"%ld",num]
#define s_float(float) [NSString stringWithFormat:@"%.2f",float];

// 转为URL
#define URL(url) [NSURL URLWithString:url]

// 获取屏幕 宽、高
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

// rgb颜色转换（16进制->10进制）
#define RGB16(rgbValue) [UIColor colorWithHexString:rgbValue]
// 设置颜色RGB
#define RGBA(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

//定义UIImage对象
#define ImageNamed(name) [UIImage imageNamed:name]


// UserDefaults 存取
#define UserDefaultsGet(KEY)          [[NSUserDefaults standardUserDefaults] objectForKey:KEY]
#define UserDefaultsSet(VALUE,KEY)    [[NSUserDefaults standardUserDefaults] setObject:VALUE forKey:KEY]

// 设备判断
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)
#define SCREEN_MAX_LENGTH (MAX(SCREEN_WIDTH, SCREEN_HEIGHT))
#define SCREEN_MIN_LENGTH (MIN(SCREEN_WIDTH, SCREEN_HEIGHT))
#define IS_IPHONE_5 (IS_IPHONE && SCREEN_MAX_LENGTH == 568.0)
#define IS_IPHONE_6 (IS_IPHONE && SCREEN_MAX_LENGTH == 667.0)
#define IS_IPHONE_6P (IS_IPHONE && SCREEN_MAX_LENGTH == 736.0)
#define IS_IPHONE_X  (IS_IPHONE && [UIScreen mainScreen].bounds.size.height > 810)
#define isMYPad ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad ? YES:NO)

#define iPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
//判断iPHoneXr
#define IS_IPHONE_Xr ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) : NO)
//判断iPhoneXs
#define IS_IPHONE_Xs ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
//判断iPhoneXs Max
#define IS_IPHONE_Xs_Max ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !isMYPad : NO)

#define IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define IS_PAD (UI_USER_INTERFACE_IDIOM()== UIUserInterfaceIdiomPad)
#define KStandardW (IS_IPHONE ? 375 : 768)
#define KStandardH (IS_IPHONE ? 667 : 1024)
#define kScreenWidthRatio  (UIScreen.mainScreen.bounds.size.width / KStandardW)
#define kScreenHeightRatio (UIScreen.mainScreen.bounds.size.height / KStandardH)
#define AdaptedWidth(x)  ceilf((x) * kScreenWidthRatio)
#define AdaptedHeight(x) ceilf((x) * kScreenHeightRatio)
#define AdaptedFontSize(R)     [UIFont systemFontOfSize:AdaptedWidth(R)]
#define AdaptedBoldFontSize(R)    [UIFont boldSystemFontOfSize:AdaptedWidth(R)]

///正常字体
#define F30 [UIFont systemFontOfSize:30]
#define F29 [UIFont systemFontOfSize:29]
#define F28 [UIFont systemFontOfSize:28]
#define F27 [UIFont systemFontOfSize:27]
#define F26 [UIFont systemFontOfSize:26]
#define F25 [UIFont systemFontOfSize:25]
#define F24 [UIFont systemFontOfSize:24]
#define F23 [UIFont systemFontOfSize:23]
#define F22 [UIFont systemFontOfSize:22]
#define F20 [UIFont systemFontOfSize:20]
#define F19 [UIFont systemFontOfSize:19]
#define F18 [UIFont systemFontOfSize:18]
#define F17 [UIFont systemFontOfSize:17]
#define F16 [UIFont systemFontOfSize:16]
#define F15 [UIFont systemFontOfSize:15]
#define F14 [UIFont systemFontOfSize:14]
#define F13 [UIFont systemFontOfSize:13]
#define F12 [UIFont systemFontOfSize:12]
#define F11 [UIFont systemFontOfSize:11]
#define F10 [UIFont systemFontOfSize:10]
#define F8 [UIFont systemFontOfSize:8]

///粗体
#define FB50 [UIFont boldSystemFontOfSize:50]
#define FB44 [UIFont boldSystemFontOfSize:44]
#define FB40 [UIFont boldSystemFontOfSize:40]
#define FB38 [UIFont boldSystemFontOfSize:38]
#define FB32 [UIFont boldSystemFontOfSize:32]
#define FB30 [UIFont boldSystemFontOfSize:30]
#define FB24 [UIFont boldSystemFontOfSize:24]
#define FB25 [UIFont boldSystemFontOfSize:25]
#define FB26 [UIFont boldSystemFontOfSize:26]
#define FB27 [UIFont boldSystemFontOfSize:27]
#define FB20 [UIFont boldSystemFontOfSize:20]
#define FB21 [UIFont boldSystemFontOfSize:21]
#define FB19 [UIFont boldSystemFontOfSize:19]
#define FB18 [UIFont boldSystemFontOfSize:18]
#define FB16 [UIFont boldSystemFontOfSize:16]
#define FB15 [UIFont boldSystemFontOfSize:15]
#define FB14 [UIFont boldSystemFontOfSize:14]
#define FB13 [UIFont boldSystemFontOfSize:13]
#define FB12 [UIFont boldSystemFontOfSize:12]
#define FB11 [UIFont boldSystemFontOfSize:11]
#define FB10 [UIFont boldSystemFontOfSize:10]
#define FB8 [UIFont boldSystemFontOfSize:8]


// UI默认字体
#define FP11 F11
#define FP12 F12
#define FP13 F13
#define FP14 F14
#define FP15 F15
#define FP16 F16
#define FP17 F17
#define FP18 F18
#define FP19 F19
#define FP20 F20
#define FP21 F21
#define FP22 F22
#define FP24 F24

//UI要求颜色
//导航栏标题灰色
#define C_Gray_9A9DAE  RGB16(@"#9A9DAE")
//导航栏标题选中
#define C_DeepGray_555A73  RGB16(@"#555A73")
//基佬紫
#define C_Gay_3E47FF   RGB16(@"#3E47FF")
//边框灰
#define C_Gray_F1F1F1   RGB16(@"#F1F1F1")
//登录框背景色
#define C_Gray_FBFBFB   RGB16(@"#FBFBFB")
//验证码颜色
#define C_Gay_443CFF   RGB16(@"#443CFF ")
//验证码边框
#define C_2961FF     RGB16(@"#2961FF ")
//登录按钮背景色
#define C_C1D2E3    RGB16(@"#C1D2E3")
#define C_FBFBFB  RGB16(@"#FBFBFB")
#define C_B6B9C4  RGB16(@"#B6B9C4")
#define C_318AFF  RGB16(@"#318AFF")
#define C_9296A6  RGB16(@"#9296A6")
#define C_4B5068  RGB16(@"#4B5068")
#define C_4C22FF  RGB16(@"#4C22FF")
#define C_2258FF  RGB16(@"#2258FF")
#define C_DEE8F6  RGB16(@"#DEE8F6")
#define C_6F758E  RGB16(@"#6F758E")
#define C_EFF4FB  RGB16(@"#EFF4FB")
#define C_7B8095    RGB16(@"#7B8095")
#define C_E8EDF4    RGB16(@"#E8EDF4")
#define C_5585FF   RGB16(@"#5585FF")
#define C_585D75   RGB16(@"#585D75")
#define C_D1DEEA   RGB16(@"#D1DEEA")
#define C_ADB0BC   RGB16(@"#ADB0BC")
#define C_EFEFEF    RGB16(@"#EFEFEF")
#define C_FAFAFA    RGB16(@"#FAFAFA")
#define C_CA4747   RGB16(@"#CA4747")
#define C_B9CCDF   RGB16(@"#B9CCDF")
#define C_87A5C3   RGB16(@"#87A5C3")
#define C_EA6A24   RGB16(@"#EA6A24")
#define C_1CB581   RGB16(@"#1CB581")
#define C_33CB45   RGB16(@"#33CB45")
#define C_1A76FF   RGB16(@"#1A76FF")
#define C_517CFF   RGB16(@"#517CFF")
#define C_64D5FF   RGB16(@"#64D5FF")
#define C_63D1FF   RGB16(@"#63D1FF")
#define C_E2EBF7   RGB16(@"#E2EBF7")
#define C_555A73   RGB16(@"#555A73")
#define C_8F93A4   RGB16(@"#8F93A4")
#define C_EBEFF5   RGB16(@"#EBEFF5")
#define C_610074FF   RGB16(@"#610074FF")
#define C_2862FF   RGB16(@"#2862FF")
#define C_0074FF   RGB16(@"#0074FF")
#define C_189CFF   RGB16(@"#189CFF")
#define C_B56161   RGB16(@"#B56161")
#define C_529F81   RGB16(@"#529F81")
#define C_EBEBEB   RGB16(@"#EBEBEB")
#define C_C4C2C2   RGB16(@"#C4C2C2")
#define C_2B343E   RGB16(@"#2B343E")
#define C_D2D2D2   RGB16(@"#D2D2D2")
#define C_374FB4   RGB16(@"#374FB4")
#define C_C5C5C5   RGB16(@"#C5C5C5")
#define C_FF0000   RGB16(@"#FF0000")
#define C_E5E5E5   RGB16(@"#E5E5E5")
#define C_073569   RGB16(@"#073569")
#define C_488DEB   RGB16(@"#488DEB")
#define C_EEEEEE   RGB16(@"#EEEEEE")
#define C_4767F0   RGB16(@"#4767F0")
#define C_7D7D7D   RGB16(@"#7D7D7D")
#define C_F8F8F9   RGB16(@"#F8F8F9")
#define C_F0082E   RGB16(@"#F0082E")
#define C_29313C   RGB16(@"#29313C")

// 白色
#define C_White_FFFFFF RGB16(@"#FFFFFF")
// 灰色
#define C_Gray_666666 RGB16(@"#666666")
// 浅灰
#define C_LightGray_999999 RGB16(@"#999999")
// 黑色
#define C_Black_333333 RGB16(@"#333333")
// 亮红色
#define C_LightRed_EB3349 RGB16(@"#EB3349")
// 淡红色
#define C_LightMostRed_FEF7F8  RGB16(@"#FEF7F8")
// 浅灰+
#define C_Gray_F1F0F0 RGB16(@"#F1F0F0")
// 浅灰+
#define C_Gray_F7F7F7 RGB16(@"#F7F7F7")
// 灰色字体
#define C_GrayFont_C0C0C0 RGB16(@"#C0C0C0")
// DDDDDD灰色
#define C_GrayD_DDDDDD RGB16(@"#DDDDDD")
// 4C4B4C黑色
#define C_BlackD_4C4B4C RGB16(@"#4C4B4C")
// FEEC9E黄色
#define C_Yellow_FEEC9E RGB16(@"#FEEC9E")
// #4B8EFF蓝色
#define C_BLUR_4B8EFF RGB16(@"#4B8EFF")
// #FFA500黄色
#define C_Yellow_FFA500 RGB16(@"#FFA500")
// #DCC07B黄色
#define C_Yellow_DCC07B RGB16(@"#DCC07B")
// #231716黑色
#define C_Black_231716  RGB16(@"#231716")
// #DCB455黄色
#define C_Yellow_DCB455 RGB16(@"#DCB455")
// #D8D8D8灰色
#define C_Gray_D8D8D8   RGB16(@"#D8D8D8")
// #EC3848红色
#define C_Red_EC3848    RGB16(@"#EC3848")
// #F45C43红色
#define C_Red_F45C43    RGB16(@"#F45C43")
// #FC8F9C粉红色
#define C_LightMostRed_FC8F9C  RGB16(@"#FC8F9C")
// #ACACAC灰色
#define C_Gray_ACACAC   RGB16(@"#ACACAC")
// #F221A8粉色
#define C_Pink_F221A8   RGB16(@"#F221A8")
// #8854F7紫色
#define C_Purple_8854F7   RGB16(@"#8854F7")
// #9F4EFA紫色
#define C_Purple_9F4EFA   RGB16(@"#9F4EFA")
// #BA67FF紫色
#define C_Purple_BA67FF   RGB16(@"#BA67FF")
// #9D4CF9紫色
#define C_Purple_9D4CF9   RGB16(@"#9D4CF9")
// #E6E6E6灰色
#define C_Gray_E6E6E6   RGB16(@"#E6E6E6")
// #AC62F7紫色
#define C_Purple_AC62F7   RGB16(@"#AC62F7")
// #F46060红色
#define C_Red_F46060     RGB16(@"#F46060")
// #D1E792淡绿色
#define C_Green_D1E792   RGB16(@"#D1E792")
// #F3D939黄色
#define C_Yellow_FFA179  RGB16(@"#FFA179")
// #FF7940红色
#define C_Red_FF7940     RGB16(@"#FF7940")
// #F1D7D6粉红色
#define C_LightMostRed_F1D7D6  RGB16(@"#F1D7D6")
// #EB3B35红色
#define C_Red_EB3B35    RGB16(@"#EB3B35")

#define C_4E6DF4   RGB16(@"#4E6DF4")

#define C_Line RGBA(240, 240, 240, 1)

#define UIHexColor(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


// TODO: 临时处理
//无敌适配宏_高
#define AD_HEIGHT(S)      ([UIScreen mainScreen].bounds.size.height / ((IS_IPHONE_X ? 812.0 : 667.0) / (S)))
//无敌适配宏_宽
#define AD_WIDTH(S)       ([UIScreen mainScreen].bounds.size.width / (375.0 / (S)))

// navBar 的高度
#define navBarH   44
#define tabH     49
#define navH              (STATUSBAR_H + navBarH)
// 状态栏高度
#define STATUSBAR_H       ([UIApplication sharedApplication].statusBarFrame.size.height)

#endif /* BYUtilsMacro_h */
