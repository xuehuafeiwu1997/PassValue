//
//  DefaultInstance.m
//  属性界面传值
//
//  Created by 许明洋 on 2019/8/23.
//  Copyright © 2019 许明洋. All rights reserved.
//

#import "DefaultInstance.h"

@implementation DefaultInstance

//通过类方法创建单例对象
+(instancetype)shareInstance {
    static DefaultInstance *sharedVC = nil;
    if (sharedVC == nil) {
        sharedVC = [[DefaultInstance alloc]init];
    }
    return sharedVC;
}

@end
