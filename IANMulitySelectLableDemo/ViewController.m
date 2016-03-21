//
//  ViewController.m
//  IANMulitySelectLableDemo
//
//  Created by ian on 15/6/2.
//  Copyright (c) 2015年 ian. All rights reserved.
//

#import "ViewController.h"
#import "SelectOneViewController.h"
#import "SelectMulityViewController.h"
#import "SelectTextandSingleViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"综合选择Demo";
    
    for (NSInteger i = 0; i < 3; i++) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(self.view.frame.size.width/2 - 100/2, 100 + i*50, 100, 30);
        btn.backgroundColor = [UIColor blackColor];
        btn.clipsToBounds = YES;
        btn.layer.cornerRadius = 5;
        if(i==0){
            [btn setTitle:@"单选" forState:UIControlStateNormal];
        }else if (i==1){
            [btn setTitle:@"多选" forState:UIControlStateNormal];
        }else if (i==2){
            [btn setTitle:@"输入混合" forState:UIControlStateNormal];
        }
        
        btn.tag = i + 999;
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
}

- (void)btnClick:(UIButton *)btn
{
    NSInteger tempTag = btn.tag - 999;
    if (tempTag == 0) {
        SelectOneViewController *controller = [SelectOneViewController new];
        [self.navigationController pushViewController:controller animated:YES];
    } else if(tempTag == 1) {
        SelectMulityViewController *controller = [SelectMulityViewController new];
        [self.navigationController pushViewController:controller animated:YES];
    } else if (tempTag == 2) {
        SelectTextandSingleViewController *controller = [SelectTextandSingleViewController new];
        [self.navigationController pushViewController:controller animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
