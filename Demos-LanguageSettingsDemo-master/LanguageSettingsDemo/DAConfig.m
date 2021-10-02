//
//  DAConfig.m
//  LanguageSettingsDemo
//
//  Created by DarkAngel on 2017/5/4.
//  Copyright © 2017年 暗の天使. All rights reserved.
//

#import "DAConfig.h"

static NSString *const UWUserLanguageKey = @"UWUserLanguageKey";
#define STANDARD_USER_DEFAULT  [NSUserDefaults standardUserDefaults]

@implementation DAConfig

+ (void)setUserLanguage:(NSString *)userLanguage
{
    //跟随手机系统
    if (!userLanguage.length) {
        [self resetSystemLanguage];
        return;
    }
    //用户自定义
    [STANDARD_USER_DEFAULT setValue:userLanguage forKey:UWUserLanguageKey];
    [STANDARD_USER_DEFAULT setValue:@[userLanguage] forKey:@"AppleLanguages"];
    
    [STANDARD_USER_DEFAULT synchronize];
}

+ (NSString *)userLanguage
{
    return [STANDARD_USER_DEFAULT valueForKey:UWUserLanguageKey];
}

/**
 重置系统语言
 */
+ (void)resetSystemLanguage
{
    //移除用户自定义的语言
    [STANDARD_USER_DEFAULT removeObjectForKey:UWUserLanguageKey];
    //设置为nil后AppleLanguages所表示的那个数组将还原成默认值
    [STANDARD_USER_DEFAULT setValue:nil forKey:@"AppleLanguages"];
    NSLog(@"%@", [[NSUserDefaults standardUserDefaults]valueForKey:@"AppleLanguages"]);
    [STANDARD_USER_DEFAULT synchronize];
    NSLog(@"%@", [[NSUserDefaults standardUserDefaults]valueForKey:@"AppleLanguages"]);
    [STANDARD_USER_DEFAULT synchronize];
    NSLog(@"%@", [[NSUserDefaults standardUserDefaults]valueForKey:@"AppleLanguages"]);
    //设置成nil后恢复成下面
//    2020-11-04 16:12:03.982535+0800 LanguageSettingsDemo[11398:563593] (
//        "zh-Hans-US",
//        en
//    )
//    2020-11-04 16:12:15.061809+0800 LanguageSettingsDemo[11398:563593] (
//        "zh-Hans-US",
//        en
//    )
//    2020-11-04 16:12:22.487476+0800 LanguageSettingsDemo[11398:563593] (
//        "zh-Hans-US",
//        en
//    )
}

@end
