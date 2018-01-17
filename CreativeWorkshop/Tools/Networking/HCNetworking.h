//
//  HCNetworking.h
//  DRMPlayer
//
//  Created by HeChuang on 2017/7/18.
//  Copyright © 2017年 All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class AFHTTPSessionManager;

typedef NS_ENUM(NSUInteger, HCNetworkStatusType) {
    // 未知网络
    HCNetworkStatusUnknown,
    // 无网络
    HCNetworkStatusNotReachable,
    // 手机网络
    HCNetworkStatusReachableViaWWAN,
    // WIFI网络
    HCNetworkStatusReachableViaWiFi
};

/**
 请求成功block

 @param responseObject 请求成功返回的值
 */
typedef void(^HCRequestSuccess)(id responseObject);

/**
 请求失败block

 @param error 请求失败返回的错误
 */
typedef void(^HCRequestFailed)(NSError *error);

/**
 请求是的进度block

 @param progress 请求中的进度
 */
typedef void (^HCRequestProgress)(NSProgress *progress);

/**
 网络状态的block

 @param status 返回的网络状态
 */
typedef void (^HCNetworkStatus)(HCNetworkStatusType status);

@interface HCNetworking : NSObject

/**
 *  设置请求超时时间:默认为30S
 *
 *  @param time 时长
 */
+ (void)setRequestTimeoutInterval:(NSTimeInterval)time;

/**
 实时获取网络状态,通过Block回调实时获取(此方法可多次调用)

 @param networkStatus 返回的网络状态
 */
+ (void)networkStatusWithBlock:(HCNetworkStatus)networkStatus;

/**
 判断是否有网络

 @return YES为是
 */
+ (BOOL)isNetwork;

/**
 判断是否为蜂窝数据

 @return YES为是
 */
+ (BOOL)isWWANNetwork;

/**
 判断是否为WiFi网络

 @return YES为是
 */
+ (BOOL)isWiFiNetwork;

/**
 *  GET请求
 *
 *  @param URL        请求地址
 *  @param parameters 请求参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 *
 *  @return 返回的对象可取消请求,调用cancel方法
 */
+ (__kindof NSURLSessionTask *)GET:(NSString *)URL
                        parameters:(id)parameters
                           success:(HCRequestSuccess)success
                           failure:(HCRequestFailed)failure;

/**
 *  POST请求
 *
 *  @param URL        请求地址
 *  @param parameters 请求参数
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 *
 *  @return 返回的对象可取消请求,调用cancel方法
 */
+ (__kindof NSURLSessionTask *)POST:(NSString *)URL
                         parameters:(id)parameters
                            success:(HCRequestSuccess)success
                            failure:(HCRequestFailed)failure;

/**
 *  上传文件
 *
 *  @param URL        请求地址
 *  @param parameters 请求参数
 *  @param name       文件对应服务器上的字段
 *  @param filePath   文件本地的沙盒路径
 *  @param progress   上传进度信息
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 *
 *  @return 返回的对象可取消请求,调用cancel方法
 */
+ (__kindof NSURLSessionTask *)uploadFileWithURL:(NSString *)URL
                                      parameters:(id)parameters
                                            name:(NSString *)name
                                        filePath:(NSString *)filePath
                                        progress:(HCRequestProgress)progress
                                         success:(HCRequestSuccess)success
                                         failure:(HCRequestFailed)failure;

/**
 *  上传单/多张图片
 *
 *  @param URL        请求地址
 *  @param parameters 请求参数
 *  @param name       图片对应服务器上的字段
 *  @param images     图片数组
 *  @param fileNames  图片文件名数组, 可以为nil, 数组内的文件名默认为当前日期时间"yyyyMMddHHmmss"
 *  @param imageScale 图片文件压缩比 范围 (0.f ~ 1.f)
 *  @param imageType  图片文件的类型,例:png、jpg(默认类型)....
 *  @param progress   上传进度信息
 *  @param success    请求成功的回调
 *  @param failure    请求失败的回调
 *
 *  @return 返回的对象可取消请求,调用cancel方法
 */
+ (__kindof NSURLSessionTask *)uploadImagesWithURL:(NSString *)URL
                                        parameters:(id)parameters
                                              name:(NSString *)name
                                            images:(NSArray<UIImage *> *)images
                                         fileNames:(NSArray<NSString *> *)fileNames
                                        imageScale:(CGFloat)imageScale
                                         imageType:(NSString *)imageType
                                          progress:(HCRequestProgress)progress
                                           success:(HCRequestSuccess)success
                                           failure:(HCRequestFailed)failure;

/**
 *  下载文件
 *
 *  @param URL      请求地址
 *  @param fileDir  文件存储目录(默认存储目录为Download)
 *  @param progress 文件下载的进度信息
 *  @param success  下载成功的回调(回调参数filePath:文件的路径)
 *  @param failure  下载失败的回调
 *
 *  @return 返回NSURLSessionDownloadTask实例，可用于暂停继续，暂停调用suspend方法，开始下载调用resume方法
 */
+ (__kindof NSURLSessionTask *)downloadWithURL:(NSString *)URL
                                       fileDir:(NSString *)fileDir
                                      progress:(HCRequestProgress)progress
                                       success:(void(^)(NSString *filePath))success
                                       failure:(HCRequestFailed)failure;

/**
 在开发中,如果以下的设置方式不满足项目的需求,就调用此方法获取AFHTTPSessionManager实例进行自定义设置
 (注意: 调用此方法时在要导入AFNetworking.h头文件,否则可能会报找不到AFHTTPSessionManager的错误)
 @param sessionManager AFHTTPSessionManager的实例
 */
+ (void)setAFHTTPSessionManagerProperty:(void(^)(AFHTTPSessionManager *sessionManager))sessionManager;

/**
 配置自建证书的Https请求

 @param cerPath 自建Https证书的路径
 @param validatesDomainName 是否需要验证域名，默认为YES. 如果证书的域名与请求的域名不一致，需设置为NO; 即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险, 建议打开.validatesDomainName=NO, 主要用于这种情况:客户端请求的是子域名, 而证书上的是另外一个域名。因为SSL证书上的域名是独立的,假如证书上注册的域名是www.google.com, 那么mail.google.com是无法验证通过的.
 */
+ (void)setSecurityPolicyWithCerPath:(NSString *)cerPath validatesDomainName:(BOOL)validatesDomainName;

@end
