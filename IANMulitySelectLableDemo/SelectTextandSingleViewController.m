//
//  SelectTextandSingleViewController.m
//  IANMulitySelectLableDemo
//
//  Created by ian on 15/6/10.
//  Copyright (c) 2015年 ian. All rights reserved.
//

#import "SelectTextandSingleViewController.h"
#import "IANSingleTextandSelectLabView.h"

@interface SelectTextandSingleViewController ()

@end

@implementation SelectTextandSingleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    self.title = @"输入框和单选混合选择器";
    IANSingleTextandSelectLabView *view = [[IANSingleTextandSelectLabView alloc] initWithFrame:CGRectMake(15, 200, self.view.bounds.size.width - 30, 90)];
    NSArray *array = @[@"我萌吗",@"降多少",@"萌",@"多大啊"];
    view.paramsArray = array;
    view.textFieldIndexArray = @[@(1),@(3)];
    view.textFieldLeftTitleArray = @[@"", @"降价:"];
    view.textFieldRightUnitArray = @[@"", @"万元"];
    view.textFieldPlaceholderArray = @[@"请输入", @"请输入"];
    view.columnsNumber = 2;
    view.tag = 999;
    [self.view addSubview:view];
    [view startLoading];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
   
    NSLog(@"哇哈哈:%@",( (IANSingleTextandSelectLabView *)[self.view viewWithTag:999]).saveParam);
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
