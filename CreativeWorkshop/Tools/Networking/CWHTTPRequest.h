//
//  CWHTTPRequest.h
//  CreativeWorkshop
//
//  Created by HeChuang⌚️ on 2018/1/17.
//  Copyright © 2018年 HeChuang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HCNetworking.h"

typedef void(^CWRequestSuccess)(id response);

typedef void(^CWRequestFailure)(NSError * error);

@interface CWHTTPRequest : NSObject

+ (NSURLSessionTask *)getLiveListWithSuccess:(CWRequestSuccess)success
                                     Failure:(CWRequestFailure)failure;

@end
