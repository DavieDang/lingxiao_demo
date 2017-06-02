//
//  LXHomeworkDetailCell.m
//  LingXiaoAdmin
//
//  Created by admin on 2017/6/2.
//  Copyright © 2017年 com.gz.demo. All rights reserved.
//

#import "LXHomeworkDetailCell.h"
#import "LXHeader.h"

@implementation LXHomeworkDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        [self setUpUI];
    }
    return self;
}

#pragma mark --- lazy loading

-(UIImageView *)subjectIcon{
    if (!_subjectIcon) {
        _subjectIcon = [UIImageView new];
    }
    return _subjectIcon;
}



-(UILabel *)subjectContent{
    if (!_subjectContent) {
        _subjectContent = [UILabel new];
        _subjectContent.font = [UIFont systemFontOfSize:15];
        _subjectContent.textColor = [UIColor blackColor];
    }
    return _subjectContent;
}



-(UILabel *)subjectName{
    if (!_subjectName) {
        _subjectName = [UILabel new];
        _subjectName.font = [UIFont systemFontOfSize:16];
        _subjectName.textColor = [UIColor grayColor];
    }
    return _subjectName;
}



-(void)setUpUI{
    
    
    [self.contentView addSubview:self.subjectIcon];
    [_subjectIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(12);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    
    [self.contentView addSubview:self.subjectName];
    [_subjectName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_subjectIcon.mas_right).offset(10);
        make.centerY.mas_equalTo(_subjectIcon);
    }];
    
    
    [self.contentView addSubview:self.subjectContent];
    [_subjectContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.mas_equalTo(_subjectIcon);
        make.top.mas_equalTo(_subjectName.mas_bottom).offset(10);
        make.bottom.mas_equalTo(-15);
    }];
    
    
}



-(void)setDataModel:(LXHomeworkModel *)dataModel{
    if (dataModel) {
        _dataModel = dataModel;
        [self loadData];
    }
}


-(void)loadData{
    
    self.subjectName.text = _dataModel.title;
    self.subjectContent.text = _dataModel.projectTitle;
    self.subjectIcon.image = [UIImage imageNamed:_dataModel.imageName];
}




@end
