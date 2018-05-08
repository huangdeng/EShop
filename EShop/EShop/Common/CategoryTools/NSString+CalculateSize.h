//
//  NSString+CalculateSize.h
//  EShop
//
//  Created by apple on 2018/5/4.
//  Copyright © 2018年 Telly. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CalculateSize)
- (CGFloat)strWidthWithFont:(UIFont *)font maxHeight:(CGFloat)maxHeight;
@end
