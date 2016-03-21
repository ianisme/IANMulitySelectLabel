//
//  IANSingleTextandSelectLabView.h
//  IANMulitySelectLableDemo
//
//  Created by ian on 15/6/10.
//  Copyright (c) 2015年 ian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IANSingleTextandSelectLabView : UIView

// 控制列数
@property (nonatomic) NSUInteger columnsNumber;
// 传入数据
@property (strong, nonatomic) NSArray *paramsArray;
// 为UITextfield的选项的索引值
@property (strong, nonatomic) NSArray *textFieldIndexArray;
// 为UITextfield的选项设置placeholder
@property (strong, nonatomic) NSArray *textFieldPlaceholderArray;
// 为UITextfield的选项的标题（左边）
@property (strong, nonatomic) NSArray *textFieldLeftTitleArray;
// 为UITextfield的选项的单位 (右边)
@property (strong, nonatomic) NSArray *textFieldRightUnitArray;
// 选择完毕保存的参数
@property (strong, nonatomic, readonly) NSString *saveParam;

// 开始加载此视图。
- (void)startLoading;
@end
