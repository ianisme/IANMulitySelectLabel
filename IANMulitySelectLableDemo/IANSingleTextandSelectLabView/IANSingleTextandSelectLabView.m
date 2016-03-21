//
//  IANSingleTextandSelectLabView.m
//  IANMulitySelectLableDemo
//
//  Created by ian on 15/6/10.
//  Copyright (c) 2015年 ian. All rights reserved.
//

#import "IANSingleTextandSelectLabView.h"

@interface IANSingleTextandSelectLabView ()<UITextFieldDelegate>

@property (strong, nonatomic) UIView *backView;

@property (nonatomic, strong) NSMutableArray *saveParamsArray;

@end

@implementation IANSingleTextandSelectLabView

- (void)startLoading
{
    [self _initView];
}

#pragma mark - private methods
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
    NSInteger p = 0;
    for (NSInteger i = 0; i<row; i++) {
        for (NSInteger j = 0; j<_columnsNumber; j++) {
            
            if ([self.textFieldIndexArray containsObject:@(k)]) {
                UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(j*(btnWidth+10)+5, i*(btnHeight+10)+5, btnWidth, btnHeight)];
                
                if (![_textFieldLeftTitleArray[p] isEqualToString:@""]) {
                    UIView *leftBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 19)];
                    UILabel *leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, -0.5, 50, 19)];
                    [leftBackView addSubview:leftLabel];
                    leftLabel.font = [UIFont systemFontOfSize:16.0f];
                    
                    leftLabel.text = _textFieldLeftTitleArray[p];
                    
                    leftLabel.textAlignment = NSTextAlignmentRight;
                    textField.leftView = leftBackView;
                    textField.leftViewMode = UITextFieldViewModeNever;
                }
                
                if (![_textFieldRightUnitArray[p] isEqualToString:@""]) {
                    UIView *rightBackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 19)];
                    UILabel *rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, -0.5, 50, 19)];
                    [rightBackView addSubview:rightLabel];
                    if (p<_textFieldRightUnitArray.count) {
                        rightLabel.text = _textFieldRightUnitArray[p];
                    }
                    rightLabel.textAlignment = NSTextAlignmentLeft;
                    textField.rightView = rightBackView;
                    textField.rightViewMode = UITextFieldViewModeNever;

                }
                
                if (![_textFieldPlaceholderArray[p] isEqualToString:@""]) {
                    textField.placeholder = _textFieldPlaceholderArray[p];
                }
                
                textField.delegate = self;
                
                if (k<_paramsArray.count) {
                    textField.tag = k+999;
                    textField.font= [UIFont systemFontOfSize:16.0f];
                    textField.textAlignment = NSTextAlignmentCenter;
                    textField.clearButtonMode = UITextFieldViewModeNever;
                    [textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
                    if (j<_columnsNumber-1) {
                        UIView *lineView = [[UIView alloc] init];
                        lineView.frame = CGRectMake(textField.frame.origin.x+textField.frame.size.width+5, textField.frame.origin.y+textField.frame.size.height*0.3*0.5, 1, textField.frame.size.height*0.7);
                        lineView.backgroundColor = [UIColor colorWithRed:239/255.0f green:238/255.0f blue:238/255.0f alpha:1];
                        [_backView addSubview:lineView];
                    }
                    [_backView addSubview:textField];
                    p++;
                }
            }
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(j*(btnWidth+10)+5, i*(btnHeight+10)+5, btnWidth, btnHeight);
            btn.backgroundColor = [UIColor whiteColor];
            if (k<_paramsArray.count) {
                [btn setTitle:[NSString stringWithFormat:@"%@",_paramsArray[k]] forState:UIControlStateNormal];
                [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [btn setTitleColor:[UIColor redColor] forState:UIControlStateHighlighted];
                [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
                btn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
                btn.tag = k;
                [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
                
                if (j<_columnsNumber-1) {
                    UIView *lineView = [[UIView alloc] init];
                    lineView.frame = CGRectMake(btn.frame.origin.x+btn.frame.size.width+5, btn.frame.origin.y+btn.frame.size.height*0.3*0.5, 1, btn.frame.size.height*0.7);
                    lineView.backgroundColor = [UIColor colorWithRed:239/255.0f green:238/255.0f blue:238/255.0f alpha:1];
                    [_backView addSubview:lineView];
                }
                
            }
            [_backView addSubview:btn];
                
            k++;
            
        }
    }
    self.saveParamsArray = [NSMutableArray array];
}


#pragma mark - event response
- (void)btnClick:(UIButton *)btn
{
//    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    for (UIView *subView in _backView.subviews) {
        if ([subView isKindOfClass:[UIButton class]]) {
            UIButton *btn1 = (UIButton *)subView;
            if (btn1.tag == btn.tag) {
                if ([self.textFieldIndexArray containsObject:@(btn.tag)]) {
                    btn1.hidden = YES;
                    UITextField *textField = (UITextField *)[_backView viewWithTag:btn1.tag+999];
                    [textField becomeFirstResponder];
                }
                if ([self.saveParamsArray containsObject:@(btn.tag)]) {
                    [self.saveParamsArray removeObjectIdenticalTo:@(btn.tag)];
                    btn1.selected = NO;
                    _saveParam = nil;
                }else{
                    [self.saveParamsArray removeAllObjects];
                    [self.saveParamsArray addObject:@(btn.tag)];
                    btn1.selected = YES;
                    _saveParam = _paramsArray[btn.tag];
                }
                
            }else{
                btn1.selected = NO;
                btn1.hidden = NO;
            }
        }
    }
}

#pragma mark - CustomDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.rightViewMode = UITextFieldViewModeAlways;

    for (UIView *subView in _backView.subviews) {
        if ([subView isKindOfClass:[UIButton class]]) {
            UIButton *btn = (UIButton *)subView;
            [self.saveParamsArray removeAllObjects];
            btn.selected = NO;
        }
    }

}

- (void)textFieldDidChange:(UITextField *)textField
{
    _saveParam = textField.text;
}


@end
