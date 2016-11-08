//
//  GroupModel.h
//  汽车列表带图标
//
//  Created by wangchuanzhi on 16/9/9.
//  Copyright © 2016年 wangchuanzhi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupModel : NSObject

@property(nonatomic,strong)NSArray *cars;
@property(nonatomic,strong)NSString *title;

-(instancetype)initWithDict:(NSDictionary *)dict;

+(instancetype)groupWithDict:(NSDictionary *)dict;
@end
