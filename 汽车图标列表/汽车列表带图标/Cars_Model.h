//
//  Cars_Model.h
//  汽车列表带图标
//
//  Created by wangchuanzhi on 16/9/9.
//  Copyright © 2016年 wangchuanzhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Cars_Model : NSObject
@property(nonatomic,strong)NSString *icon;
@property(nonatomic,strong)NSString *name;
-(instancetype)initWithDict:(NSDictionary *)dict;

+(instancetype)carsWithDict:(NSDictionary *)dict;
@end
