//
//  ViewController.m
//  XYXCirculateViewDemo
//
//  Created by vlusi on 16/8/2.
//  Copyright © 2016年 XYX. All rights reserved.
//

#import "ViewController.h"
#import "XYXCirculateView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    XYXCirculateView *circulate = [[XYXCirculateView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 200)];
    
    circulate.imagesArray = @[[UIImage imageNamed:@"00"],[UIImage imageNamed:@"01"],[UIImage imageNamed:@"02"],[UIImage imageNamed:@"03"]];
    //可设置可不设置
    circulate.currentColor = [UIColor redColor];
    //可设置可不设置
    circulate.otherColor = [UIColor darkGrayColor];
    
    [self.view addSubview:circulate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
