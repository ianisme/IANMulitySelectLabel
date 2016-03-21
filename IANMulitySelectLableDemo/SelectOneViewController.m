//
//  SelectOneViewController.m
//  IANMulitySelectLableDemo
//
//  Created by ian on 15/6/2.
//  Copyright (c) 2015年 ian. All rights reserved.
//

#import "SelectOneViewController.h"
#import "IANMulitySelectLabelView.h"
@interface SelectOneViewController ()

@end

@implementation SelectOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"单选";
    self.view.backgroundColor = [UIColor grayColor];
    IANMulitySelectLabelView *view = [[IANMulitySelectLabelView alloc] initWithFrame:CGRectMake(15, 200, self.view.bounds.size.width - 30, 90)];
    NSArray *array = @[@"我萌吗",@"萌不",@"萌",@"哈哈哈"];
    view.paramsArray = array;
    view.columnsNumber = 3;
    view.isMutableChoice = NO;
    ;
    [self.view addSubview:view];
    [view startLoading];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
