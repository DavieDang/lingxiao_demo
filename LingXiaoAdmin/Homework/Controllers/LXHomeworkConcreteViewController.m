//
//  LXHomeworkConcreteViewController.m
//  LingXiaoAdmin
//
//  Created by admin on 2017/6/2.
//  Copyright © 2017年 com.gz.demo. All rights reserved.
//

#import "LXHomeworkConcreteViewController.h"
#import "LXHeader.h"

@interface LXHomeworkConcreteViewController ()



@end

@implementation LXHomeworkConcreteViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = @"语文作业";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)setUpUI{
    
    
    
    UIScrollView *mainView = [[UIScrollView alloc] init];
    mainView.contentSize = CGSizeMake(lx_screenWidth, lx_screenHeight);
    mainView.alwaysBounceVertical = YES;
    mainView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:mainView];
    [mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    
    UIView *subjectView = [[UIView alloc] init];
    subjectView.backgroundColor = [UIColor whiteColor];
    [mainView addSubview:subjectView];
    [subjectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(mainView);
        make.height.mas_equalTo(200);
    }];
    
    
    UILabel *timeLb = [UILabel new];
    timeLb.font = [UIFont systemFontOfSize:15];
    timeLb.text = @"6月1日 周四";
    timeLb.textColor = [UIColor blackColor];
    [subjectView addSubview:timeLb];
    [timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(12);
        make.top.mas_equalTo(10);
    }];
    
    
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [subjectView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(timeLb.mas_bottom).offset(12);
        make.height.mas_equalTo(1);
    }];
    
    UITextView *textView = [[UITextView alloc] init];
    textView.text = @"1、背诵古文 2、三年高考五年模P10-P26";
    textView.font = [UIFont systemFontOfSize:14];
    textView.textColor = [UIColor grayColor];
    [subjectView addSubview:textView];
    [textView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lineView.mas_bottom);
        make.left.right.bottom.mas_equalTo(0);
    }];
    
    
    
    
    UIView *unfinishedView = [[UIView alloc] init];
    unfinishedView.backgroundColor = [UIColor whiteColor];
    [mainView addSubview:unfinishedView];
    [unfinishedView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(mainView);
        make.top.mas_equalTo(subjectView.mas_bottom).offset(20);
        make.height.mas_equalTo(90);
    }];
    
    UIImageView *icon = [[UIImageView alloc] init];
    icon.backgroundColor = [UIColor grayColor];
    [unfinishedView addSubview:icon];
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.mas_equalTo(12);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    UILabel *unfinishLb = [UILabel new];
    unfinishLb.font = [UIFont systemFontOfSize:15];
    unfinishLb.text = @"未交齐";
    unfinishLb.textColor = [UIColor blackColor];
    [unfinishedView addSubview:unfinishLb];
    [unfinishLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(icon.mas_right).offset(5);
        make.centerY.mas_equalTo(icon);
    }];

    UILabel *unfinishDetailLb = [UILabel new];
    unfinishDetailLb.font = [UIFont systemFontOfSize:15];
    unfinishDetailLb.text = @"三年高考五年模拟p10-p26未交";
    unfinishDetailLb.textColor = [UIColor grayColor];
    [unfinishedView addSubview:unfinishDetailLb];
    [unfinishDetailLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(icon);
        make.top.mas_equalTo(icon.mas_bottom).offset(10);
        make.bottom.mas_equalTo(-12);
    }];
    
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
