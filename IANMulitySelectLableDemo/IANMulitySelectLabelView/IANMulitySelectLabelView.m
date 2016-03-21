//
//  IANMulitySelectLabelView.m
//  IANMulitySelectLableDemo
//
//  Created by ian on 15/6/2.
//  Copyright (c) 2015年 ian. All rights reserved.
//

#import "IANMulitySelectLabelView.h"

@interface IANMulitySelectLabelView()

@property (strong, nonatomic) UIView *backView;

@end

@implementation IANMulitySelectLabelView

- (void)startLoading
{
    [self _initView];
}

#pragma mark -private Methods-
- (void)_initView
{
    if (_backView) {
        return;
    }
    _backView = ({
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height)];
        view.backgroundColor = [UIColor whiteColor];
        [self addSubview:view];
        view;
    });
    float btnWidth = _backView.bounds.size.width/_columnsNumber - 10;
    float btnHeight = 0;
    NSInteger row = 0;
    if(!(_paramsArray.count%_columnsNumber)){
        row = _paramsArray.count/_columnsNumber;
        btnHeight = _backView.bounds.size.height/row - 10;
    } else {
        row = _paramsArray.count/_columnsNumber + 1;
        btnHeight = _backView.bounds.size.height/row - 10;
    }

    NSInteger k = 0;
    for (NSInteger i = 0; i<row; i++) {
        for (NSInteger j = 0; j<_columnsNumber; j++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(j*(btnWidth+10)+5, i*(btnHeight+10)+5, btnWidth, btnHeight);
            if (k<_paramsArray.count) {
                [btn setTitle:[NSString stringWithFormat:@"%@",_paramsArray[k]] forState:UIControlStateNormal];
                [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
                [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
                btn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
                btn.tag = k;
                [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
                k++;
                
                if (j<_columnsNumber-1) {
                    UIView *lineView = [[UIView alloc] init];
                    lineView.frame = CGRectMake(btn.frame.origin.x+btn.frame.size.width+5, btn.frame.origin.y+btn.frame.size.height*0.3*0.5, 1, btn.frame.size.height*0.7);
                    lineView.backgroundColor = [UIColor colorWithRed:239/255.0f green:238/255.0f blue:238/255.0f alpha:1];
                    [_backView addSubview:lineView];
                }

            }
            [_backView addSubview:btn];
            

        }
    }
    self.saveParamsArray = [NSMutableArray array];
}

- (void)btnClick:(UIButton *)btn
{
    NSLog(@"%ld",(long)btn.tag);
    if (!_isMutableChoice) {
        for (UIView *subView in _backView.subviews) {
            if ([subView isKindOfClass:[UIButton class]]) {
                UIButton *btn1 = (UIButton *)subView;
                if (btn1.tag == btn.tag) {
                    if ([self.saveParamsArray containsObject:@(btn.tag)]) {
                        [self.saveParamsArray removeObjectIdenticalTo:@(btn.tag)];
                        btn1.selected = NO;
                    }else{
                        [self.saveParamsArray removeAllObjects];
                        [self.saveParamsArray addObject:@(btn.tag)];
                        btn1.selected = YES;
                    }
                    
                }else{
                    btn1.selected = NO;
                }
            }
        }

    } else {
        if (btn.selected) {
            [self.saveParamsArray removeObjectIdenticalTo:@(btn.tag)];
            btn.selected = NO;
        }else{
            [self.saveParamsArray addObject:@(btn.tag)];
            btn.selected = YES;
        }
    }

    NSLog(@"再次测试：%@",self.saveParamsArray);
}

- (void)setSaveParamsArray:(NSMutableArray *)saveParamsArray
{
    _saveParamsArray = saveParamsArray;
}
@end
