//
//  PersonalCenterVC.m
//  EShop
//
//  Created by apple on 2018/5/4.
//  Copyright © 2018年 Telly. All rights reserved.
//

#import "PersonalCenterVC.h"


#import "ESPUserModel.h"

@interface PersonalCenterVC ()

@end

@implementation PersonalCenterVC

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人中心";
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    if (self.isFirstAppear) {
        [self netPersonalInfo];
        self.isFirstAppear = NO;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - Net
- (void)netPersonalInfo{
    ESPUserModel * userM = [ESPUserModel entityWithInfoDic:@{@"USERNAID" : @"20170506hfdhghfdh", @"USERNAME" : @"TELLY", @"PHONE" : @"18654987709", @"IDCARD" : @"6347389848378283847", @"gfdsgfd" : @"gfdsgfd"}];
    
}


@end
