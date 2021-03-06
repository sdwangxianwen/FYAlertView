//
//  FYAlertView.m
//  FYAlertView
//
//  Created by wang on 2018/8/2.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "FYAlertView.h"
#import "UIView+FYExtension.h"

@interface FYAlertView ()

@end

@implementation FYAlertView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        [self setupUI];
    }
    return self;
}
-(void)setupUI {
    UIView *coverView = [[UIView alloc] initWithFrame:self.frame];
    coverView.backgroundColor = [UIColor blackColor];
    coverView.alpha = 0.3;
    [self addSubview:coverView];
    UIView *backView = [[UIView alloc] init];
    self.backView = backView;
    backView.backgroundColor = [UIColor whiteColor];
    backView.layer.cornerRadius = 4;
    backView.clipsToBounds = YES;
    backView.center = self.center;
    [self addSubview:backView];
    
    self.imageView = [UIImageView new];
    [backView addSubview:self.imageView];
    self.imageView.hidden = YES;
    
    self.cancleBtn = [[UIButton alloc] init];
    [backView addSubview:self.cancleBtn];
    [self.cancleBtn setTitle:@"取消" forState:(UIControlStateNormal)];
    [self.cancleBtn setBackgroundColor:[UIColor lightGrayColor]];
    [self.cancleBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
    self.cancleBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.cancleBtn addTarget:self action:@selector(canclebtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
  
    self.sureBtn = [[UIButton alloc] init];
    [backView addSubview:self.sureBtn];
    [self.sureBtn setTitle:@"确定" forState:(UIControlStateNormal)];
    [self.sureBtn setBackgroundColor:[UIColor redColor]];
    [self.sureBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    self.sureBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [self.sureBtn addTarget:self action:@selector(surebtnClick:) forControlEvents:(UIControlEventTouchUpInside)];
    
    self.titleLable = [[UILabel alloc] init];
    self.titleLable.font = [UIFont systemFontOfSize:18];
    self.titleLable.textAlignment = NSTextAlignmentCenter;
    self.titleLable.numberOfLines = 0;
    self.titleLable.textColor = [UIColor blackColor];
    [backView addSubview:self.titleLable];
    
    UIView *line = [UIView new];
    [backView addSubview:line];
    line.backgroundColor = [UIColor grayColor];
    self.line = line;
    
    self.messageLabel = [[UILabel alloc] init];
    self.messageLabel.font = [UIFont systemFontOfSize:15];
    self.messageLabel.textAlignment = NSTextAlignmentCenter;
    self.messageLabel.numberOfLines = 0;
    self.messageLabel.textColor = [UIColor blackColor];
    [backView addSubview:self.messageLabel];
}
-(void)surebtnClick:(UIButton *)sender {
    [self removeFromSuperview];
    if (self.sureBlock) {
        self.sureBlock(sender);
    }
}
-(void)canclebtnClick:(UIButton *)sender {
    [self removeFromSuperview];
    if (self.cancleBlock) {
        self.cancleBlock(sender);
    }
}

-(void)setTitle:(NSString *)title message:(NSString *)message cancleTitle:(NSString *)cancleTitle sureTitle:(NSString *)sureTitle enterAnimitionType:(enterAnimitionType)enterAnimitionType {
    //根据title 和message重置UI的frame
    if (!message) {
        return;
    }
    
    CGSize titleSize = [self sizeWithFont:[UIFont systemFontOfSize:18] maxSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 120, MAXFLOAT) string:title];
    self.titleLable.text = title;

    CGSize messageSize = [self sizeWithFont:[UIFont systemFontOfSize:15] maxSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 120, MAXFLOAT) string:message];
    self.messageLabel.text = message;
    
    self.backView.frame = CGRectMake(30, 0, [UIScreen mainScreen].bounds.size.width - 60, titleSize.height + messageSize.height + 84);
    if (self.backView.fy_height < 180) {
        self.backView.fy_height = 180;
    }
    self.titleLable.frame = CGRectMake(10, 10, self.backView.fy_width - 20, titleSize.height);
    if (title) {
         self.messageLabel.frame = CGRectMake(10, self.titleLable.fy_height + 10 + 5, self.backView.fy_width - 20, self.backView.fy_height -64 - self.titleLable.fy_height);
    } else {
         self.messageLabel.frame = CGRectMake(10, 10, self.backView.fy_width - 20, self.backView.fy_height - 64 - self.titleLable.fy_height);
    }
  
    self.cancleBtn.frame = CGRectMake(0, self.backView.fy_height - 44, self.backView.fy_width/2, 44);
    self.sureBtn.frame = CGRectMake(self.cancleBtn.fy_width, self.backView.fy_height - 44, self.backView.fy_width/2, 44);
    
    self.backView.center = [UIApplication sharedApplication].keyWindow.center;
    [self.cancleBtn setTitle:cancleTitle forState:(UIControlStateNormal)];
    [self.sureBtn setTitle:sureTitle forState:(UIControlStateNormal)];
    _enterAnimitionType = enterAnimitionType;
    if (enterAnimitionType == enterAnimitionTypeScale) {
        [self animationWithLayer:self.backView.layer duration:0.4 values:@[@0.0,@0.5,@1.0]];
    }
}

-(void)resetUI {
    self.backView.frame = CGRectMake(30, 0, [UIScreen mainScreen].bounds.size.width - 60, self.titleLable.fy_height + self.messageLabel.fy_height + 74);
    if (self.backView.fy_height < 200) {
        self.backView.fy_height = 250;
    }
    self.imageView.hidden = NO;
    self.imageView.frame = CGRectMake(0, 0, self.backView.fy_width, self.backView.fy_height - 74);
    self.cancleBtn.frame = CGRectMake(20, self.backView.fy_height - 74 + 15, (self.backView.fy_width - 60)/2, 44);
    self.cancleBtn.layer.cornerRadius = 22;
    self.cancleBtn.clipsToBounds = YES;
    self.sureBtn.frame = CGRectMake(CGRectGetMaxX(self.cancleBtn.frame) + 20, self.backView.fy_height - 74 + 15, (self.backView.fy_width - 60)/2, 44);
    self.sureBtn.layer.cornerRadius = 22;
    self.sureBtn.clipsToBounds = YES;
    [self animationWithLayer:self.backView.layer duration:0.4 values:@[@0.0,@0.5,@1.0]];
    self.backView.center = [UIApplication sharedApplication].keyWindow.center;

}

-(CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize string:(NSString *)string{
    NSDictionary *attrs = @{NSFontAttributeName:font};
    return [string boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}

//MARK:缩放动画
- (void)animationWithLayer:(CALayer *)layer duration:(CGFloat)duration values:(NSArray *)values {
    CAKeyframeAnimation *KFAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    KFAnimation.duration = duration;
    KFAnimation.removedOnCompletion = NO;
    KFAnimation.fillMode = kCAFillModeForwards;
    
    NSMutableArray *valueArr = [NSMutableArray arrayWithCapacity:values.count];
    for (NSUInteger i = 0; i<values.count; i++) {
        CGFloat scaleValue = [values[i] floatValue];
        [valueArr addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(scaleValue, scaleValue, scaleValue)]];
    }
    KFAnimation.values = valueArr;
    KFAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    [layer addAnimation:KFAnimation forKey:nil];
}


+ (FYAlertView *)getAlertView {
    NSEnumerator *subviewsEnum = [[UIApplication sharedApplication].keyWindow.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:self]) {
            FYAlertView *alertView = (FYAlertView *)subview;
            return alertView;
        }
    }
    return nil;
}

+(void)setCancleBackgroundColor:(UIColor *)cancleBackgroundColor
               cancleTitleColor:(UIColor *)cancleTitleColor
            sureBackgroundColor:(UIColor *)sureBackgroundColor
                 sureTitleColor:(UIColor *)sureTitleColor {
    FYAlertView *alertView = [self getAlertView];
    [alertView.cancleBtn setBackgroundColor:cancleBackgroundColor];
    [alertView.cancleBtn setTitleColor:cancleTitleColor forState:(UIControlStateNormal)];
    [alertView.sureBtn setBackgroundColor:sureBackgroundColor];
    [alertView.sureBtn setTitleColor:sureTitleColor forState:(UIControlStateNormal)];
}
+(void)setImageName:(NSString *)imageName {
    FYAlertView *alertView = [self getAlertView];
    alertView.imageView.hidden = NO;
    alertView.imageView.image = [UIImage imageNamed:imageName];
    [alertView resetUI];
}


+(void)showAlertViewWithTitle:(NSString *)title
                      message:(NSString *)message
                  cancleTitle:(NSString *)cancleTitle
             cancleTitleColor:(UIColor *)cancleTitleColor
        cancleBackGroundColor:(UIColor *)cancleBackGroundColor
                 cancleAction:(cancleBlock)cancleAction
                    sureTitle:(NSString *)sureTitle
               sureTitleColor:(UIColor *)sureTitleColor
          sureBackGroundColor:(UIColor *)sureBackGroundColor
                   sureAction:(sureBlock)sureAction {
    
    FYAlertView *alertView = [[FYAlertView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [alertView setTitle:title message:message cancleTitle:cancleTitle sureTitle:sureTitle enterAnimitionType:enterAnimitionTypeScale];
    alertView.sureBlock = sureAction ;
    alertView.cancleBlock = cancleAction;
    if (cancleTitleColor) {
        [alertView.cancleBtn setTitleColor:cancleTitleColor forState:(UIControlStateNormal)];
    }
    if (cancleBackGroundColor) {
        [alertView.cancleBtn setBackgroundColor:cancleBackGroundColor];
    }
    if (sureBackGroundColor) {
        [alertView.sureBtn setBackgroundColor:sureBackGroundColor];
    }
    if (sureTitleColor) {
        [alertView.sureBtn setTitleColor:sureTitleColor forState:(UIControlStateNormal)];
    }
    
    [[UIApplication sharedApplication].keyWindow addSubview:alertView];
   
}


+(void)showAlertViewWithTitle:(NSString *)title
                      message:(NSString *)message
                  cancleTitle:(NSString *)cancleTitle
                 cancleAction:(cancleBlock)cancleAction
                    sureTitle:(NSString *)sureTitle
                   sureAction:(sureBlock)sureAction {
    [self showAlertViewWithTitle:title message:message cancleTitle:cancleTitle cancleTitleColor:nil cancleBackGroundColor:nil cancleAction:cancleAction sureTitle:sureTitle sureTitleColor:nil sureBackGroundColor:nil sureAction:sureAction];
}

+(void)dismiss {
    [[self getAlertView] removeFromSuperview];
}



@end
