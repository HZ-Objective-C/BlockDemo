

/*
 
一、值捕获
 
    1.对于局部变量的值捕获
    block外部没有加__block的基本类型，block内变量的值取决于block实现的时候，而不是block调用的时候
    block外部加了__block的基本类型，block内变量的值取决于block调用的时间
 
    block外部没有加__block的对象，block内对象取决于block实现的时候，而不是block调用的时候（类似基本类型）；但是对象属性的值不受这个限制，取决于调用block的时间
    block外部加了__block的对象，block内对象及其属性都取决于block调用时间
    对于NSMutableDictionary、NSMutableArray、NSMutableString等可变类型,不加__block的情况，对其的可变操作类似对象的属性操作,取决于取决于block调用时间
 
    2.对属性及实例变量的捕获
    取决于block调用时间
 
    3.对全局变量的捕获
    取决于block调用时间
 
 
 二、block内部修改block的变量
 
    block内部不允许修改block外部没有被__block修饰的局部变量，对于可变类型（如NSMutableString等）做出的可变操作是允许而且有效的
    全局变量和实例变量及属性不受影响
 */

#import "BlockVlaueCaptureViewController.h"
#import "ValueCapture.h"


NSString *globleString = @"000";

@interface BlockVlaueCaptureViewController ()
{
    NSString *_name;
}
@property (nonatomic, strong) NSString *str;
@property (nonatomic, assign) NSUInteger number;
@end

@implementation BlockVlaueCaptureViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    [self capturelocalVariable];
    
//    [self capturelocalVariable1];
    
//    [self captureProperty];
    
//    [self captureGloble];
    
    [self blockInsideModifyVar];
}

/// block 获取局部变量
- (void)capturelocalVariable {
    
    NSInteger number = 5;
    __block NSInteger blockNumber = 5;
    ValueCapture *capture1 = [[ValueCapture alloc] init];
    __block ValueCapture *blockCapture = [[ValueCapture alloc] init];
    
    
    void (^block)(void) = ^() {
        NSLog(@" number = %zd,   number1 = %zd", number, blockNumber);
        NSLog(@"%p  %p", &number, &blockNumber);
        
        NSLog(@"%@   %zd", capture1.name, capture1.number);
        NSLog(@"%p ", capture1.name);
        
        NSLog(@"%@   %zd", blockCapture.name, blockCapture.number);
        NSLog(@"%p  😝 😝 😝", blockCapture.name);
    };
    
    number = 99;
    blockNumber = 99;
    capture1.name = @"小海";
    capture1.number = 25;
    blockCapture.name = @"小敏";
    blockCapture.number = 22;
    block();
    
    number = 999;
    blockNumber = 999;
    capture1.name = @"大海";
    capture1.number = 99;
    blockCapture.name = @"大敏";
    blockCapture.number = 94;
    block();
    
    capture1 = [[ValueCapture alloc] init];
    blockCapture = [[ValueCapture alloc] init];
    block();
    
}

/// block 获取局部变量1
- (void)capturelocalVariable1 {
    
    
    
    
    NSString *str = @"123";
    __block NSString *blockStr = @"123";
    NSMutableString *muStr = [NSMutableString stringWithString:@"000"];
    __block NSMutableString *blockMuStr = [NSMutableString stringWithString:@"000"];
    
    void (^block)(void) = ^() {
        NSLog(@"%@   %@  %@   %@", str, blockStr, muStr, blockMuStr);
    };
    

    block();
    
    str = @"qqq";
    blockStr = @"qqq";
    
    [muStr appendString:@"ppp"];
    [blockMuStr appendString:@"ppp"];

    block();

}

- (void)captureProperty {
    
    void (^block)(void) = ^() {
        NSLog(@"%@  %@   %zd", _str, _name, _number);
    };
    
    block();
    
    _str = @"hahah";
    _number = 44;
    _name = @"小海";
    
    block();
}

- (void)captureGloble {
    
    void (^block)(void) = ^() {
        NSLog(@"%@", globleString);
    };
    
    block();
    
    globleString = @"hahah";
    
    block();
}

/// block内部修改变量
- (void)blockInsideModifyVar {
    
    NSMutableArray *arr = [NSMutableArray arrayWithArray:@[@"1"]];
    NSInteger index = 5;
    __block NSInteger blockIndex = 5;
    
    void (^block)(void) = ^() {
//        index = 10;
        [arr addObject:@"2"];
        blockIndex = 10;
        _number = 999;
        globleString = @"888888";
    };
    
    NSLog(@"%zd    %zd    %zd   %@", index, blockIndex, _number, arr);
    
    block();
    
    NSLog(@"%zd    %zd    %zd   %@", index, blockIndex, _number, arr);
    
    NSLog(@"%@", globleString);
    
}

@end





















