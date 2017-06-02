//
//  LXScoreConcreteViewController.m
//  LingXiaoAdmin
//
//  Created by admin on 2017/6/2.
//  Copyright © 2017年 com.gz.demo. All rights reserved.
//

#import "LXScoreConcreteViewController.h"
#import "LXHeader.h"
#import "LXScoreView.h"


@interface LXScoreConcreteViewController ()

@end

@implementation LXScoreConcreteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




-(void)setUpUI{
    
    
    UIScrollView *mainView = [[UIScrollView alloc] init];
    mainView.alwaysBounceVertical = YES;
    mainView.contentSize = CGSizeMake(lx_screenWidth, lx_screenHeight);
    mainView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:mainView];
    [mainView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    LXScoreView *scoreView = [[LXScoreView alloc] init];
    scoreView.backgroundColor = [UIColor whiteColor];
    [mainView addSubview:scoreView];
    [scoreView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(mainView);
        make.height.mas_equalTo(150);
        make.width.mas_equalTo(mainView);
    }];
    [scoreView setUpUI];
    
    
    
    UIView *sheet = [[UIView alloc] init];
    sheet.backgroundColor = [UIColor whiteColor];
    [mainView addSubview:sheet];
    [sheet mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(scoreView.mas_bottom).offset(10);
        make.left.mas_equalTo(0);
        make.width.mas_equalTo(mainView);
        make.height.mas_equalTo(100);
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
