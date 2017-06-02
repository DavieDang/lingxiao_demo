//
//  LXTabBarViewController.m
//  LingXiaoAdmin
//
//  Created by admin on 2017/5/31.
//  Copyright © 2017年 com.gz.demo. All rights reserved.
//

#import "LXTabBarViewController.h"
#import "LXMessageListViewController.h"
#import "LXHomeworkViewController.h"
#import "LXMeViewController.h"
#import "LXAddressBookViewController.h"

@interface LXTabBarViewController ()

@end

@implementation LXTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    LXMessageListViewController *vc1 = [LXMessageListViewController new];
    LXHomeworkViewController *vc2 = [LXHomeworkViewController new];
    LXAddressBookViewController *vc3 = [LXAddressBookViewController new];
    LXMeViewController *vc4 = [LXMeViewController new];
    
  
    [self addChildController:vc1 andTitle:@"消息" andImage:@"smile_green" andSelectImage:@"smile_green"];
    [self addChildController:vc2 andTitle:@"作业" andImage:@"smile_green" andSelectImage:@"smile_green"];
    [self addChildController:vc3 andTitle:@"通讯录" andImage:@"smile_green" andSelectImage:@"smile_green"];
    [self addChildController:vc4 andTitle:@"我" andImage:@"smile_green" andSelectImage:@"smile_green"];

    
    
    
    
    // Do any additional setup after loading the view.
}



/**
 添加子控制器

 @param controller 子控制器
 @param image 图片名
 @param selectImage 选中的图片名
 */
- (void)addChildController:(UIViewController *)controller andTitle:(NSString *)title andImage:(NSString * )image andSelectImage:(NSString *)selectImage{
    controller.tabBarItem.title = title;
    UIImage *imaged = [UIImage imageNamed:image];
    [imaged imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UIImage *selectedImaged = [UIImage imageNamed:selectImage];
    [selectedImaged imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    controller.tabBarItem.image = imaged;
    controller.tabBarItem.selectedImage = selectedImaged;
//    UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:controller];
    [self addChildViewController:controller];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
