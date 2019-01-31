//
//  BYUserInfo.h
//  Boyue
//
//  Created by 胡正康 on 2019/1/31.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface BYUserInfo : NSObject
//@property (nonatomic, assign) BOOL isLogin;//是否登录
@property (nonatomic, copy) NSString *userName;//用户名
@property (nonatomic, copy) NSString *userImage;//头像
@property (nonatomic, copy) NSString *myCookie;//作为token的mycookie，从获取验证码的header中获取
@property (nonatomic, copy) NSString *msgCode;//登录时的短信验证码
@property (nonatomic, copy) NSString *telNumber;//电话号码
@property (nonatomic, copy) NSString *v;
//用户模型单例
+ (BYUserInfo *)sharedUserInfo;
//存储用户信息
+ (BOOL)synchronize;
//是否登录
+ (BOOL)isLogIn;
//退出App
+ (BOOL)logout;

@end

NS_ASSUME_NONNULL_END
