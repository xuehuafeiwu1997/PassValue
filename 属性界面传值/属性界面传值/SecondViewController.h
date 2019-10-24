//
//  SecondViewController.h
//  属性界面传值
//
//  Created by 许明洋 on 2019/8/20.
//  Copyright © 2019 许明洋. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//委托方创建一个协议
@protocol passValueDelegate <NSObject>

//协议定义一个传值的方法
- (void)passValue:(NSString *)str;


@end

@interface SecondViewController : UIViewController
@property (nonatomic, strong) NSString *str;

//委托方持有协议,定义一个持有协议的id指针
@property (weak)id<passValueDelegate>delegate;

//定义一个block，进行页面反向传值
@property (copy) void (^block)(NSString *);

@end

NS_ASSUME_NONNULL_END
