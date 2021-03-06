//
//  Router.h
//  Router
//
//  Created by 杨俊艺 on 2020/11/16.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Router : NSObject

+(instancetype)sharedInstance;

-(id)openURL:(NSString *)urlStr;

-(id)performTarget:(NSString *)targetName action:(NSString *)actionName param:(NSDictionary *)param;

@end

NS_ASSUME_NONNULL_END
