//
//  IANMulitySelectLabelView.h
//  IANMulitySelectLableDemo
//
//  Created by ian on 15/6/2.
//  Copyright (c) 2015年 ian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IANMulitySelectLabelView : UIView

// 控制是多选还是单选
@property (nonatomic) BOOL isMutableChoice;
// 控制列数
@property (nonatomic) NSUInteger columnsNumber;
// 传入的参数
@property (strong, nonatomic) NSArray *paramsArray;
// 选择完毕保存的参数
@property (strong, nonatomic, readonly) NSMutableArray *saveParamsArray;

// 开始加载此视图
- (void)startLoading;
@end
