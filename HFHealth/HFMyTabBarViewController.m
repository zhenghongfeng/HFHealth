//
//  HFMyTabBarViewController.m
//  HFHealth
//
//  Created by zhf on 16/5/5.
//  Copyright © 2016年 zhenghongfeng. All rights reserved.
//

#import "HFMyTabBarViewController.h"
#import "HFHomeMainViewController.h"
#import "HFAttentionMainViewController.h"
#import "HFDiscoverMainViewController.h"
#import "HFMeMainViewController.h"

@interface HFMyTabBarViewController ()

@end

@implementation HFMyTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    HFHomeMainViewController *homeVC = [HFHomeMainViewController new];
    [self addChildVc:homeVC title:@"首页" image:@"tabBar_home" selectedImage:@"tabBar_home_selected"];
    
    HFAttentionMainViewController *attentionVC = [HFAttentionMainViewController new];
    [self addChildVc:attentionVC title:@"关注" image:@"tabBar_attention" selectedImage:@"tabBar_attention_selected"];
    
    HFDiscoverMainViewController *discoverVC = [HFDiscoverMainViewController new];
    [self addChildVc:discoverVC title:@"发现" image:@"tabBar_discover" selectedImage:@"tabBar_discover_selected"];
    
    HFMeMainViewController *meVC = [HFMeMainViewController new];
    [self addChildVc:meVC title:@"我" image:@"tabBar_me" selectedImage:@"tabBar_me_selected"];
}

/**
 *  添加一个子控制器
 *
 *  @param childVc         子控制器对象
 *  @param title           标题
 *  @param imageName       图标
 *  @param selectImageName 选中的图标
 */
- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    childVc.tabBarItem.title = title;
    /*
     // 设置tabBarItem的普通文字颜色
     NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
     textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
     textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:10];
     [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
     
     // 设置tabBarItem的选中文字颜色
     NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
     selectedTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
     [childVc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
     */
    NSDictionary *titleTextAttributes = @{NSForegroundColorAttributeName: kRGB(9, 185, 7)};
    [childVc.tabBarItem setTitleTextAttributes:titleTextAttributes forState:UIControlStateSelected];
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    UIImage *selectImage = [UIImage imageNamed:selectedImage];
    if (kIOS_VERSION >= 7.0) {
        // 声明这张图片用原图(别渲染)
        selectImage = [selectImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    childVc.tabBarItem.selectedImage = selectImage;
    // 添加为tabbar控制器的子控制器
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
