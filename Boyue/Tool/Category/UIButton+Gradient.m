//
//  UIButton+Gradient.m
//  Shopping2.0
//
//  Created by henry jay on 2017/10/17.
//  Copyright © 2017年 HongHui(Shanghai)Information Technology Service Co.,Ltd. All rights reserved.
//

#import "UIButton+Gradient.h"

@implementation UIButton (Gradient)

- (void)setBtnGradientStartColor:(UIColor *)startColor EndColor:(UIColor *)endColor GradientType:(GradientType)gradientType {
    //渐变
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)startColor.CGColor,  (__bridge id)endColor.CGColor];
    gradientLayer.locations = @[@0, @1.0];
    switch (gradientType) {
        case GradientTypeHorizontal:
            gradientLayer.startPoint = CGPointMake(0, 0);
            gradientLayer.endPoint = CGPointMake(1.0, 0);
            break;
        case GradientTypeVertical:
            gradientLayer.startPoint = CGPointMake(0, 0);
            gradientLayer.endPoint = CGPointMake(0, 1.0);
            break;
    }
    
    gradientLayer.frame = self.bounds;
    [self.layer addSublayer:gradientLayer];
}

@end
