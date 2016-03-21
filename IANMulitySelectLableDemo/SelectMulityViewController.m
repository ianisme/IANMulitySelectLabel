//
//  SelectMulityViewController.m
//  IANMulitySelectLableDemo
//
//  Created by ian on 15/6/10.
//  Copyright (c) 2015年 ian. All rights reserved.
//

#import "SelectMulityViewController.h"
#import "IANMulitySelectLabelView.h"
@interface SelectMulityViewController ()

@end

@implementation SelectMulityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"多选";
    self.view.backgroundColor = [UIColor grayColor];
    IANMulitySelectLabelView *view = [[IANMulitySelectLabelView alloc] initWithFrame:CGRectMake(15, 200, self.view.bounds.size.width - 30, 90)];
    NSArray *array = @[@"我萌吗",@"萌不",@"萌",@"哈哈哈"];
    view.paramsArray = array;
    view.columnsNumber = 3;
    view.isMutableChoice = YES;
    ;
    [self.view addSubview:view];
    [view startLoading];
    // Do any additional setup after loading the view.
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
