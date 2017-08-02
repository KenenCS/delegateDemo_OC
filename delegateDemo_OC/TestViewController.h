//
//  TestViewController.h
//  delegateDemo_OC
//
//  Created by KenenCS on 2017/8/2.
//  Copyright © 2017年 KenenCS. All rights reserved.
//

#import <UIKit/UIKit.h>

//声明代理
@protocol TestDelegate <NSObject>
//改变地点的方法
- (void)changeTheLocation:(NSString *)str;

@end

@interface TestViewController : UIViewController
//让创建的代理变为一个属性，记着用弱引用
@property (nonatomic,weak)id<TestDelegate> delegate;

@end
