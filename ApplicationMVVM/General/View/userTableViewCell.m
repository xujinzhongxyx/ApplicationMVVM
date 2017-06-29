//
//  userTableViewCell.m
//  ApplicationMVVM
//
//  Created by jinzhong xu on 2017/6/29.
//  Copyright © 2017年 jinzhong xu. All rights reserved.
//

#import "userTableViewCell.h"

@interface userTableViewCell()

@property(strong, nonatomic) UIImageView    *headImageView;
@property(strong, nonatomic) UILabel        *labelName;
@property(strong, nonatomic) UILabel        *labelDescription;
@property(strong, nonatomic) UILabel        *labelAge;

@end

@implementation userTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self loadSubViews];
    }
    
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization codelabel
}

-(void)loadSubViews
{
    _headImageView = [[UIImageView alloc] init];
    _headImageView.layer.cornerRadius = 5.0f;
    _headImageView.layer.masksToBounds = YES;
    [self.contentView addSubview:_headImageView];
    
    [_headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(4);
        make.width.height.offset(40);
        make.centerY.equalTo(self.contentView);
    }];
    
    _labelName = [[UILabel alloc] init];
    _labelName.textAlignment = NSTextAlignmentLeft;
    _labelName.font = [UIFont systemFontOfSize:16.f];
    [self.contentView addSubview:_labelName];
    
    [_labelName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_headImageView.mas_right).offset(15);
        make.top.offset(8);
        make.width.equalTo(self.contentView).offset(65);
        make.height.offset(20);
    }];
    
    _labelDescription = [[UILabel alloc] init];
    _labelDescription.textAlignment = NSTextAlignmentLeft;
    _labelDescription.font = [UIFont systemFontOfSize:12.f];
    [self.contentView addSubview:_labelDescription];
    
    [_labelDescription mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_labelName.mas_bottom).offset(3);
        make.left.equalTo(_labelName);
        make.width.equalTo(_labelName);
        make.height.offset(20);
    }];
    
    _labelAge = [[UILabel alloc] init];
    _labelAge.textAlignment = NSTextAlignmentLeft;
    _labelAge.font = [UIFont systemFontOfSize:12.f];
    [self.contentView addSubview:_labelAge];
    
    [_labelAge mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_labelDescription.mas_bottom).offset(3);
        make.left.equalTo(_labelDescription);
        make.width.equalTo(_labelDescription);
        make.height.offset(20);
    }];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}


-(void)bingWithViewModel:(userTableViewCellModel *)viewModel
{
    RAC(self, self.headImageView.image) = viewModel.signalHeadImage;
    RAC(self, self.labelName.text) = viewModel.signalName;
    RAC(self, self.labelDescription.text) = viewModel.signalDescription;
    RAC(self, self.labelAge.text) = viewModel.signalAge;
}

@end
