//
//  AppDelegate+RootWindow.m
//  EShop
//
//  Created by apple on 2018/5/3.
//  Copyright © 2018年 Telly. All rights reserved.
//

#import "AppDelegate+RootWindow.h"

#import "ESPTabBarController.h"



@implementation AppDelegate (RootWindow)
- (void)configRootWindow{
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor redColor];
    [self.window makeKeyAndVisible];
    
    
    ESPTabBarController *tabBarC = [ESPTabBarController tabBarController];
    self.window.rootViewController = tabBarC;
    
}
@end
