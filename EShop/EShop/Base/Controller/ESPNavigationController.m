//
//  ESPNavigationController.m
//  EShop
//
//  Created by apple on 2018/5/4.
//  Copyright © 2018年 Telly. All rights reserved.
//

#import "ESPNavigationController.h"

@interface ESPNavigationController ()

@end

@implementation ESPNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self findHairlineImageViewUnder:self.navigationBar].hidden = YES;
    self.navigationBar.translucent = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Method
- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

@end
