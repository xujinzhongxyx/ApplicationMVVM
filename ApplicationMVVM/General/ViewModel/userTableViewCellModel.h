//
//  userTableViewCellModel.h
//  ApplicationMVVM
//
//  Created by jinzhong xu on 2017/6/29.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "userModel.h"

@interface userTableViewCellModel : NSObject

-(instancetype)initViewModel:(userModel *)model;

/** cell 界面数据信号 */
@property(strong, nonatomic) RACSignal *signalHeadImage;    //头像
@property(strong, nonatomic) RACSignal *signalName;         //姓名
@property(strong, nonatomic) RACSignal *signalDescription;  //简介
@property(strong, nonatomic) RACSignal *signalAge;          //年龄

@end
