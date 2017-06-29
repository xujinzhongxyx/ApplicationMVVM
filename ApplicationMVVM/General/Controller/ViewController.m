//
//  ViewController.m
//  ApplicationMVVM
//
//  Created by jinzhong xu on 2017/6/29.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import "ViewController.h"

#import "userModel.h"
#import "userTableViewCellModel.h"
#import "userTableViewCell.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>

@property(strong, nonatomic) UITableView *tableView;
@property(strong, nonatomic) NSArray *aryList;

@end

@implementation ViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.aryList = [helper getDataFromFile:@"userFile" fileType:@"json"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [self.view addSubview:_tableView];
        
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(self.view).offset(60);
            make.top.offset(20);
            make.left.width.equalTo(self.view);
        }];
    }
    
    return _tableView;
}

#pragma mark UITableView 代理方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.aryList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cell";
    userTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (!cell) {
        cell = [[userTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    userModel *model = [userModel mj_objectWithKeyValues:_aryList[indexPath.row]];
    userTableViewCellModel *viewModel = [[userTableViewCellModel alloc] initViewModel:model];
    
    [cell bingWithViewModel:viewModel];
    
    return cell;
}




@end
