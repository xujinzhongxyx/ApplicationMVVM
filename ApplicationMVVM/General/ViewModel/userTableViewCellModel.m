//
//  userTableViewCellModel.m
//  ApplicationMVVM
//
//  Created by jinzhong xu on 2017/6/29.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import "userTableViewCellModel.h"

@implementation userTableViewCellModel

-(instancetype)initViewModel:(userModel *)model
{
    if (self=[super init]) {
        [self bingWithModel:model];
    }
    
    return self;
}

-(void)bingWithModel:(userModel *)model
{
    RACSignal *signal = [RACSignal return:model];
    
    /** 头像信号 */
    self.signalHeadImage = [signal map:^id (userModel *x) {
        return [UIImage imageNamed:x.headImage];
    }];
    
    /** 姓名信号 */
    self.signalName = [signal map:^id (userModel *x) {
        return x.Name;
    }];
    
    /** 描述信号 */
    self.signalDescription = [signal map:^id (userModel *x) {
        return x.Description;
    }];
    
    /** 年龄信号 */
    self.signalAge = [signal map:^id (userModel *x) {
        return [NSString stringWithFormat:@"%zi", x.Age];
    }];
}

@end
