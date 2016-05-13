//
//  HFMyNavigationController.m
//  HFHealth
//
//  Created by zhf on 16/5/13.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import "HFMyNavigationController.h"

@interface HFMyNavigationController ()

@end

@implementation HFMyNavigationController

/**
 *  当导航控制器的view创建完毕就调用
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    // 清空弹出手势的代理，就可以恢复左滑手势
    self.interactivePopGestureRecognizer.delegate = nil;
}
/**
 *  当第一次使用这个类的时候调用一次
 */
+ (void)initialize
{
    // 设置UINavigationBarTheme的主题
    [self setupNavigationBarTheme];
    
    // 设置UIBarButtonItem的主题
    [self setupBarButtonItemTheme];
}

/**
 *  设置NavigationBarTheme的主题
 */
+ (void)setupNavigationBarTheme
{
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    
    
//    navigationBarAppearance.barTintColor = [UIColor colorWithRed:0.22f green:0.70f blue:1.00f alpha:1.00f];
    
    /*
     //导航栏背景透明
     [appearance setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
     */
    
    // 去掉导航栏底部线
//    navigationBarAppearance.barStyle = UIBarStyleBlack;
//    navigationBarAppearance.translucent = YES;
//    [navigationBarAppearance setShadowImage:[UIImage new]];
    
    // 设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor whiteColor];
    // UITextAttributeFont  --> NSFontAttributeName(iOS7)
#warning 过期 : 并不代表不能用, 仅仅是有最新的方案可以取代它
    textAttrs[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    // UIOffsetZero是结构体, 只要包装成NSValue对象, 才能放进字典\数组中
    textAttrs[UITextAttributeTextShadowOffset] = [NSValue valueWithUIOffset:UIOffsetZero];
    [navigationBarAppearance setTitleTextAttributes:textAttrs];
    
    //    [navigationBarAppearance setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:[NSObject baseURLStrIsTest]? @"0x3bbd79" : @"0x28303b"]] forBarMetrics:UIBarMetricsDefault];
    //    [navigationBarAppearance setTintColor:[UIColor blackColor]];//返回按钮的箭头颜色
    //    NSDictionary *textAttributes = @{
    //                                     NSFontAttributeName: [UIFont boldSystemFontOfSize:kNavTitleFontSize],
    //                                     NSForegroundColorAttributeName: [UIColor whiteColor],
    //                                     };
    //    [navigationBarAppearance setTitleTextAttributes:textAttributes];
}

/**
 *  设置UIBarButtonItem的主题
 */
+ (void)setupBarButtonItemTheme
{
    // 通过appearance对象能修改整个项目中所有UIBarButtonItem的样式
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    // 设置普通状态的文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [appearance setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    
    // 设置高亮状态的文字属性
    NSMutableDictionary *highTextAttrs = [NSMutableDictionary dictionary];
    highTextAttrs[NSForegroundColorAttributeName] = [UIColor redColor];
    highTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [appearance setTitleTextAttributes:highTextAttrs forState:UIControlStateHighlighted];
    
    // 设置不可用状态(disable)的文字属性
    NSMutableDictionary *disableTextAttrs = [NSMutableDictionary dictionary];
    disableTextAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    disableTextAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    [appearance setTitleTextAttributes:disableTextAttrs forState:UIControlStateDisabled];
    
    /*
     *设置背景*
     // 技巧: 为了让某个按钮的背景消失, 可以设置一张完全透明的背景图片
     [appearance setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
     */
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES; // 如果现在Push的不是栈底控制器（最先push进来的那个控制器）
        // 设置导航栏按钮
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"back" target:self action:@selector(back)];
        //        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationbar_more" target:self action:@selector(more)];
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back
{
#warning 这里用的是self, 因为self就是当前正在使用的导航控制器
    [self popViewControllerAnimated:YES];
}

- (void)more
{
    [self popToRootViewControllerAnimated:YES];
}

@end
