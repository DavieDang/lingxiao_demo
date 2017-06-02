//
//  LXHomeworkCell.m
//  LingXiaoAdmin
//
//  Created by admin on 2017/6/1.
//  Copyright © 2017年 com.gz.demo. All rights reserved.
//

#import "LXHomeworkCell.h"
#import "LXHeader.h"



@implementation LXHomeworkCell



-(UILabel *)title{
    if (!_title) {
        _title = [UILabel new];
        _title.numberOfLines = 0;
        _title.font = [UIFont systemFontOfSize:14];
        _title.textColor = [UIColor grayColor];
    }
    return _title;
}

-(UILabel *)projectTitle{
    if (!_projectTitle) {
        _projectTitle = [UILabel new];
        _projectTitle.font = [UIFont systemFontOfSize:17];
        _projectTitle.textColor = [UIColor blackColor];
    }
    return _projectTitle;
}


-(UILabel *)taskTitle{
    if (!_taskTitle) {
        _taskTitle = [UILabel new];
         _taskTitle.font = [UIFont systemFontOfSize:14];
        _taskTitle.textColor = [UIColor grayColor];
        
    }
    return _taskTitle;
}


-(UILabel *)updateTime{
    if (!_updateTime) {
        _updateTime = [UILabel new];
        _updateTime.font = [UIFont systemFontOfSize:12];
        _updateTime.textColor = [UIColor grayColor];
    }
    return _updateTime;
}



-(UIImageView *)icon{
    if (!_icon) {
        _icon = [UIImageView new];
    }
    return _icon;
}

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

#pragma mark --- setUI

-(void)setUpUI{
    
    [self.contentView addSubview:self.icon];
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(5);
        make.size.mas_equalTo(CGSizeMake(20, 20));
        
    }];
    
    
    
    [self.contentView addSubview:self.title];
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_icon.mas_right).offset(10);
        make.centerY.mas_equalTo(_icon);
    }];
    
    
    [self.contentView addSubview:self.projectTitle];
    [self.projectTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.mas_equalTo(_title);
        make.top.mas_equalTo(_title.mas_bottom).offset(5);
  }];
    
    
    [self.contentView addSubview:self.taskTitle];
    [self.taskTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.mas_equalTo(_title);
        make.top.mas_equalTo(_projectTitle.mas_bottom).offset(5);
    }];
    
    [self.contentView addSubview:self.updateTime];
    [self.updateTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leftMargin.mas_equalTo(_title);
        make.top.mas_equalTo(_taskTitle.mas_bottom).offset(5);
        make.bottom.mas_equalTo(-10);
    }];
    
    
}

-(void)setDataModel:(LXHomeworkModel *)dataModel{
    if (dataModel) {
        _dataModel = dataModel;
        [self loadData];
    }
}


-(void)loadData{
    
    self.title.text = _dataModel.title;
    self.projectTitle.text = _dataModel.projectTitle;
    self.taskTitle.text = _dataModel.taskTitle;
    self.updateTime.text = _dataModel.updateTime;
    self.icon.image = [UIImage imageNamed:_dataModel.imageName];
}


@end


@implementation LXHomeworkGreetCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpUI];
    }
    return self;
}

-(UILabel *)greetLb{
    if (!_greetLb) {
        _greetLb = [UILabel new];
        _greetLb.text = @"林锡玲家长，您好!";
        _greetLb.textColor = [UIColor grayColor];
        _greetLb.numberOfLines = 1;
        _greetLb.font = [UIFont systemFontOfSize:16];
    }
    return _greetLb;
}

-(UIButton *)editingBtn{
    if (!_editingBtn) {
        _editingBtn = [UIButton buttonWithType:0];
//        _editingBtn.backgroundColor = [UIColor redColor];
        [_editingBtn setTitle:@"编辑" forState:0];
        [_editingBtn setTitleColor:[UIColor blackColor] forState:0];
        _editingBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    }
    return _editingBtn;
}


-(void)setUpUI{
    
    __weak typeof(self) weakSelf = self;
    
    [self.contentView addSubview:self.editingBtn];
    [_editingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.mas_equalTo(weakSelf);
        make.size.mas_equalTo(CGSizeMake(60, 30));
    }];
    
    
    [self.contentView addSubview:self.greetLb];
    [self.greetLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.right.mas_equalTo(_editingBtn.mas_left).offset(10);
        make.centerY.mas_equalTo(weakSelf);
    }];
}


@end

@implementation LXRecommendCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUpUI];
    }
    return self;
}


-(UIView *)courseView{
    if (!_courseView) {
        _courseView = [UIView new];
    }
    return _courseView;
}


-(void)setUpUI{
    
    [self.contentView addSubview:self.courseView];
    [_courseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    for (int i = 0; i<4; i++) {
        UIImageView *icon = [[UIImageView alloc] init];
        icon.backgroundColor = [UIColor grayColor];
        [_courseView addSubview:icon];
        [icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(5+i*10 + (lx_screenWidth-40)/4 * i);
            make.top.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake((lx_screenWidth-40)/4, (lx_screenWidth-40)/4));
        }];
    }
    

    
}


@end
