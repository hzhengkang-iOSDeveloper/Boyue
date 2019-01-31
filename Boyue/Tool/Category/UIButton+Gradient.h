//
//  UIButton+Gradient.h
//  Shopping2.0
//
//  Created by henry jay on 2017/10/17.
//  Copyright © 2017年 
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(int, GradientType){
    GradientTypeHorizontal  =  1,   // 水平
    GradientTypeVertical            // 垂直
};

@interface UIButton (Gradient)


- (void)setBtnGradientStartColor:(UIColor *)startColor EndColor:(UIColor *)endColor GradientType:(GradientType)gradientType;

@end
