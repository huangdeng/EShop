//
//  HomePageVC.m
//  EShop
//
//  Created by apple on 2018/5/3.
//  Copyright © 2018年 Telly. All rights reserved.
//

#import "HomePageVC.h"


#import "MultiTapBtnView.h"

@interface HomePageVC() <MultiTapBtnViewDelegate>
@property (nonatomic, strong) MultiTapBtnView *multiTapBtnView;
@end

@implementation HomePageVC

#pragma mark - Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self.view addSubview:self.multiTapBtnView];
    [self.multiTapBtnView updateBtnsWithTitleArray:@[@"今日推荐",@"奶粉",@"皮具",@"玩具",@"社区",@"女包",@"潮流前线",@"折扣",@"大牌",@"电脑",@"建材",@"生鲜",@"学生用品",@"车品"]];
}

#pragma mark - MultiTapBtnViewDelegate
- (void)didSelectedIndex:(NSInteger)selectedIndex{
    NSLog(@"selectedindex >>> %d",selectedIndex);
}


#pragma mark - Getter
-(MultiTapBtnView *)multiTapBtnView{
    if (_multiTapBtnView == nil) {
        _multiTapBtnView = [[MultiTapBtnView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
        _multiTapBtnView.delegate = self;
    }
    return _multiTapBtnView;
}
@end
