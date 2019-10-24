//
//  ViewController.m
//  属性界面传值
//
//  Created by 许明洋 on 2019/8/20.
//  Copyright © 2019 许明洋. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "DefaultInstance.h"

@interface ViewController ()<passValueDelegate>//表示页面一遵守协议，并且要在下面实现协议方法

@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UILabel *label;

@end

@implementation ViewController

- (UILabel *)label {
    if (_label == nil) {
        _label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 200, 40)];
        _label.backgroundColor = [UIColor blackColor];
        _label.textColor = [UIColor whiteColor];
        _label.font = [UIFont systemFontOfSize:20];
        
        
    }
   
    return _label;
}

//在页面一将要显示的时候
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //单例传值--反向传值接收
    //self.label.text = [DefaultInstance shareInstance].str;
    
    //NSUserDefaults传值--反向传值接收
    //self.label.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"NSUserDefaults-re"];
}

//代理传值--实现协议方法--接收来自页面二的值
- (void)passValue:(NSString *)str {
    //self.label.text = str;
}

- (UIButton *)btn {
    if (_btn == nil) {
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 200, 40)];
        [_btn setTitle:@"跳转至页面2" forState:UIControlStateNormal];
        _btn.backgroundColor = [UIColor redColor];
        [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}

- (void)btnClick {
    SecondViewController *vc2 = [[SecondViewController alloc] init];
    
    //属性传值--传递
    //vc2.str = @"属性传值";
    
    //单例传值
    //[DefaultInstance shareInstance].str = @"单例传值";
    
    //NSUserDefaults传值--正向传值
    //[[NSUserDefaults standardUserDefaults] setObject:@"NSUserDefaults传值" forKey:@"NSUserDefaults"];
    //写入之后还需要同步一下
    //[NSUserDefaults standardUserDefaults];
    
    //代理传值------设置代理关系  将第二个界面的代理设置为第一个界面
     
     //vc2.delegate =self;
    
    //block传值 ---实现block-接收来自页面二的值
   // vc2.block = ^(NSString *str){
    //    self.label.text = str;
   // };
    
    //通知传值--添加监听---等待页面二的传值  给通知中心添加观察者 self代表界面1，即接收方  方法带一个参数，参数即为我们的通知
    //object表示接收来自哪里的通知，填nil表示为监听广播，只要通知名称为notify，就监听
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(notHandle:) name:@"notify" object:nil];
    
    //[self.navigationController pushViewController:vc2 animated:YES];
    [self presentViewController:vc2 animated:YES completion:nil];
}

//接收到通知后的处理
- (void)notHandle:(NSNotification *)not {
    self.label.text = not.userInfo[@"not"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.label];
    [self.view addSubview:self.btn];
    
    NSLog(@"------%@---------",self.navigationController.viewControllers[0]);
    NSLog(@"在控制器一中self.presented中的值为%@",self.presentedViewController);
    NSLog(@"控制器一中self=%@",self);
    
}


@end
