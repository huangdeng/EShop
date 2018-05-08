//
//  MultiTapBtnView.h
//  EShop
//
//  Created by apple on 2018/5/4.
//  Copyright © 2018年 Telly. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MultiTapBtnViewDelegate <NSObject>
- (void)didSelectedIndex:(NSInteger)selectedIndex;
@end

@interface MultiTapBtnView : UIView
@property (nonatomic, weak) id<MultiTapBtnViewDelegate> delegate;

- (void)updateBtnsWithTitleArray:(NSArray *)titleArray;
@end
