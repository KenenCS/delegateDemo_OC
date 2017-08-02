//
//  TestViewController.m
//  delegateDemo_OC
//
//  Created by KenenCS on 2017/8/2.
//  Copyright © 2017年 KenenCS. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"二级界面";
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
}

#pragma mark ----tableViewDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}
 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = @"点我";
    return cell;
}

//cell的点击事件
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //这个代表 我们需要代理出去的数据源，当然，你可以通过indexPath.row代理出去不同row的值，我这里只是例子只做了一个
    NSString *str = @"这是新地点";
    
    //当执行这个代理并且是执行这个代理方法的时候
    if (self.delegate && [self.delegate respondsToSelector:@selector(changeTheLocation:)]) {
        //通过这个代理方法把需要的值代理过去
        [self.delegate changeTheLocation:str];
    }
    
    //返回上一级界面
    [self.navigationController popViewControllerAnimated:YES];
    //取消选中
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
