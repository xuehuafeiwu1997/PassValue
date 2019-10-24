//
//  DefaultInstance.h
//  属性界面传值
//
//  Created by 许明洋 on 2019/8/23.
//  Copyright © 2019 许明洋. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DefaultInstance : NSObject

//单例传值，首先需要有一个类方法
+ (instancetype)shareInstance;

//传递字符串的话，需要有一个字符串的属性
@property (nonatomic, strong)NSString *str;
@end

NS_ASSUME_NONNULL_END
