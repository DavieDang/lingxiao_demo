//
//  LXScoreView.m
//  LingXiaoAdmin
//
//  Created by admin on 2017/6/2.
//  Copyright © 2017年 com.gz.demo. All rights reserved.
//

#import "LXScoreView.h"
#import "LXHeader.h"

@implementation LXScoreView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(instancetype)init{
    if (self = [super init]) {
      
//    [self setUpUI];
    }
    return self;
}


-(void)setUpUI{
    
  
    
    CGFloat item_weidth = (lx_screenWidth - 6*10)/3;
    
    NSArray *titles = @[@"总分",@"平均",@"和上次测验对比"];
    NSArray *scores = @[@"100",@"95",@"+1"];
    
    for (int i = 0; i < 3; i++) {
 
        UIView *scoreView = [[UIView alloc] init];
        [self addSubview:scoreView];
        [scoreView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(20);
            make.left.mas_equalTo(10+i*20 + i*item_weidth);
            make.height.mas_equalTo(90);
            make.width.mas_equalTo(90);
        }];
        
        UILabel *scoreTitle = [UILabel new];
        scoreTitle.numberOfLines = 0;
        scoreTitle.textAlignment = NSTextAlignmentCenter;
        scoreTitle.font = [UIFont systemFontOfSize:14];
        scoreTitle.text = titles[i];
        scoreTitle.textColor = [UIColor blackColor];
        [scoreView addSubview:scoreTitle];
        [scoreTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(scoreView);
            make.bottom.mas_equalTo(scoreView.mas_bottom).offset(-10);
        }];
        
        UILabel *score = [UILabel new];
        score.numberOfLines = 0;
        score.textAlignment = NSTextAlignmentCenter;
        score.font = [UIFont systemFontOfSize:15];
        score.text = scores[i];
        score.textColor = [UIColor blackColor];
        [scoreView addSubview:score];
        [score mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(scoreView);
            make.bottom.mas_equalTo(scoreTitle.mas_top).offset(10);
            make.top.mas_equalTo(10);
        }];
    }

}

@end
