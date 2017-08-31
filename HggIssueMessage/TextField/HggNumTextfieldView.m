//
//  HggNumTextfieldView.m
//  HggIssueMessage
//
//  Created by 胡高广 on 2017/8/31.
//  Copyright © 2017年 jinshuaier. All rights reserved.
//

#import "HggNumTextfieldView.h"
//默认最大输入字数 kMaxTextCount
#define kMaxTextCount 300

@interface HggNumTextfieldView () <UITextViewDelegate>

@end

@implementation HggNumTextfieldView


//添加子控件 init方法,也会执行到这里,这时候frame还没有赋值.
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame])
    {
        //创建UI
        [self createUI];
    }
    
    return self;
}

//创建UI
- (void) createUI
{
    //加手势
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)];
    [self addGestureRecognizer:tap];
   //标题
    self.toplabel = [[UILabel alloc] init];
    self.toplabel.text = @"文字说明";
    self.toplabel.textColor = [UIColor redColor];
    self.toplabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:self.toplabel];
    
    //这里赋值frame会不准确
    self.textview = [[UITextView alloc] init];
    self.textview.delegate = self;
    self.textview.font = [UIFont systemFontOfSize:15];
    self.textview.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self addSubview:self.textview];
    
    //添加label
    self.textLabel = [[UILabel alloc] init];
    self.textLabel.textColor = [UIColor brownColor];
    self.textLabel.font = [UIFont systemFontOfSize:15];
    self.textLabel.text = @"请输入您想要的东西名称";
    [self.textview addSubview:self.textLabel];
    
    //下面添加计数的view
    self.textNumView = [[UIView alloc] init];
    self.textNumView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self addSubview:self.textNumView];
    
    //添加下面计数的label
    self.textNumberLabel = [[UILabel alloc] init];
    self.textNumberLabel.textAlignment = NSTextAlignmentRight;
    self.textNumberLabel.font = [UIFont systemFontOfSize:15];
    self.textNumberLabel.textColor = [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0];
    self.textNumberLabel.text = [NSString stringWithFormat:@"0/%d    ",kMaxTextCount];
    [self.textNumView addSubview:self.textNumberLabel];
    
    //确定子控件的frame （这里得到的self的frame/bounds才是准确的）
    CGFloat width = self.bounds.size.width;
    //CGFloat height = self.bounds.size.height;
    
    self.toplabel.frame = CGRectMake(20, 80, 100, 15);
    
    self.textview.frame = CGRectMake(20, CGRectGetMaxY(self.toplabel.frame) + 10 , width - 40, 200);
    self.textLabel.frame = CGRectMake(10, 10, self.textview.frame.size.width - 10, 15);
    
    self.textNumView.frame = CGRectMake(20, CGRectGetMaxY(self.textview.frame), width - 40, 35);
    self.textNumberLabel.frame = CGRectMake(0, 5, CGRectGetMaxX(self.textNumView.frame) - 30, 35);
    
    
    //我想要它
    self.numHight = self.textNumView.frame.size.height +  self.textNumView.frame.origin.y;
}

////在layoutSubViews方法里面布局子控件
//- (void)layoutSubviews {
//    //一调用super的方法
//    [super layoutSubviews];
//    
//    //确定子控件的frame （这里得到的self的frame/bounds才是准确的）
//    CGFloat width = self.bounds.size.width;
//    //CGFloat height = self.bounds.size.height;
//    
//    self.toplabel.frame = CGRectMake(20, 80, 100, 15);
//    
//    self.textview.frame = CGRectMake(20, CGRectGetMaxY(self.toplabel.frame) + 10 , width - 40, 200);
//    self.textLabel.frame = CGRectMake(10, 10, self.textview.frame.size.width - 10, 15);
//    
//    self.textNumView.frame = CGRectMake(20, CGRectGetMaxY(self.textview.frame), width - 40, 35);
//    self.textNumberLabel.frame = CGRectMake(0, 5, CGRectGetMaxX(self.textNumView.frame) - 30, 35);
//    
//    
//    //我想要它
//    self.numHight = self.textNumView.frame.size.height +  self.textNumView.frame.origin.y;
//}



//到达宽度自动分行
- (float) heightForString:(UITextView *)textView andWidth:(float)width{
    CGSize sizeToFit = [textView sizeThatFits:CGSizeMake(width, MAXFLOAT)];
    return sizeToFit.height;
}

//textView的代理方法
//判断开始输入
-(void)textViewDidChange:(UITextView *)textView
{
    if(textView.text.length > 0){
        self.textLabel.hidden = YES;
    }else{
        self.textLabel.hidden = NO;
    }
    self.textNumberLabel.text = [NSString stringWithFormat:@"%lu/%d    ",(unsigned long)textView.text.length,kMaxTextCount];
    if(textView.text.length >= kMaxTextCount){
        self.textNumberLabel.textColor = [UIColor redColor];
        //截取字符串
        textView.text = [textView.text substringToIndex:300];
        self.textNumberLabel.text = @"300/300";
    }else{
        self.textNumberLabel.textColor = [UIColor colorWithRed:153.0/255.0 green:153.0/255.0 blue:153.0/255.0 alpha:1.0];
    }
}

#pragma mark -- 手势点击的方法
- (void)tap
{
    [self.textview resignFirstResponder];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
