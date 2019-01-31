//
//  UIButton+Style.h
//  Shopping
//
//  Created by 邝子涵 on 2017/3/14.
//  Copyright © 2017年  All rights reserved.
//

#import <UIKit/UIKit.h>

#import <Masonry.h>
@interface UIButton (Style)

- (void)styleWithRed:(NSString *)name;

- (void)styleWithGray:(NSString *)name;

/**
 按钮布局
 */
+(UIButton *)getButtonWithImageName:(NSString *)imageName
                          superView:(UIView *)superView
                         masonrySet:(void (^)(UIButton *btn,MASConstraintMaker *make))block;

//@property (nonatomic, strong) UILabel *ctnLabel;

@end
