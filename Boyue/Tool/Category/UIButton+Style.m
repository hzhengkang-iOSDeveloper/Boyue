//
//  UIButton+Style.m
//  Shopping
//
//  Created by 邝子涵 on 2017/3/14.
//  Copyright © 2017年 鸿惠(上海)信息技术服务有限公司. All rights reserved.
//

#import "UIButton+Style.h"

@implementation UIButton (Style)


- (void)styleWithRed:(NSString *)name {
    [self borderViewStyleWithCornerRadius:3 withColor:[UIColor clearColor]];
    [self setTitle:name forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.titleLabel.font = F16;
    self.backgroundColor = C_LightRed_EB3349;
}


- (void)styleWithGray:(NSString *)name {
    [self borderViewStyleWithCornerRadius:3 withColor:[UIColor clearColor]];
    [self setTitle:name forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.titleLabel.font = F12;
    self.backgroundColor = C_Gray_666666;
}


- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent*)event{
    //获取当前button的实际大小
    CGRect bounds = self.bounds;
    //若原热区小于44x44，则放大热区，否则保持原大小不变
    CGFloat widthDelta = MAX(44.0 - bounds.size.width, 0);
    CGFloat heightDelta = MAX(44.0 - bounds.size.height, 0);
    //扩大bounds
    bounds = CGRectInset(bounds, -0.5 * widthDelta, -0.5 * heightDelta);
    //如果点击的点 在 新的bounds里，就返回YES
    return CGRectContainsPoint(bounds, point);
}

+(UIButton *)getButtonWithImageName:(NSString *)imageName
                          superView:(UIView *)superView
                         masonrySet:(void (^)(UIButton *btn,MASConstraintMaker *make))block {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor whiteColor];
    if ([imageName isValidStr]) {
        [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    btn.translatesAutoresizingMaskIntoConstraints = NO;
    [superView addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        if (block) {
            block(btn,make);
        }
    }];
    return btn;
}

@end
