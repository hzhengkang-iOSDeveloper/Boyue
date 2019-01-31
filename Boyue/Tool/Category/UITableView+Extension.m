//
//  UITableView+Extension.m
//  Shopping2.0
//
//  Created by chenpeng on 17/3/6.
//  Copyright © 2017年 HongHui(Shanghai)Information Technology Service Co.,Ltd. All rights reserved.
//

#import "UITableView+Extension.h"

@implementation UITableView (Extension)

/**
 *  数据为0 或加载失败显示无数据样式(文字)
 *
 *  @param rowCount TableView 的 组／行 数
 */
- (void)tableViewNoDataOrNewworkFailShowTitleWithRowCount:(NSInteger)rowCount {
    
    if (rowCount == 0) {
        UILabel *bgLab = [[UILabel alloc] init];
        bgLab.text = @"暂时没有历史记录";
        bgLab.textColor = C_Gray_666666;
        bgLab.font = F19;
        bgLab.textAlignment = NSTextAlignmentCenter;
        self.backgroundView = bgLab;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }else {
        self.backgroundView = nil;
    }
}
/**
 *  数据为0 或加载失败显示无数据样式
 *
 *  @param rowCount TableView 的 组／行 数
 */
- (void)tableViewNoDataOrNewworkFailWithRowCount:(NSInteger)rowCount {

    if (rowCount == 0) {
        UIImageView *bgImgV = [[UIImageView alloc] initWithFrame:self.frame];
        bgImgV.image = [UIImage imageNamed:@"main_nodata"];
        bgImgV.contentMode = UIViewContentModeCenter;
        self.backgroundView = bgImgV;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }else {
        self.backgroundView = nil;
    }
}

- (void)tableViewNoDataOrNewworkFailDown:(NSInteger)rowCount{
    if (rowCount == 0) {
        UIImageView *imgView = [[UIImageView alloc] init];
        imgView.image = [UIImage imageNamed:@"notfound"];
        imgView.contentMode = UIViewContentModeCenter;
        imgView.frame = CGRectMake(0, 250, SCREEN_WIDTH, SCREEN_WIDTH);
        UIView *view = [[UIView alloc] initWithFrame:self.frame];
        [view addSubview:imgView];
        self.backgroundView = view;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }else{
        self.backgroundView = nil;
    }
}

/**
 *  数据为0 或加载失败显示无数据样式(view)
 *
 *  @param rowCount TableView 的 组／行 数
 */
- (void)tableViewNoDataOrNewworkFailShowViewWithRowCount:(NSInteger)rowCount view:(UIView *)view{
    
    if (rowCount == 0) {
        self.backgroundView = view;
        self.separatorStyle = UITableViewCellSeparatorStyleNone;
    }else {
        self.backgroundView = nil;
    }
}

@end
