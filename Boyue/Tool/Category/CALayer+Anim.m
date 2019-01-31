//
//  CALayer+Anim.m
//  iOSPaperCheck
//
//  Created by 胡正康 on 2018/11/12.
//  Copyright © 2018 JasonKang. All rights reserved.
//

#import "CALayer+Anim.h"

@implementation CALayer (Anim)
/*
 *  摇动
 */
-(void)shake{
    
    CAKeyframeAnimation *kfa = [CAKeyframeAnimation animationWithKeyPath:@"transform.translation.x"];
    
    CGFloat s = 5;
    
    kfa.values = @[@(-s),@(0),@(s),@(0),@(-s),@(0),@(s),@(0)];
    
    //时长
    kfa.duration = 0.3f;
    
    //重复
    kfa.repeatCount = 2;
    
    //移除
    kfa.removedOnCompletion = YES;
    
    [self addAnimation:kfa forKey:@"shake"];
}

@end
