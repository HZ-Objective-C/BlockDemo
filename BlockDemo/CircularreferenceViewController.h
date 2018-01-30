//
//  CircularreferenceViewController.h
//  BlockDemo
//
//  Created by Harious on 2018/1/29.
//  Copyright © 2018年 zzh. All rights reserved.
//

#import "BaseViewController.h"

@interface CircularreferenceViewController : BaseViewController

@end


@interface CircularreferenceView: UIView

@property (nonatomic, copy)   void (^block)(void);

@end
