//
//  BlockTableViewController.m
//  BlockDemo
//
//  Created by Harious on 2018/1/26.
//  Copyright © 2018年 zzh. All rights reserved.
//

#import "BlockTableViewController.h"
#import "BlockBaseViewController.h"
#import "BlockVlaueCaptureViewController.h"

@interface BlockTableViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, copy)   NSArray *titles;
@property (nonatomic, copy)   NSDictionary *classDict;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation BlockTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _titles = @[@"block一些基本用法", @"block值捕获问题"];
    
    _classDict = @{@"block一些基本用法" : [BlockBaseViewController class],
                   @"block值捕获问题": [BlockVlaueCaptureViewController class]
                   };
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.view addSubview:self.tableView];
    
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    cell.textLabel.text = _titles[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    NSString *title = _titles[indexPath.row];
    Class class = _classDict[title];
    UIViewController *vc = [[class alloc] init];
    vc.navigationItem.title = title;
    [self.navigationController pushViewController:vc animated:true];
}


@end
