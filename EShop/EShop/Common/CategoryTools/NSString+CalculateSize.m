//
//  NSString+CalculateSize.m
//  EShop
//
//  Created by apple on 2018/5/4.
//  Copyright © 2018年 Telly. All rights reserved.
//

#import "NSString+CalculateSize.h"

@implementation NSString (CalculateSize)
- (CGFloat)strWidthWithFont:(UIFont *)font maxHeight:(CGFloat)maxHeight{
    NSDictionary *attriDic = @{NSFontAttributeName : font};
    return [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, maxHeight) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attriDic context:NULL].size.width;
}
@end
