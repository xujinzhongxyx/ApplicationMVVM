//
//  userTableViewCell.h
//  ApplicationMVVM
//
//  Created by jinzhong xu on 2017/6/29.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "userTableViewCellModel.h"

@interface userTableViewCell : UITableViewCell

-(void)bingWithViewModel:(userTableViewCellModel *)viewModel;

@end
