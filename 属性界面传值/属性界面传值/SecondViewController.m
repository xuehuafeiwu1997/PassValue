//
//  SecondViewController.m
//  属性界面传值
//
//  Created by 许明洋 on 2019/8/20.
//  Copyright © 2019 许明洋. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"
#import "DefaultInstance.h"

@interface SecondViewController ()

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) UIButton *btn;

@end

@implementation SecondViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.textField];
    [self.view addSubview:self.btn];
    NSLog(@"------%@---------",self.navigationController);
}

- (UITextField *)textField {
    if (_textField == nil) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 100, 200, 40)];
        _textField.textColor = [UIColor blackColor];
        //_textField.backgroundColor = [UIColor blackColor];
        _textField.borderStyle = UITextBorderStyleLine;
        
        //属性传值---接收并显示
       // _textField.text = self.str;
        
        //单例传值，接收并显示
        //_textField.text = [DefaultInstance shareInstance].str;
        
        //NSUserDefaults传值，从文件中读取数据并显示
       // _textField.text = [[NSUserDefaults standardUserDefaults]objectForKey:@"NSUserDefaults"];
    }
    return _textField;
}

- (UIButton *)btn{
    if (_btn == nil) {
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 200, 40)];
        _btn.backgroundColor = [UIColor redColor];
        [_btn setTitle:@"跳转回页面一" forState:UIControlStateNormal];
        [_btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _btn.titleLabel.font = [UIFont systemFontOfSize:20];
        [_btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        NSLog(@"在控制器二self.presented的值为%@",self.presentedViewController);
        NSLog(@"在控制器二中self=%@",self);
        
        
    }
    return _btn;
}

- (void)btnClick {
    //单例传值---反向传递
    //[DefaultInstance shareInstance].str = self.textField.text;
    
    //NSUserDefaults传值---反向传值
    //[[NSUserDefaults standardUserDefaults]setObject:self.textField.text forKey:@"NSUserDefaults-re"];
   // [[NSUserDefaults standardUserDefaults]synchronize];
    
    //代理传值---反向传值
    //[self.delegate passValue:self.textField.text];
    
    //block传值--反向传值 可以将其理解为一个C语言的函数，括号里面传递的是C语言的实参
    //self.block(self.textField.text);
    
    //通知传值---发送通知
    [[NSNotificationCenter defaultCenter] postNotificationName:@"notify" object:nil userInfo:@{@"not":self.textField.text}];
    
    //[self.navigationController pushViewController:vc animated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
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
