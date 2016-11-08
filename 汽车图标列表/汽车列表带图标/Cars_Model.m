//
//  Cars_Model.m
//  汽车列表带图标
//
//  Created by wangchuanzhi on 16/9/9.
//  Copyright © 2016年 wangchuanzhi. All rights reserved.
//

#import "Cars_Model.h"

@implementation Cars_Model
-(instancetype)initWithDict:(NSDictionary *)dict{
    if(self=[super init]){
        
        [self setValuesForKeysWithDictionary:dict];
        
    }
    return self;
}

+(instancetype)carsWithDict:(NSDictionary *)dict{
    
    return [[self alloc]initWithDict:dict];
    
}
@end
