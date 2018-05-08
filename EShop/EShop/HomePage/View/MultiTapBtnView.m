//
//  MultiTapBtnView.m
//  EShop
//
//  Created by apple on 2018/5/4.
//  Copyright © 2018年 Telly. All rights reserved.
//

#import "MultiTapBtnView.h"

#import "MultiBtnCollectionViewCell.h"
@interface MultiTapBtnView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>{
    NSMutableArray *_titleArray;
}
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *cellHeightArray;
@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, strong) NSIndexPath *selectedIndexPath;


@end

@implementation MultiTapBtnView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.collectionView];
    return self;
}


#pragma mark - Delegate
#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake([self.cellHeightArray[indexPath.row] floatValue], 40);
}

#pragma mark - UICollectionViewDelegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.selectedIndexPath.row != indexPath.row) {
        NSIndexPath *tempInexPath = self.selectedIndexPath;
        self.selectedIndexPath = indexPath;
        [collectionView reloadItemsAtIndexPaths:@[tempInexPath, self.selectedIndexPath]];
        if ([self.delegate respondsToSelector:@selector(didSelectedIndex:)]) {
            [self.delegate didSelectedIndex:self.selectedIndexPath.row];
        }
        
        UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
        CGFloat halfCollectViewWidth = collectionView.width / 2;
        CGFloat centerX = [cell convertRect:cell.bounds toView:collectionView].origin.x + cell.width / 2;
        if (centerX < halfCollectViewWidth) {
           [collectionView setContentOffset:CGPointMake(0, 0) animated:YES];
        }
        else if (centerX > halfCollectViewWidth && centerX + halfCollectViewWidth <= collectionView.contentSize.width) {
            [collectionView setContentOffset:CGPointMake(centerX - halfCollectViewWidth, 0) animated:YES];
        }
        else{
            [collectionView setContentOffset:CGPointMake(collectionView.contentSize.width - collectionView.width, 0) animated:YES];
        }
        
    }
    
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _titleArray.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.selectedIndexPath == nil && indexPath.row == 0) {
        self.selectedIndexPath = indexPath;
    }
    MultiBtnCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"MultiBtnCollectionViewCell" forIndexPath:indexPath];
    [cell updateWithTitle:_titleArray[indexPath.row] selected:self.selectedIndexPath.row == indexPath.row];
    return cell;
}

#pragma mark - Private Method
-(void)updateBtnsWithTitleArray:(NSArray *)titleArray{
    _titleArray = [NSMutableArray arrayWithArray:titleArray];
    self.cellHeightArray = [NSMutableArray arrayWithCapacity:_titleArray.count];
    for (NSString *title in titleArray) {
        [self.cellHeightArray addObject:[NSNumber numberWithFloat:[title strWidthWithFont:PFSCRegular(16) maxHeight:17]]];
    }
    
}

#pragma mark - Getter
-(UICollectionView *)collectionView{
    if (_collectionView == nil) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.sectionInset = UIEdgeInsetsMake(0, 12, 0, 12);
        layout.minimumInteritemSpacing = 16;
        _collectionView = [[UICollectionView alloc] initWithFrame:self.bounds collectionViewLayout:layout];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        [_collectionView registerClass:[MultiBtnCollectionViewCell class] forCellWithReuseIdentifier:@"MultiBtnCollectionViewCell"];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
    }
    return _collectionView;
}

@end
