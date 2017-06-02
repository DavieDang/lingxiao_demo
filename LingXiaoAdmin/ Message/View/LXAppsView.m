//
//  LXAppsView.m
//  LingXiaoAdmin
//
//  Created by admin on 2017/6/1.
//  Copyright © 2017年 com.gz.demo. All rights reserved.
//

#import "LXAppsView.h"
#import <Masonry/Masonry.h>
#import "LXHeader.h"


#define btn_margin 10

@implementation LXAppsView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setUpUI];
    }
    return self;
}




-(void)setUpUI{
 
    [self.dataArr enumerateObjectsUsingBlock:^(LXAppsModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        LXAppsButton *btn = [LXAppsButton buttonWithType:0];
        btn.backgroundColor = [UIColor whiteColor];
        NSInteger row = idx / 4;
        NSInteger col = idx % 4;
        [btn setTitle:obj.title forState:0];
        btn.titleLabel.textAlignment = NSTextAlignmentCenter;
        [btn setTitleColor:[UIColor blackColor] forState:0];
        [btn setImage:[UIImage imageNamed:@"smile_red"] forState:0];
        [self addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10+(row*10) + row*60);
            make.left.mas_equalTo(10+(col*10)+col*(lx_screenWidth-btn_margin*5)/4);
            make.size.mas_equalTo(CGSizeMake((lx_screenWidth-btn_margin*5)/4, 60));
        }];
    }];
}

-(NSArray<LXAppsModel *> *)dataArr{
    if (!_dataArr) {
       
        LXAppsModel *model = [LXAppsModel new];
        model.title = @"支付宝";
        model.imageName = @"smile_red";
         _dataArr = @[model,model,model,model,model,model,model,model];
    }
    return _dataArr;
}

@end
