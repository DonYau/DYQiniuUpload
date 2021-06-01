//
//  DYQiniuUploadTool.h
//  DYQiniuUpload
//
//  Created by donyau on 2019/1/10.
//  Copyright © 2019 donyau. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, DYQNZoneMode) {
    DYQNZone0 = 0,//华东
    DYQNZone1,//华北
    DYQNZone2,//华南
    DYQNZone3,//北美
};

typedef void(^QiniuUploadCallback)(BOOL success, NSDictionary *resp);

@interface DYQiniuUpload : NSObject

+ (void)updateQiNiuWithAccessKey:(NSString *)accessKey secretKey:(NSString *)secretKey scope:(NSString *)scope zone:(DYQNZoneMode)zoneMode key:(NSString * __nullable)key uploadFilePath:(NSString *)uploadFilePath result:(QiniuUploadCallback)block;

+ (void)updateQiNiuWithData:(NSData *)data key:(NSString * __nullable)key token:(NSString *)token zone:(DYQNZoneMode)zoneMode result:(QiniuUploadCallback)block;


+ (void)updateQiNiuWithFilePath:(NSString *)filePath key:(NSString * __nullable)key token:(NSString *)token zone:(DYQNZoneMode)zoneMode result:(QiniuUploadCallback)block;

@end

NS_ASSUME_NONNULL_END
