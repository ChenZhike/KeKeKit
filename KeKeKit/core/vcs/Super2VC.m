    //
    //  Super2VC.m
    //  KeKeKit
    //
    //  Created by KeKe on 3018/9/19.
    //  Copyright © 2021年 KeKe. All rights reserved.
    //

#import "Super2VC.h"

@interface Super2VC ()

@end

@implementation Super2VC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.frame=RECT(0, NavHeight, WINDOWW, WINDOWH-NavHeight-kHomeBarHeight);
    self.tableView.tableHeaderView=[[UIView alloc]initWithFrame:RECT(0, 0, WINDOWW, 0.1)];
        // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
