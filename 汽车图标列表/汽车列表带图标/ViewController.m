//
//  ViewController.m
//  汽车列表带图标
//
//  Created by wangchuanzhi on 16/9/9.
//  Copyright © 2016年 wangchuanzhi. All rights reserved.
//

#import "ViewController.h"
#import "Cars_Model.h"
#import "GroupModel.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)NSArray *groups;
@property(nonatomic,strong)UITableView *tv;
@property(nonatomic,strong)NSMutableArray *arr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self groups];
    [self setupTV];
    
}
//懒加载
-(NSArray *)groups{
    //获取Plist文件的地址
    NSString *path=[[NSBundle mainBundle]pathForResource:@"cars_total.plist" ofType:nil];
    //地址里的内容都封装到arrdict中
    NSArray *arrdict=[NSArray arrayWithContentsOfFile:path];
    
    self.arr=[NSMutableArray array];
    //遍历arrdict，讲里面所有的内容都放到字典里
    for (NSDictionary *dict in arrdict) {
        //字典转模型
        GroupModel *model=[[GroupModel alloc]initWithDict:dict];
        //模型放入可变数组里
        [self.arr addObject:model];
    }
    //赋值给groups（全局变量）
    self.groups=self.arr;

    return _groups;
}
-(void)setupTV{
        self.tv=[[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    self.tv.delegate=self;
    self.tv.dataSource=self;
    [self.view addSubview:self.tv];

}
//显示几组
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return self.groups.count;
}
//每一组显示多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //获取组模型
    GroupModel *groups=self.groups[section];
    //这个组里有多少个cars里面的内容
    return groups.cars.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //获取组模型
    GroupModel *groups=self.groups[indexPath.section];
    //获取汽车模型
    Cars_Model *cars=groups.cars[indexPath.row];
    //设置重用标识符
    static NSString *ID=@"carcell";
    //设置单元格
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    //如果在复用池中没找到需要复用的单元格就重新初始化单元格
    if(cell==nil){
    
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    //单元格设置内容
    cell.imageView.image=[UIImage imageNamed:cars.icon];
    cell.textLabel.text=cars.name;
    //返回单元格
    return cell;
    
}
//设置cell头
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    //获取组模型
    GroupModel *groups=self.groups[section];
    return groups.title;
}
//设置右侧索引栏
- ( NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView {
//让标题头自动匹配到右索引栏
    return [self.groups valueForKey:@"title" ];

}
//点击cell时执行的方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //取消点击效果
    [tableView deselectRowAtIndexPath:indexPath animated:YES];


}




//-(NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
