//
//  Router.m
//  Router
//
//  Created by 杨俊艺 on 2020/11/16.
//

#import "Router.h"

@implementation Router

+ (instancetype)sharedInstance
{
    static Router *router;
    dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        router = [[Router alloc]init];
    });
    return router;
}

//UIViewController *vc = [[Router sharedInstance] openURL:@"http://Index/home:"];

- (id)openURL:(NSString *)urlStr
{
    NSURL *url = [NSURL URLWithString:urlStr];
    NSMutableDictionary *params = [[NSMutableDictionary alloc]init];
    //取出传入的URL的请求参数部分
    NSString *urlQueryString = [url query];
    
    for (NSString *param in [urlQueryString componentsSeparatedByString:@"&"]) {
        NSArray *elts = [param componentsSeparatedByString:@"="];
        if (elts.count<2)
            continue;
        id firstEle = [elts firstObject];
        id lastEle = [elts lastObject];
        
        if (firstEle && lastEle) {
            [params setObject:lastEle forKey:firstEle];
        }
    }
    
    NSString *actionName = [url.path stringByReplacingOccurrencesOfString:@"/" withString:@""];
    if ([actionName hasPrefix:@"native"]) {
        return @(NO);
    }
    
    id result = [self performTarget:url.host action:actionName param:params];
    return result;
}

//通过id和action来唯一确认一个类里的方法
-(id)performTarget:(NSString *)targetName action:(NSString *)actionName param:(NSDictionary *)params {
    //这个目标的类名字符串
    NSString * targetClassString = [NSString stringWithFormat:@"OCTarget_%@",targetName];
    NSString *actionMethodString = [NSString stringWithFormat:@"action_%@",actionName];
    Class targetClass = NSClassFromString(targetClassString);
    NSObject *target = [[targetClass alloc] init];
    
    SEL action = NSSelectorFromString(actionMethodString);
    //判断
    if ([target respondsToSelector:action]) {
        return [self safePerformAction:action target:target param:params];
    }else {
        SEL action = NSSelectorFromString(@"notFound:");
        if ([target respondsToSelector:action]) {
            return [self safePerformAction:action target:target param:params];
        } else {
            return nil;
        }
    }
}

//1.通过对象调用指定的方法
//2.传参
- (id)safePerformAction:(SEL)action target:(NSObject*)target param:(NSDictionary*)params {
    NSMethodSignature *methodSig = [target methodSignatureForSelector:action];
    if (methodSig == nil) {
        return nil;
    }
    //获取这个方法返回值的地址
    const char *retType = [methodSig methodReturnType];
    
    //id是可以返回任意对象，所以我们单独处理基本变量NSInteger Bool Void
    if (strcmp(retType, @encode(NSInteger)) == 0) {
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
    
    //为什么传2？前面0个1这两个位置已经被target和action给占了
    [invocation setArgument:&params atIndex:2];
    [invocation setTarget:target];
    [invocation setSelector:action];
    [invocation invoke];
            
    NSInteger result = 0;
    [invocation getReturnValue:&result];
    return @(result);
    }
        
    if (strcmp(retType, @encode(BOOL)) == 0) {
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSig];
        //为什么传2？前面0个1这两个位置已经被target和action给占了
        [invocation setArgument:&params atIndex:2];
        [invocation setTarget:target];
        [invocation setSelector:action];
        [invocation invoke];
            
        NSInteger result = 0;
        [invocation getReturnValue:&result];
        return @(result);
    }
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    return [target performSelector:action withObject:target withObject:params];
#pragma clang diagnostic pop
       
}

@end


