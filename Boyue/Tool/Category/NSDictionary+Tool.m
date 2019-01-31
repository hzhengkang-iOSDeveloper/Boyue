//
//  NSDictionary+Tool.m
//  iOSPaperCheck
//
//  Created by 胡正康 on 2018/11/14.
//  Copyright © 2018 JasonKang. All rights reserved.
//

#import "NSDictionary+Tool.h"

@implementation NSDictionary (Tool)
#pragma mark 接口中需要将参数按升序排序加密后作为一个key，通过此方法实现
- (NSMutableString *)urlParmasSpliced {
    NSMutableString* urlstring = [NSMutableString string];
    NSArray* parmasKeys = [self.allKeys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return  [obj1 compare:obj2];
    }];
    for (NSString*key in parmasKeys) {
        [urlstring appendFormat:@"%@=%@&", key, self[key]];
    }
    [urlstring deleteCharactersInRange:NSMakeRange(urlstring.length-1, 1)];
    return urlstring;
}
@end
