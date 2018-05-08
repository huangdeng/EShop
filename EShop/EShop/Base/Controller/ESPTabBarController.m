//
//  ESPTabBarController.m
//  EShop
//
//  Created by apple on 2018/5/4.
//  Copyright © 2018年 Telly. All rights reserved.
//

#import "ESPTabBarController.h"
#import "ESPNavigationController.h"
#import "HomePageVC.h"
#import "PersonalCenterVC.h"


@interface ESPTabBarController ()

@end

@implementation ESPTabBarController
+ (instancetype)tabBarController{
    HomePageVC *homeVC = [[HomePageVC alloc] init];
    ESPNavigationController *naviVCHome = [[ESPNavigationController alloc] initWithRootViewController:homeVC];
    [self configTabBarItem:naviVCHome.tabBarItem title:@"首页" normalImgStr:nil selectedImgStr:nil];
    
    PersonalCenterVC *personCenterVC = [[PersonalCenterVC alloc] init];
    ESPNavigationController *naviPersonCenter = [[ESPNavigationController alloc] initWithRootViewController:personCenterVC];
    [self configTabBarItem:naviPersonCenter.tabBarItem title:@"我的" normalImgStr:@"tab_mine" selectedImgStr:@"tab_mine"];
    
    
    
    
    ESPTabBarController *tabBarC = [[ESPTabBarController alloc] init];
    tabBarC.tabBar.backgroundColor = [UIColor whiteColor];
    tabBarC.tabBar.tintColor = MainTone;
//    tabBarC.tabBar.unselectedItemTintColor = [UIColor redColor];
    tabBarC.viewControllers = @[naviVCHome,naviPersonCenter];
    
    return tabBarC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Private Method
+ (void)configTabBarItem:(UITabBarItem *)barItem title:(NSString *)title normalImgStr:(NSString *)normalImgStr selectedImgStr:(NSString *)selectedImgStr{
    barItem.title = title;
    if (normalImgStr) {
        barItem.image = [UIImage imageNamed:normalImgStr];
    }
    if (selectedImgStr) {
        barItem.selectedImage = [UIImage imageNamed:selectedImgStr];
    }
    
}

@end
