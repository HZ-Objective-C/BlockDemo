


#import "CircularreferenceViewController.h"

@interface CircularreferenceViewController ()

@property (nonatomic, strong)   NSString *str;

@property (nonatomic, weak)     NSString *weakStr;

@property (nonatomic, copy)     void (^block)(void);

@property (nonatomic, strong)   CircularreferenceView *circularreferenceView;

@end

@implementation CircularreferenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self circularreference];
    
    [self circularreference1];
}

/// block跟对象循环引用
- (void)circularreference {
    
    __weak typeof(self) weakSelf = self;
    _block = ^() {
//        不管是以变量形式还是用self去调用都会造成循环引用
//        _str = @"99999";
//        self.str = @"88888";

        // 将self弱引用可解除循环引用
        weakSelf.str = @"sdf";
    };
    
    
//    void (^block1)(void) = ^() {
//        //        不管是以变量形式还是用self去调用都会造成循环引用
//        //        _str = @"99999";
//        self.str = @"88888";
//
//        // 将self弱引用可解除循环引用
//        //        weakSelf.str = @"sdf";
//    };
//
//    _block = block1;
//
//    _block();
//
//    NSLog(@"%@", self.str);
}


- (void)circularreference1 {
    
    /// 下面这种情况会导致循环引用，这种情况下xcode编译检测不出来，特别需要注意
    /// 同样需要注意的是，在block以变量的形式（如_str）访问，会造成循环引用,xcode编译检测不出来
    
    _circularreferenceView = [[CircularreferenceView alloc] init];
    
    CircularreferenceView *circularreferenceView = _circularreferenceView;
    
    circularreferenceView.block = ^{
        self.str = @"123";
        
    };
}

@end



@implementation CircularreferenceView



@end







