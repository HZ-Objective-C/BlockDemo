//
//  AppDelegate.m
//  BlockDemo
//
//  Created by Harious on 2018/1/26.
//  Copyright © 2018年 zzh. All rights reserved.
//

#import "AppDelegate.h"
#import "BlockTableViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:[[BlockTableViewController alloc] init]];
    
    [self.window makeKeyAndVisible];
    
    return YES;
}



@end
