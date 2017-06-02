//
//  LXMHomeworkDetailViewController.m
//  LingXiaoAdmin
//
//  Created by admin on 2017/6/2.
//  Copyright © 2017年 com.gz.demo. All rights reserved.
//

#import "LXMHomeworkDetailViewController.h"
#import "LXHomeworkDetailCell.h"
#import "LXHeader.h"
#import "LXHomeworkConcreteViewController.h"

@interface LXMHomeworkDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation LXMHomeworkDetailViewController

#pragma mark --- lazy loading
-(UITableView *)tableView{
    if (!_tableView ) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[LXHomeworkDetailCell class] forCellReuseIdentifier:@"testCell"];
    }
    return _tableView;
}

#pragma mark --- lifeCircle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = _vc_title;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setUpUI];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark --- UITableViewDelegate,UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 30;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *heaerView = [UIView new];
    heaerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
//    UIView *bgView = [UIView new];
//    bgView.backgroundColor = [UIColor whiteColor];
//    [heaerView addSubview:bgView];
//    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.mas_equalTo(0);
//        make.bottom.mas_equalTo(-1);
//        make.top.mas_equalTo(0);
//    }];
    UILabel *titleLb = [UILabel new];
    titleLb.text = @"6月1日 周四";
    titleLb.font = [UIFont systemFontOfSize:12];
    titleLb.textColor = [UIColor grayColor];
    [heaerView addSubview:titleLb];
    [titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(10);
        make.center.mas_equalTo(heaerView);
    }];
    
    return heaerView;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    LXHomeworkDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"testCell" forIndexPath:indexPath];

    LXHomeworkModel *model = [LXHomeworkModel new];
    model.title = @"语文";
    model.projectTitle = @"1、背诵古文 2、三年高考五年模拟P10-p26";
    model.imageName = @"smile_green";
    cell.dataModel = model;
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return UITableViewAutomaticDimension;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    LXHomeworkConcreteViewController *vc = [LXHomeworkConcreteViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}

#pragma mark --- setUI
-(void)setUpUI{
    
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
       
    }];
    
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(lastvc)];
}


-(void)lastvc{
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
