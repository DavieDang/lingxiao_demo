//
//  LXAppsButton.m
//  LingXiaoAdmin
//
//  Created by admin on 2017/6/1.
//  Copyright © 2017年 com.gz.demo. All rights reserved.
//

#import "LXAppsButton.h"

@implementation LXAppsButton
#define imageScale 0.7
//#define imageW 38/*

-(CGRect)imageRectForContentRect:(CGRect)contentRect{

    CGFloat imageH = contentRect.size.height * 0.6;
    CGFloat left = (CGRectGetWidth(contentRect)-imageH)*0.5;
    return CGRectMake(left, 0, imageH, imageH);
}


-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    
    CGFloat titleY = contentRect.size.height *0.6;
    CGFloat titleW = contentRect.size.width;
    CGFloat titleH = contentRect.size.height - titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}

@end
