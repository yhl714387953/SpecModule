//
//  ViewController.m
//  SpecModule
//
//  Created by 嘴爷 on 2018/3/29.
//  Copyright © 2018年 嘴爷. All rights reserved.
//

#import "ViewController.h"
#import <ZYTableViewController.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)clicked:(UIButton *)sender {
    ZYTableViewController* vc = [[ZYTableViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
