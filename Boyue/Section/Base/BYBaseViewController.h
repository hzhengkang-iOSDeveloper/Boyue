//
//  BYBaseViewController.h
//  Boyue
//
//  Created by 胡正康 on 2019/1/31.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BYBaseViewController : UIViewController
/**
 *  Nav 标题
 *
 *  此属性为自定义默认nav标题16号字体 NAV_TITLE_COLOR 色，
 *  如特殊页面需改变 Nav背景色 & 字体 & 颜色 请调用
 *  - (void)baseVC_layoutNavigationBar:(UIImage *)backGroundImage titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont
 */
@property (nonatomic, strong) UILabel *titleNavLabel;
// 上层VC名称
@property (nonatomic, copy) NSString *upVCName;

// 屏幕高
@property (nonatomic, assign) CGFloat screenHight;
// 屏幕宽
@property (nonatomic, assign) CGFloat screenWidth;



/**
 *  添加左按钮(两个)
 *
 *
 *
 *
 */
- (void)baseVC_addTwoLeftBtnWithsecondImage:(UIImage *)secondImage;
- (void)baseVC_backBarSecondButtonPressed:(UIButton *)sender;
// 添加nav自定义图片右按钮
- (void)baseVC_addRightBtnWithImage:(UIImage *)image btnClick:(void (^)(UIButton *))echo;
//添加nav自定义文字右按钮
- (void)baseVC_addRightBtnWithBtnTitle:(NSString *)btnTitle btnClick:(void (^)(UIButton *))echo;
/**
 *  添加右按钮(两个)
 *
 *  @param image 图片
 *
 *  @param echo 点击回调
 */
- (void)baseVC_addTwoRightBtnWithImage:(UIImage *)image
                              btnClick:(void (^)(UIButton *))echo
                           secondImage:(UIImage *)secondImage
                        secondBtnClick:(void (^)(UIButton *))secondEcho;
// 添加nav系统风格右按钮
- (void)baseVC_addRightBtnWithType:(UIBarButtonSystemItem)type btnClick:(void (^)(UIBarButtonItem *))echo;
// navBar开启半透明状态 && 关闭半自动布局 && 需要在nav下以（0，0）建TableView 时设置此属性
- (void)baseVC_noneEdgesForExtendedLayout;
// 设置nacBar背景图片 & 标题颜色 & 标题字体
- (void)baseVC_layoutNavigationBar:(UIImage *)backGroundImage titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont;
// 去除nav 上的line
- (void)baseVC_removeNavgationBarLine;
// 登录提示窗
- (void)baseVC_showShouldLoginActionSheet;
// 返回按钮触发
- (void)baseVC_backBarButtonPressed:(UIButton *)sender;
// 关闭屏幕边侧滑
- (void)baseVC_prohibitPopGesture;
// 删除Nav左按钮
- (void)baseVC_removeLiftBarButton;

/**
 *  先这么写，用不用URL导航总线还不一定，以防万一。
 *  push ~ 带动画
 */
- (void)baseVC_pushWithVC:(id)VC;
// push ~ 不带动画
- (void)baseVC_noAnimatedPushWithVC:(id)VC;
/**
 *  先pop掉当前VC 然后Push
 *  push ~ 带动画
 */
- (void)baseVC_popOldVCToPushWithVC:(id)VC;
// 隐藏键盘
- (void)hideKeyBoard;
@end

NS_ASSUME_NONNULL_END
