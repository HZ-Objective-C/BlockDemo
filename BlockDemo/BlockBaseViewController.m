
/*

 1、block定义
 2、block作为属性(注意，本来是block名字，结果成了属性名称)
 3、block作为方法参数(本来是block名字，结果成了别名)
 4、block作为方法返回值
 
 block 是一段代码块，但是他能像类和变量一样使用
 block 的功能可以用可以用类来实现，block的实现可以用类的方法来实现，但是类的方法不能够值捕获(不能使用方法外部变量，只能使用通过传参或者使用类属性、变量)，block的实现地方有很大区别, block 可以在方法内实现，也可以在方法外实现
 
 
*/


#import "BlockBaseViewController.h"

/// 给block起一个别名, 本来是block名字，结果成了别名
typedef  NSString * (^TypedefBlock)(NSString *name, int age);

/// 在类外部顶一个block
void (^block222)(NSString *name) = ^(NSString *name) {
    
};

@interface BlockBaseViewController ()

/// block 作为属性（注意，本来是block名字，结果成了属性名称）
@property (nonatomic, copy)  NSString *(^blockProperty)(void);

@end

@implementation BlockBaseViewController

/// 在类内部，方法外部顶一个block
void (^blocklll)(NSString *name) = ^(NSString *name) {
    
};

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ////  定义block测试
    [self definitionBlock];
    
    
    NSLog(@"\n\n");
    
    ////  block作为方法参数
    [self blockParameter:^NSString *(NSString *name, int age) {
        NSLog(@"block作为方法参数,在block实现中 %@  %d", name, age);
        return [NSString stringWithFormat:@"%@ %d", name, age];
    } block2:^NSString *(NSString *name) {
        NSLog(@"block作为方法参数,在block实现中 %@", name);
        return name;
    }];
    
    
    NSLog(@"\n\n");
    
    /// block 作为方法返回值
    NSLog(@"调用有block返回值的方法");
    NSLog(@"%@", [self blockReturnType:@"小海"](@"大海"));
    
//    分解上面这个方法
//    NSString *(^blockR)(NSString *) = [self blockReturnType:@"小海"];  // 调用方法返回的是block
//    NSString *str = blockR(@"大海"); // 再调用这个block，并且会返回一个字符串
//    NSLog(@"%@", str);
    
}

/// 在方法内部定义一个block
- (void)definitionBlock {
    
    /// 定义一个block包括，返回值类型、block名字、参数
    NSString *(^personBlock)(NSString *name, int age);
    
    personBlock = ^(NSString *name, int age) {
        NSLog(@"%@    %d", name, age);
        
        return [NSString stringWithFormat:@"%@--%d", name, age];
    };

    NSLog(@"%@", personBlock(@"xiaohai", 26));
}

/// block作为方法参数
- (void)blockParameter:(TypedefBlock)block1 block2:(NSString *(^)(NSString *name))block2 {
    
    NSString *blockResult1 = block1(@"xiaohai", 26);
    
    NSLog(@"block作为方法参数,block返回结果 %@", blockResult1);
    
    NSString *blockResult2 = block2(@"dahai");
    
    NSLog(@"block作为方法参数,block返回结果 %@", blockResult2);
    
}

/// block 作为方法返回值
- (NSString *(^)(NSString *name))blockReturnType:(NSString *)name {
    
    NSLog(@"进入了block 作为方法返回值的方法里面");
    
    return ^(NSString *name) {
        NSLog(@"调用了方法返回值这个block");
        return name;
    };
    
}



@end
