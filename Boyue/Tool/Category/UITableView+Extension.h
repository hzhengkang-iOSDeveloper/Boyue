//
//  UITableView+Extension.h
//  Shopping2.0
//
//  Created by chenpeng on 17/3/6.
//  Copyright © 2017年 .
//

#import <UIKit/UIKit.h>

@interface UITableView (Extension)

/**
 *  数据为0 或加载失败显示无数据样式(文字)
 *
 *  @param rowCount TableView 的 组／行 数
 */
- (void)tableViewNoDataOrNewworkFailShowTitleWithRowCount:(NSInteger)rowCount;
/**
 *  数据为0 或加载失败显示无数据样式
 *
 *  @param rowCount TableView 的 组／行 数
 */
- (void)tableViewNoDataOrNewworkFailWithRowCount:(NSInteger)rowCount;

- (void)tableViewNoDataOrNewworkFailDown:(NSInteger)rowCount;

/**
 *  数据为0 或加载失败显示无数据样式(view)
 *
 *  @param rowCount TableView 的 组／行 数
 */
- (void)tableViewNoDataOrNewworkFailShowViewWithRowCount:(NSInteger)rowCount view:(UIView *)view;

@end
