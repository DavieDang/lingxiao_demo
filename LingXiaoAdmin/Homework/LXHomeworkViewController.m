//
//  LXHomeworkViewController.m
//  LingXiaoAdmin
//
//  Created by admin on 2017/6/1.
//  Copyright © 2017年 com.gz.demo. All rights reserved.
//

#import "LXHomeworkViewController.h"
#import <Masonry/Masonry.h>
#import "UITableView+FDTemplateLayoutCell.h"
#import "LXMHomeworkDetailViewController.h"
#import "LXScoreInquiryViewController.h"

#import "LXHomeworkCell.h"
@interface LXHomeworkViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *studyDataArray;


@end

@implementation LXHomeworkViewController

#pragma mark --- lazy loading

-(NSArray *)studyDataArray{
    if (!_studyDataArray) {
        
        LXHomeworkModel *model1 = [LXHomeworkModel new];
        model1.title = @"学生作业";
        model1.projectTitle = @"作业已发布，共6项";
        model1.taskTitle = @"语文2项，数学1项，英语3项";
        model1.updateTime = @"更新时间6月1日，17：00";
        model1.imageName = @"smile_green";
        
        LXHomeworkModel *model2 = [LXHomeworkModel new];
        model2.title = @"考试成绩";
        model2.projectTitle = @"语文成绩88，平均85";
        model2.taskTitle = @"考试为单元测试";
        model2.updateTime = @"更新时间6月1日，17：00";
        model2.imageName = @"smile_green";
        
        _studyDataArray = @[model1,model2];
     
        
    }
    return _studyDataArray;
}

-(UITableView *)tableView{
    if (!_tableView ) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[LXHomeworkCell class] forCellReuseIdentifier:@"testCell"];
        [_tableView registerClass:[LXHomeworkGreetCell class] forCellReuseIdentifier:@"testCell2"];
         [_tableView registerClass:[LXRecommendCell class] forCellReuseIdentifier:@"testCell3"];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"作业";
    
    [self setUpUI];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark --- UITableViewDataSource,UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    switch (section) {
        case 0:
            return 1;
            break;
            
        case 1:
            return self.studyDataArray.count;
            break;
            
        case 2:
            return 2;
            break;
            
            
        default:
            
            return 1;
            break;
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 0;
            break;
            
        default:
            return 30;
            break;
    }
  
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 10;
}



-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{

      return UITableViewAutomaticDimension;
    
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 3) {
          return 150;
    }else{
        return UITableViewAutomaticDimension;
    }
  
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 4;
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.section == 0) {
        
        LXHomeworkGreetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"testCell2" forIndexPath:indexPath];
        return cell;
        
    }else if( indexPath.section == 1){
        LXHomeworkCell *cell = [tableView dequeueReusableCellWithIdentifier:@"testCell" forIndexPath:indexPath];
        cell.dataModel = self.studyDataArray[indexPath.row];
        return cell;
    }else if(indexPath.section == 2){
        LXHomeworkCell *cell = [tableView dequeueReusableCellWithIdentifier:@"testCell" forIndexPath:indexPath];
        LXHomeworkModel *model = [LXHomeworkModel new];
        model.title = @"德育评分";
        model.projectTitle = @"德育更新评分A";
        model.updateTime = @"更新时间6月1日，17：00";
        model.imageName = @"smile_green";
        cell.dataModel = model;
        return cell;
    }else{
        
        LXRecommendCell *cell = [tableView dequeueReusableCellWithIdentifier:@"testCell3" forIndexPath:indexPath];
        
        return cell;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
        switch (section) {
            case 0:
                return  nil;
                break;
            case 1:
                return  [self headerViewForTableViewWithTitle:@"学生在校学习情况"];
                break;
            case 2:
                return  [self headerViewForTableViewWithTitle:@"学生在校表现情况"];
                break;
            default:
                return [self headerViewForTableViewWithTitle:@"推荐学习课程"];
                
                break;
        }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    switch (indexPath.row) {
        case 0:{
            LXMHomeworkDetailViewController *vc = [LXMHomeworkDetailViewController new];
            vc.vc_title = @"学生作业";
            UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:vc];
            [self presentViewController:navc animated:YES completion:nil];
            break;
        }
            
        default:{
            
            LXScoreInquiryViewController *vc2 = [LXScoreInquiryViewController new];
            UINavigationController *navc2 = [[UINavigationController alloc] initWithRootViewController:vc2];
            [self presentViewController:navc2 animated:YES completion:nil];
            break;
        }
    }
    

    
    

}



#pragma mark --- setUI

-(void)setUpUI{
    
    [self.view addSubview:self.tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(0);
        make.top.mas_equalTo(30);
    }];
    
}



-(UIView *)headerViewForTableViewWithTitle:(NSString *)title{
    
    
    UIView *heaerView = [UIView new];
    heaerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    UIView *bgView = [UIView new];
    bgView.backgroundColor = [UIColor whiteColor];
    [heaerView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.bottom.mas_equalTo(-1);
        make.top.mas_equalTo(0);
    }];
    
    UILabel *titleLb = [UILabel new];
    titleLb.text = title;
    titleLb.font = [UIFont systemFontOfSize:12];
    titleLb.textColor = [UIColor grayColor];
    [bgView addSubview:titleLb];
    [titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(10);
        make.centerY.mas_equalTo(bgView);
    }];
    
    UIButton *moreBtn = [UIButton buttonWithType:0];
    [moreBtn setTitle:@"查看全部" forState:0];
    moreBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    [moreBtn setTitleColor:[UIColor grayColor] forState:0];
    [bgView addSubview:moreBtn];
    [moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-5);
        make.centerY.mas_equalTo(bgView);
    }];
    
    return heaerView;
    
}



//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//
//    return [tableView fd_heightForCellWithIdentifier:@"testCell2" configuration:^(LXHomeworkGreetCell *cell) {
//      cell.greetLb.text = @"林锡玲家长，您好!";
//    }];
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
