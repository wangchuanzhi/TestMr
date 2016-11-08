//
//  GroupModel.m
//  汽车列表带图标
//
//  Created by wangchuanzhi on 16/9/9.
//  Copyright © 2016年 wangchuanzhi. All rights reserved.
//

#import "GroupModel.h"
#import "Cars_Model.h"
@implementation GroupModel

-(instancetype)initWithDict:(NSDictionary *)dict{
    if(self=[super init]){
    
        [self setValuesForKeysWithDictionary:dict];
        //模型的嵌套
        NSMutableArray *arrmodel=[NSMutableArray array];
       
                for (NSDictionary *dict_item in dict[@"cars"]) {
        
                    Cars_Model *model=[Cars_Model carsWithDict:dict_item];
                    [arrmodel addObject:model];
        
                }
        
                self.cars =arrmodel;
        
    }
    return self;
}

+(instancetype)groupWithDict:(NSDictionary *)dict{

    return [[self alloc]initWithDict:dict];

}

@end
