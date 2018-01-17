//
//  CWHTTPRequest.m
//  CreativeWorkshop
//
//  Created by HeChuang⌚️ on 2018/1/17.
//  Copyright © 2018年 HeChuang. All rights reserved.
//

#import "CWHTTPRequest.h"
#import "CWInterfacedConst.h"

@implementation CWHTTPRequest

+ (NSURLSessionTask *)getLiveListWithSuccess:(CWRequestSuccess)success
                                     Failure:(CWRequestFailure)failure{
    NSString * url = [NSString stringWithFormat:@"%@%@", kApiPrefix, kLiveList];
    return [self requestWithURL:url parameters:nil success:success failure:failure];
}

#pragma mark - Public Post
+ (NSURLSessionTask *)requestWithURL:(NSString *)URL
                          parameters:(NSDictionary *)parameter
                             success:(CWRequestSuccess)success
                             failure:(CWRequestFailure)failure{
    return [HCNetworking POST:URL parameters:parameter success:^(id responseObject) {
        success(responseObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}
@end
