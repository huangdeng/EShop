//
//  MultiBtnCollectionViewCell.m
//  EShop
//
//  Created by apple on 2018/5/4.
//  Copyright © 2018年 Telly. All rights reserved.
//

#import "MultiBtnCollectionViewCell.h"

@interface MultiBtnCollectionViewCell ()
@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation MultiBtnCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    [self.contentView addSubview:self.titleLabel];
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self.titleLabel sizeToFit];
    self.titleLabel.center = CGPointMake(self.width / 2, self.height / 2);
}

#pragma mark - Private Method
-(void)updateWithTitle:(NSString *)title selected:(BOOL)selected{
    self.titleLabel.text = title;
    if (selected) {
        self.titleLabel.textColor = MainTone;
    }
    else{
        self.titleLabel.textColor = RGBFromHex(0x333333);
    }
//    self.titleLabel.textColor = selected ? MainTone : RGBFromHex(0x333333);
    [self layoutIfNeeded];
}


#pragma mark - Getter
-(UILabel *)titleLabel{
    if (_titleLabel == nil){
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = PFSCRegular(16);
        _titleLabel.backgroundColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}
@end
