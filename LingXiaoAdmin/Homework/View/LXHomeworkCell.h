//
//  LXHomeworkCell.h
//  LingXiaoAdmin
//
//  Created by admin on 2017/6/1.
//  Copyright © 2017年 com.gz.demo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXHomeworkModel.h"

@interface LXHomeworkCell : UITableViewCell

@property (nonatomic, strong) UILabel *title;

@property (nonatomic, strong) UILabel *projectTitle;

@property (nonatomic, strong) UILabel *taskTitle;

@property (nonatomic, strong) UILabel *updateTime;

@property (nonatomic, strong) UIImageView *icon;


@property (nonatomic, strong) LXHomeworkModel *dataModel;

@end


@interface LXHomeworkGreetCell : UITableViewCell

@property (nonatomic, strong) UILabel *greetLb;

@property (nonatomic, strong) UIButton *editingBtn;


@end


@interface LXRecommendCell : UITableViewCell

@property (nonatomic, strong) UIView *courseView;


@end
