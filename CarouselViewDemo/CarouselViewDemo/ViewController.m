//
//  ViewController.m
//  CarouselViewDemo
//
//  Created by LiCheng on 16/6/16.
//  Copyright © 2016年 Li_Cheng. All rights reserved.
//

#import "ViewController.h"
#import "CarouselView.h"
@interface ViewController ()<CarouselViewDelegate>

@property (weak, nonatomic) IBOutlet CarouselView *carouseV;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *imageArr = @[[UIImage imageNamed:@"2"], [UIImage imageNamed:@"3"], [UIImage imageNamed:@"4"], [UIImage imageNamed:@"5"] ];
    
    NSArray *desArr = @[@"第一张", @"第二张", @"第三张", @"第四张"];
    
    CarouselView *carouselView = [CarouselView carouselViewWithImageArray:imageArr describeArray:desArr];
    
    // 设置frame
    carouselView.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 180);
    
    // 设置代理 监听点击事件
    carouselView.delegate = self;
    
    // 设置每张图片的停留时间，默认值为5s，最少为2s
    carouselView.time = 2;
    
    // 设置分页控件的图片,不设置则为系统默认
    [carouselView setPageImage:[UIImage imageNamed:@"other"] andCurrentPageImage:[UIImage imageNamed:@"current"]];
    
    // 设置分页控件的位置，默认为PositionBottomCenter
    carouselView.pagePosition = PositionBottomRight;
    
    
    /**
     *  修改图片描述控件的外观，不需要修改的传nil
     *
     *  参数一 字体颜色，默认为白色
     *  参数二 字体，默认为13号字体
     *  参数三 背景颜色，默认为黑色半透明
     */
    UIColor *bgColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    UIFont *font = [UIFont systemFontOfSize:15];
    UIColor *textColor = [UIColor greenColor];
    [carouselView setDescribeTextColor:textColor font:font bgColor:bgColor];
    
    
    [self.view addSubview:carouselView];
    
    
    
    
    
    /**
     *  通过storyboard创建的轮播控件
     */
    self.carouseV.imageArray = imageArr;
    //设置分页控件指示器的颜色
    [self.carouseV setPageColor:[UIColor blueColor] andCurrentPageColor:[UIColor redColor]];
    //设置图片切换的方式
    self.carouseV.changeMode = ChangeModeFade;
    //用block处理图片点击事件
    self.carouseV.imageClickBlock = ^(NSInteger index){
        NSLog(@"点击了第%ld张图片", index);
    };
    self.carouseV.time = 3;
    
}

#pragma mark XRCarouselViewDelegate
- (void)carouselView:(CarouselView *)carouselView clickImageAtIndex:(NSInteger)index {
    NSLog(@"点击了第%ld张图片", index);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
