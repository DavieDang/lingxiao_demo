//
//  LXMessageListViewController.m
//  LingXiaoAdmin
//
//  Created by admin on 2017/5/31.
//  Copyright © 2017年 com.gz.demo. All rights reserved.
//

#import "LXMessageListViewController.h"
#import "UIView+Frame.h"
#import <Masonry/Masonry.h>
#import "LXAppsView.h"
#import "LXHeader.h"


static NSString *const identifier = @"listCell";

@interface LXMessageListViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

/**
 主视图
 */
@property (nonatomic, strong) UIScrollView *mainView;

/**
 小应用视图
 */
@property (nonatomic, strong) UIScrollView *appsView;

/**
 一个遮盖的灰色视图
 */
@property (nonatomic, strong) UIView *coverView;


@property (nonatomic, ) BOOL isPackUp;


@property (nonatomic, strong) LXAppsView *lxappsView;


@property (nonatomic, strong) UIButton *moreBtn;



@end

@implementation LXMessageListViewController

#pragma mark --- lazy loading

-(UIScrollView *)appsView{
    if (!_appsView) {
        _appsView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, lx_screenWidth, 150)];
        _appsView.backgroundColor = [UIColor whiteColor];
        _appsView.contentSize = CGSizeMake(lx_screenWidth, 150);
        
    }
    return _appsView;
}

-(UIScrollView *)mainView{
    if (!_mainView) {
        _mainView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, lx_screenWidth, lx_screenHeight)];
        _mainView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        _mainView.alwaysBounceVertical = YES;
        _mainView.showsVerticalScrollIndicator = YES;
        _mainView.delegate = self;
        _mainView.contentSize = CGSizeMake(lx_screenWidth, 65 * 20 + 150);
        _mainView.scrollEnabled = YES;
    }
    return _mainView;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 155, lx_screenWidth, 65 * 20) style:UITableViewStylePlain];
        _tableView.scrollEnabled = NO;
        _tableView.backgroundColor = [UIColor clearColor];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:identifier];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}


#pragma mark --- lifecircle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"消息";
    self.view.backgroundColor = [UIColor whiteColor];
    [self setUpUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark --- UITableViewDataSource




- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 20;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:@"smile_green"];
    cell.textLabel.text = @"天河二号";
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}



#pragma mark --- setUI

-(void)setUpUI{
    
    [self.view addSubview:self.mainView];
 
    [self.mainView addSubview:self.tableView];
    
    [self.mainView addSubview:self.appsView];
    UIButton *moreBtn = [UIButton buttonWithType:0];
    moreBtn.userInteractionEnabled = YES;
//    moreBtn.backgroundColor = [UIColor redColor];
    moreBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    self.isPackUp = moreBtn.selected;
    [moreBtn setTitle:@"全部工具v" forState:0];
    [moreBtn setTitleColor:[UIColor blackColor] forState:0];
    [moreBtn addTarget:self action:@selector(moreApps:) forControlEvents:UIControlEventTouchUpInside];
    moreBtn.size = CGSizeMake(80, 30);
    moreBtn.centerX = lx_screenWidth/2;
    moreBtn.top = 150-45;
    moreBtn.titleLabel.textAlignment = NSTextAlignmentCenter;

    
    [self.appsView addSubview:moreBtn];
    
    self.moreBtn = moreBtn;
    
    LXAppsView *appsView = [[LXAppsView alloc] initWithFrame:CGRectZero];
//    appsView.backgroundColor = [UIColor redColor];
    appsView.layer.masksToBounds = YES;
    appsView.backgroundColor = [UIColor clearColor];
    appsView.top = 20;
    appsView.left = 0;
    appsView.width = lx_screenWidth;
    appsView.height = 80;
    [self.appsView addSubview:appsView];
    self.lxappsView = appsView;
    

    //添加一个蒙版
    UIView *burf = [[UIView alloc] init];
    burf.backgroundColor = [UIColor grayColor];
    burf.alpha = 0.f;
    [self.view addSubview:burf];
    [burf mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(250);
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(packUp)];
    [burf addGestureRecognizer:tap];
    self.coverView = burf;
    
    
    

}

#pragma mark --- 更多应用
-(void)moreApps:(UIButton *)sender{
    sender.userInteractionEnabled = YES;
    self.isPackUp = !self.isPackUp;
    if (self.isPackUp) {
         self.mainView.scrollEnabled = NO;
        [UIView animateWithDuration:0.25 animations:^{
            self.coverView.alpha = 0.8f;
            self.appsView.height=250;
            self.lxappsView.height = 180;
            self.moreBtn.top = 250-45;
            [self.appsView layoutIfNeeded];
        }];
    }else{
         self.mainView.scrollEnabled = YES;
        [UIView animateWithDuration:0.25 animations:^{
            self.coverView.alpha = 0.f;
            self.appsView.height=150;
            self.lxappsView.height = 80;
            self.moreBtn.top = 150-45;
            [self.appsView layoutIfNeeded];
        }];
    }
    
}

#pragma mark --- 点击收起
-(void)packUp{
    self.isPackUp = !self.isPackUp;
     self.mainView.scrollEnabled = YES;
    [UIView animateWithDuration:0.25 animations:^{
        self.coverView.alpha = 0.f;
        self.appsView.height=150;
        self.lxappsView.height = 80;
        self.moreBtn.top = 150-45;
        [self.appsView layoutIfNeeded];
    }];
    
}



-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
//    if (scrollView == self.mainView) {
//        self.mainView.contentOffset = self.tableView.contentOffset;
//    }
    
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
