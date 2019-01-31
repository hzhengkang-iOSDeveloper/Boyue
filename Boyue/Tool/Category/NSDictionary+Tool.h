//
//  NSDictionary+Tool.h
//  iOSPaperCheck
//
//  Created by 胡正康 on 2018/11/14.
//  Copyright © 2018 JasonKang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (Tool)
#pragma mark 接口中需要将参数按升序排序加密后作为一个key，通过此方法实现
- (NSMutableString *)urlParmasSpliced;
@end

NS_ASSUME_NONNULL_END
