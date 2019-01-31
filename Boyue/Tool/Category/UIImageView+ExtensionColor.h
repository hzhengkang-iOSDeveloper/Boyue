//
//  UIImageView+ExtensionColor.h
//  iOSPaperCheck
//
//  Created by 胡正康 on 2018/11/15.
//  Copyright © 2018 JasonKang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum  {
    ImgColor_topToBottom = 0,//从上到小
    ImgColor_leftToRight = 1,//从左到右
    ImgColor_upleftTolowRight = 2,//左上到右下
    ImgColor_uprightTolowLeft = 3,//右上到左下
}ImgColorGradientType;
NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (ExtensionColor)

- (void)changeFromColorArray:(NSMutableArray*)colorArray ByGradientType:(ImgColorGradientType)gradientType;
@end

NS_ASSUME_NONNULL_END
