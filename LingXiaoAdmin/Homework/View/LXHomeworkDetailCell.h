//
//  LXHomeworkDetailCell.h
//  LingXiaoAdmin
//
//  Created by admin on 2017/6/2.
//  Copyright © 2017年 com.gz.demo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXHomeworkModel.h"

@interface LXHomeworkDetailCell : UITableViewCell

/**
 学科名称
 */
@property (nonatomic, strong) UILabel *subjectName;

/**
 学科内容
 */
@property (nonatomic, strong) UILabel *subjectContent;


/**
 图标
 */
@property (nonatomic, strong) UIImageView *subjectIcon;


/**
 请求数据
 */
@property (nonatomic, strong) LXHomeworkModel *dataModel;

@end
