//
//  BYBaseViewController.m
//  Boyue
//
//  Created by 胡正康 on 2019/1/31.
//

#import "BYBaseViewController.h"
// Nav 系统风格右按钮点击回调Block类型
typedef void(^axcBaseClickBaseRightTypeBtn)(UIBarButtonItem *sender);
// Nav 自定义图片右按钮点击回调Block类型
typedef void(^axcBaseClickBaseRightImageBtn)(UIButton *sender);
// Nav 自定义图片右按钮点击回调Block类型2
typedef void(^axcBaseClickBaseRightSecondImageBtn)(UIButton *sender);


@interface BYBaseViewController ()<UIGestureRecognizerDelegate>
// Nav 系统风格右按钮点击回调Block属性
@property (nonatomic, copy) axcBaseClickBaseRightTypeBtn rightTypeBtnClickBlock;
// Nav 自定义图片右按钮点击回调Block属性
@property (nonatomic, copy) axcBaseClickBaseRightImageBtn rightImageBtnClickBlock;
// Nav 自定义图片右按钮点击回调Block属性2
@property (nonatomic, copy) axcBaseClickBaseRightSecondImageBtn rightSecondImageBtnClickBlock;

@end

@implementation BYBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置BaseUI
    [self setupBaseUI];
}

- (void)setupBaseUI {
    // 背景色
    self.view.backgroundColor = [UIColor whiteColor];
    // 关闭navbar半透明
    //self.navigationController.navigationBar.translucent = NO;
    // 关闭半自动布局
    self.automaticallyAdjustsScrollViewInsets = NO;
    // 自定义返回按钮
    [self backBarButton];
    // Nav 标题
    [self navTitle];
    
    
}

// Nav 标题
- (void)navTitle {
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH - 150, 44)];
    self.titleNavLabel = title;
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = C_29313C;
    title.font = F17;
    self.navigationItem.titleView = title;
    
    self.navigationController.navigationBar.barTintColor = C_White_FFFFFF;
    
    UIView *backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, navH)];
    [backView setBackgroundColor:C_White_FFFFFF];
    
    [self.navigationController.navigationBar setBackgroundImage: [self convertViewToImage:backView] forBarMetrics:UIBarMetricsDefault];
    //    [self.navigationController.navigationBar setBackgroundImage: iPhoneX?[UIImage imageNamed:@"navBgImgX"]:[UIImage imageNamed:@"navBgImg"] forBarMetrics:UIBarMetricsDefault];
    //    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navBgImage"] forBarPosition:UIBarPositionTop barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    // 状态栏背景色
    [self setStatusBarBackgroundColor:[UIColor clearColor]];
    
    
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}
/**
 设置状态栏背景颜色
 */
- (void)setStatusBarBackgroundColor:(UIColor *)color {
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = color;
    }
}
-(UIImage*)convertViewToImage:(UIView*)v{
    CGSize s = v.bounds.size;
    // 下面方法，第一个参数表示区域大小。第二个参数表示是否是非透明的。如果需  要显示半透明效果，需要传NO，否则传YES。第三个参数就是屏幕密度了
    UIGraphicsBeginImageContextWithOptions(s, YES, [UIScreen mainScreen].scale);
    [v.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

// 自定义返回按钮
- (void)backBarButton {
    //    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 11, 18)];
    //    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    //    button.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0);
    //    [button setImage:ImageNamed(@"btn_back") forState:UIControlStateNormal];
    //    [button addTarget:self action:@selector(baseVC_backBarButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    //
    //    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    //    self.navigationItem.leftBarButtonItem = backButton;
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(0, 0, 19, 19);
    [btn addTarget:self action:@selector(baseVC_backBarButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    btn.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:btn];
}

/**
 *  添加左按钮(两个)
 *
 *
 *
 *
 */
- (void)baseVC_addTwoLeftBtnWithsecondImage:(UIImage *)secondImage {
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [button setImage:ImageNamed(@"btn_back") forState:UIControlStateNormal];
    [button addTarget:self action:@selector(baseVC_backBarButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    UIButton *secondButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 32, 32)];
    [secondButton setImage:secondImage forState:UIControlStateNormal];
    [secondButton addTarget:self action:@selector(baseVC_backBarSecondButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *secondBackButton = [[UIBarButtonItem alloc] initWithCustomView:secondButton];
    
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -20;
    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:negativeSpacer, backButton, secondBackButton, nil];
}

/**
 *  返回按钮触发
 */
- (void)baseVC_backBarButtonPressed:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 *  关闭按钮触发
 */
- (void)baseVC_backBarSecondButtonPressed:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 *  删除Nav左按钮
 */
- (void)baseVC_removeLiftBarButton {
    self.navigationItem.leftBarButtonItems = nil;
}

/**
 *  navBar开启半透明状态 && 关闭半自动布局 && 需要在nav下以（0，0）建TableView 时设置此属性
 */
- (void)baseVC_noneEdgesForExtendedLayout {
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
    }
}

/**
 *  添加右按钮
 *
 *  @param image 图片
 *
 *  @param echo 点击回调
 */
- (void)baseVC_addRightBtnWithImage:(UIImage *)image btnClick:(void (^)(UIButton *))echo{
    UIButton *baseRightImageButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    [baseRightImageButton setImage:image forState:UIControlStateNormal];
    [baseRightImageButton addTarget:self action:@selector(baseVC_clickBaseRightImageBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:baseRightImageButton];
    _rightImageBtnClickBlock = echo;
}
- (void)baseVC_clickBaseRightImageBtn:(UIButton *)sender{
    _rightImageBtnClickBlock(sender);
}
/**
 *  添加右按钮
 *
 *  @param btnTitle 按钮的标题
 *
 *  @param echo 点击回调
 */
- (void)baseVC_addRightBtnWithBtnTitle:(NSString *)btnTitle btnClick:(void (^)(UIButton *))echo {
    UIButton *baseRightImageButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 25)];
    [baseRightImageButton setTitle:btnTitle forState:UIControlStateNormal];
    [baseRightImageButton setTitleColor:C_Black_333333 forState:UIControlStateNormal];
    baseRightImageButton.titleLabel.font = F14;
    baseRightImageButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [baseRightImageButton addTarget:self action:@selector(baseVC_clickBaseRightImageBtn:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:baseRightImageButton];
    _rightImageBtnClickBlock = echo;
}
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
                        secondBtnClick:(void (^)(UIButton *))secondEcho {
    
    UIButton *baseRightImageButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    [baseRightImageButton setImage:image forState:UIControlStateNormal];
    [baseRightImageButton addTarget:self action:@selector(baseVC_clickBaseFirstRightImageBtn:) forControlEvents:UIControlEventTouchUpInside];
    _rightImageBtnClickBlock = echo;
    
    UIButton *baseSecondRightImageButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 25, 25)];
    [baseSecondRightImageButton setImage:secondImage forState:UIControlStateNormal];
    [baseSecondRightImageButton addTarget:self action:@selector(baseVC_clickBaseSecondRightImageBtn:) forControlEvents:UIControlEventTouchUpInside];
    _rightSecondImageBtnClickBlock = secondEcho;
    
    self.navigationItem.rightBarButtonItems = @[[[UIBarButtonItem alloc]initWithCustomView:baseRightImageButton],
                                                [[UIBarButtonItem alloc]initWithCustomView:baseSecondRightImageButton]];
}
- (void)baseVC_clickBaseFirstRightImageBtn:(UIButton *)sender{
    _rightImageBtnClickBlock(sender);
}
- (void)baseVC_clickBaseSecondRightImageBtn:(UIButton *)sender{
    _rightSecondImageBtnClickBlock(sender);
}

/**
 *  添加右按钮
 *
 *  @param type 系统风格
 *
 *  @param echo 点击回调
 */
- (void)baseVC_addRightBtnWithType:(UIBarButtonSystemItem)type btnClick:(void (^)(UIBarButtonItem *))echo{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:type target:self action:@selector(baseVC_clickBaseRightTypeBtn:)];
    _rightTypeBtnClickBlock = echo;
}
- (void)baseVC_clickBaseRightTypeBtn:(UIBarButtonItem *)sender{
    _rightTypeBtnClickBlock(sender);
}

/**
 *  设置nacBar背景图片 & 标题颜色 & 标题字体
 *
 *  @param backGroundImage 背景图片
 *
 *  @param titleColor 标题颜色
 *
 *  @param titleFont 标题字体
 *
 *  参数传nil为默认样式
 */
- (void)baseVC_layoutNavigationBar:(UIImage *)backGroundImage
                        titleColor:(UIColor *)titleColor
                         titleFont:(UIFont *)titleFont {
    
    if (backGroundImage) {
        [self.navigationController.navigationBar setBackgroundImage:backGroundImage forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    }
    if (titleColor && titleFont) {
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:titleColor,NSFontAttributeName:titleFont}];
    }
    else if (titleFont) {
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:titleFont}];
    }
    else if (titleColor){
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:titleColor}];
    }
}

/**
 * 去除nav 上的line
 */
- (void)baseVC_removeNavgationBarLine {
    
    if ([self.navigationController.navigationBar respondsToSelector:@selector( setBackgroundImage:forBarMetrics:)]){
        
        NSArray *list=self.navigationController.navigationBar.subviews;
        
        for (id obj in list) {
            
            if ([obj isKindOfClass:[UIImageView class]]) {
                
                UIImageView *imageView=(UIImageView *)obj;
                
                NSArray *list2=imageView.subviews;
                
                for (id obj2 in list2) {
                    
                    if ([obj2 isKindOfClass:[UIImageView class]]) {
                        
                        UIImageView *imageView2=(UIImageView *)obj2;
                        
                        imageView2.hidden=YES;
                        
                    }
                }
            }
        }
    }
}

// 禁屏幕旋转
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}
- (BOOL)shouldAutorotate {
    
    return NO;
}
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}

// 内存警告
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // 防止SDWebimage加载图片过大出现的内存警告
    //    [[SDImageCache sharedImageCache] setValue:nil forKey:@"memCache"];
    
    if (self.isViewLoaded && !self.view.window){
        
        //释放其他可复现的资源&&保存数据
        
        self.view = nil;//目的是再次进入时能够重新加载调用viewDidLoad函数。
        
    }
}

-(void)dealloc {
    _rightTypeBtnClickBlock = nil;
    _rightImageBtnClickBlock = nil;
    _rightSecondImageBtnClickBlock = nil;
    
    SLLog(@"%s dealloc",object_getClassName(self));
}

/**
 *  懒加载赋值屏幕高
 *
 *  @return 屏幕高
 */
- (CGFloat )screenHight {
    if (_screenHight == 0) {
        _screenHight = [UIScreen mainScreen].bounds.size.height;
    }
    return _screenHight;
}
/**
 *  懒加载赋值屏幕宽
 *
 *  @return 屏幕宽
 */
- (CGFloat )screenWidth{
    if (_screenWidth == 0) {
        _screenWidth = [UIScreen mainScreen].bounds.size.width;
    }
    return _screenWidth;
}

/**
 * 登录提示窗
 */
- (void)baseVC_showShouldLoginActionSheet {
}

/**
 * 关闭屏幕边侧滑
 */
- (void)baseVC_prohibitPopGesture {
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}

/**
 *  先这么写，用不用URL导航总线还不一定，以防万一。
 *  push ~ 带动画
 */
- (void)baseVC_pushWithVC:(id)VC {
    //    if ([self.navigationController.viewControllers count] < 2) {
    //        // Push隐藏Tabbar（除一级页面）
    //        [VC setHidesBottomBarWhenPushed:YES];
    //    }
    [self.navigationController pushViewController:VC animated:YES];
}


/**
 * push ~ 不带动画
 */
- (void)baseVC_noAnimatedPushWithVC:(id)VC {
    //    if ([self.navigationController.viewControllers count] < 2) {
    //        // Push隐藏Tabbar（除一级页面）
    //        [VC setHidesBottomBarWhenPushed:YES];
    //    }
    [self.navigationController pushViewController:VC animated:NO];
}


/**
 *  先pop掉当前VC 然后Push
 *  push ~ 带动画
 */
- (void)baseVC_popOldVCToPushWithVC:(id)VC {
    
    // 获取当前路由的控制器数组
    NSMutableArray *vcArray = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
    
    // 获取档期控制器在路由的位置
    int index = (int)[vcArray indexOfObject:self];
    
    // 移除当前路由器
    if (index < vcArray.count) {
        [vcArray removeObjectAtIndex:index];
    }
    
    // 添加新控制器
    [vcArray addObject: VC];
    
    // 重新设置当前导航控制器的路由数组
    [self.navigationController setViewControllers:vcArray animated:YES];
}


// 下面目的是开启屏幕边侧滑手势的一些控制 ———————————————————— ~
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
    
    if ([self.navigationController.viewControllers count] >= 2) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }else{
        [self baseVC_removeLiftBarButton]; // 一级页面删除Nav返回按钮
    }
    // 一级页面显示tabbar
    if (self.navigationController.childViewControllers.count == 1) {
        self.tabBarController.tabBar.hidden = NO;
    }
    
    //    NSNotificationCenter *defaultCenter = [NSNotificationCenter defaultCenter];
    //    [defaultCenter addObserver:self
    //                      selector:@selector(networkDidReceiveMessage:)
    //                          name:PushMessageNotice
    //                        object:nil];
    
    //    _lineVIew.hidden = YES;
}

//- (void)networkDidReceiveMessage:(NSNotification *)notification{
//    NSDictionary *tempDic = notification.object;
//    [SLNoticePush noticePushVCGetUserinforDic:tempDic withVC:self];
//}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //    [self UMBeginLogPage];
    //代理置空
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
    }
    
    //    [[NSNotificationCenter defaultCenter] removeObserver:self name:PushMessageNotice object:nil];
    
    //    _lineVIew.hidden = YES;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        //只有在二级页面生效
        if ([self.navigationController.viewControllers count] >= 2) {
            self.navigationController.interactivePopGestureRecognizer.delegate = self;
        }else{
            // 禁侧划
            self.navigationController.interactivePopGestureRecognizer.enabled = NO;
        }
    }
    //    _lineVIew.hidden = YES;
}

#pragma mark - 隐藏键盘
- (void)hideKeyBoard
{
    for (UIWindow* window in [UIApplication sharedApplication].windows)
    {
        for (UIView* view in window.subviews)
        {
            [self dismissAllKeyBoardInView:view];
        }
    }
}

-(BOOL) dismissAllKeyBoardInView:(UIView *)view
{
    if([view isFirstResponder])
    {
        [view resignFirstResponder];
        return YES;
    }
    for(UIView *subView in view.subviews)
    {
        if([self dismissAllKeyBoardInView:subView])
        {
            return YES;
        }
    }
    return NO;
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
