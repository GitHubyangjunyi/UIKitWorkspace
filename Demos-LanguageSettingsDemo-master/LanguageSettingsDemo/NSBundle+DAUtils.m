//
//  NSBundle+DAUtils.m
//  LanguageSettingsDemo
//
//  Created by DarkAngel on 2017/5/4.
//  Copyright © 2017年 暗の天使. All rights reserved.
//

#import "NSBundle+DAUtils.h"
#import "DAConfig.h"
#import <objc/runtime.h>

@interface DABundle : NSBundle

@end

@implementation NSBundle (DAUtils)

//当前是不是中文
+ (BOOL)isChineseLanguage
{
    NSString *currentLanguage = [self currentLanguage];
    if ([currentLanguage hasPrefix:@"zh-Hans"]) {
        return YES;
    } else {
        return NO;
    }
}

//当前语言
+ (NSString *)currentLanguage
{
    return [DAConfig userLanguage] ? : [NSLocale preferredLanguages].firstObject;
}

//动态继承、交换，方法类似KVO,通过修改[NSBundle mainBundle]对象的isa指针使其指向它的子类DABundle这样便可以调用子类的方法
//其实这里也可以使用method_swizzling来交换mainBundle的实现，来动态判断可以同样实现
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        object_setClass([NSBundle mainBundle], [DABundle class]);
    });
}

@end

@implementation DABundle

- (NSString *)localizedStringForKey:(NSString *)key value:(NSString *)value table:(NSString *)tableName
{
    if ([DABundle uw_mainBundle]) {
        return [[DABundle uw_mainBundle] localizedStringForKey:key value:value table:tableName];
    } else {
        return [super localizedStringForKey:key value:value table:tableName];
    }
}

+ (NSBundle *)uw_mainBundle
{
    //返回存放指定语言表的Bundle
    if ([NSBundle currentLanguage].length) {
        NSString *path = [[NSBundle mainBundle] pathForResource:[NSBundle currentLanguage] ofType:@"lproj"];
        if (path.length) {
            return [NSBundle bundleWithPath:path];
        }
    }
    return nil;
}

@end
