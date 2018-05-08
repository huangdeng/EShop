//
//  BaseEntityModel.m
//  EShop
//
//  Created by apple on 2018/5/7.
//  Copyright © 2018年 Telly. All rights reserved.
//

#import "BaseEntityModel.h"

@implementation BaseEntityModel
+ (instancetype)entityWithInfoDic:(NSDictionary *)infoDic{
    BaseEntityModel *entity = [[self alloc] init];
    [entity setValuesForKeysWithDictionary:infoDic];
    return entity;
}

//没有与服务器返回字段对应的属性名
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
@end
