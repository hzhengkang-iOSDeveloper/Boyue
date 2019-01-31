//
//  BYUserInfo.m
//  Boyue
//
//  Created by 胡正康 on 2019/1/31.
//

#import "BYUserInfo.h"
#define kEncodedObjectPath_User ([[NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"user"])  //将用户的信息，存储到Library文件中

@implementation BYUserInfo

@end
