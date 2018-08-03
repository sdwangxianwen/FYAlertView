//
//  ViewController.m
//  FYAlertView
//
//  Created by wang on 2018/8/2.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "ViewController.h"
#import "FYAlertView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [FYAlertView showCustomAlertViewWith:@"温馨提示" message:@"您确定要退出么?" imageName:@"share" cancleAction:^(UIButton *sender) {
//
//    } sureAction:^(UIButton *sender) {
//
//    }];
//    [FYAlertView setCancleBackgroundColor];

    [FYAlertView showAlertViewWithTitle:@"温馨提示" message:@"您确定要退出么?您确定要退出么?您确定要退出么?您确定要退出么?您确定要退出么?您确定要退出么?您确定要退出么?您确定要退出么?您确定要退出么?您确定要退出么?您确定要退出么?您确定要退出么?您确定要退出么?您确定要退出么?您确定要退出么?您确定要退出么?您确定要退出么?您确定要退出么?您确定要退出么?您确定要退出么?您确定要退出么?您确定要退出么?您确定要退出么?您确定要退出么?您确定要退出么?您确定要退出么?您确定要退出么?" cancleTitle:@"取消" cancleAction:^(UIButton *sender) {

    } sureTitle:@"确定" sureAction:^(UIButton *sender) {

    }];
//    [FYAlertView showAlertViewWithTitle:@"提示" message:@"确定要删除么" cancleTitle:@"取消" cancleTitleColor:[UIColor whiteColor] cancleBackGroundColor:[UIColor blueColor] cancleAction:^(UIButton *sender) {
//
//    } sureTitle:@"确定" sureTitleColor:[UIColor whiteColor] sureBackGroundColor:[UIColor redColor] sureAction:^(UIButton *sender) {
//
//    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
