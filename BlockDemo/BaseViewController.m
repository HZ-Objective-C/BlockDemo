//
//  BaseViewController.m
//  BlockDemo
//
//  Created by Harious on 2018/1/26.
//  Copyright © 2018年 zzh. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)dealloc
{
    NSLog(@" 😝😝😝😝  %@  dealloc", NSStringFromClass([self class]));
}

@end
