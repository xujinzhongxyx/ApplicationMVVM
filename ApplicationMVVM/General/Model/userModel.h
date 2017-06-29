//
//  userModel.h
//  ApplicationMVVM
//
//  Created by jinzhong xu on 2017/6/29.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface userModel : NSObject

@property(strong ,nonatomic) NSString *headImage;
@property(strong ,nonatomic) NSString *Name;
@property(strong ,nonatomic) NSString *Description;
@property(assign ,nonatomic) NSInteger Age;

@end
