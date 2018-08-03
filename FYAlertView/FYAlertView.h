//
//  FYAlertView.h
//  FYAlertView
//
//  Created by wang on 2018/8/2.
//  Copyright © 2018年 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,enterAnimitionType) {
    enterAnimitionTypeScale //缩放
};

typedef void(^cancleBlock)(UIButton *sender);
typedef void(^sureBlock)(UIButton *sender);


@interface FYAlertView : UIView
@property(nonatomic,copy) cancleBlock cancleBlock;
@property(nonatomic,copy) sureBlock sureBlock;
@property(nonatomic,assign) enterAnimitionType enterAnimitionType;

-(void)setTitle:(NSString *)title message:(NSString *)message cancleTitle:(NSString *)cancleTitle sureTitle:(NSString *)sureTitle enterAnimitionType:(enterAnimitionType)enterAnimitionType;

-(void)setCustomTitle:(NSString *)title message:(NSString *)message imageNmae:(NSString *)imageName;

+(void)showAlertViewWithTitle:(NSString *)title
                      message:(NSString *)message
                  cancleTitle:(NSString *)cancleTitle
             cancleTitleColor:(UIColor *)cancleTitleColor
        cancleBackGroundColor:(UIColor *)cancleBackGroundColor
                 cancleAction:(cancleBlock)cancleAction
                    sureTitle:(NSString *)sureTitle
               sureTitleColor:(UIColor *)sureTitleColor
          sureBackGroundColor:(UIColor *)sureBackGroundColor
                   sureAction:(sureBlock)sureAction;

+(void)showAlertViewWithTitle:(NSString *)title
                      message:(NSString *)message
                  cancleTitle:(NSString *)cancleTitle
                 cancleAction:(cancleBlock)cancleAction
                    sureTitle:(NSString *)sureTitle
                   sureAction:(sureBlock)sureAction;

+(void)showCustomAlertViewWith:(NSString *)title message:(NSString *)message imageName:(NSString *)imageName;

@end
