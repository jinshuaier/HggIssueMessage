//
//  HggNumTextfieldView.h
//  HggIssueMessage
//
//  Created by 胡高广 on 2017/8/31.
//  Copyright © 2017年 jinshuaier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HggNumTextfieldView : UIView

@property (nonatomic, strong) UITextView *textview;
@property (nonatomic, strong) UILabel *textLabel;

@property (nonatomic, strong) UIView *textNumView;
@property (nonatomic, strong) UILabel *textNumberLabel;

@property (nonatomic, strong) UILabel *toplabel;


//我想要的高度
@property (nonatomic, assign) int numHight;
@end
