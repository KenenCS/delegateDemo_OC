//
//  ViewController.m
//  delegateDemo_OC
//
//  Created by KenenCS on 2017/8/2.
//  Copyright © 2017年 KenenCS. All rights reserved.
//

#import "ViewController.h"
#import "TestViewController.h"
//遵循创建的这个代理TestDelegate
@interface ViewController () <TestDelegate> {
    UIButton *btn;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
        
    self.title = @"第一界面";
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(80, 100, 90, 30)];
    label.text = @"选择地点:";
    label.font = [UIFont systemFontOfSize:20];
    [self.view addSubview:label];
    
    btn = [[UIButton alloc] initWithFrame:CGRectMake(170, 106, 100, 20)];
    [btn setTitle:@"请选择" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor greenColor];
    btn.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:btn];
    
}

- (void)btnClick {
    TestViewController *testVC = [[TestViewController alloc] init];
    //设置的代理
    testVC.delegate = self;
    [self.navigationController pushViewController:testVC animated:NO];
}

//在这里实现代理方法，接收代理过来的值
- (void)changeTheLocation:(NSString *)str {
    //通过代理过来的值来改变按钮的text，即改变地点
    [btn setTitle:str forState:(UIControlStateNormal)];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
