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
    [FYAlertView showAlertViewWithTitle:@"温馨提示" message:@"您确定要退出么?" cancleTitle:@"取消" cancleAction:^(UIButton *sender) {
       
    } sureTitle:@"确定" sureAction:^(UIButton *sender) {

    }];
//    [FYAlertView setCancleBackgroundColor:[UIColor blueColor] cancleTitleColor:[UIColor whiteColor] sureBackgroundColor:[UIColor redColor] sureTitleColor:[UIColor whiteColor]];
    [FYAlertView setImageName:@"share"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
