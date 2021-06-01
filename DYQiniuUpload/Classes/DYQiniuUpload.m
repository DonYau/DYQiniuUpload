//
//  DYQiniuUploadTool.m
//  DYQiniuUpload
//
//  Created by donyau on 2019/1/10.
//  Copyright © 2019 donyau. All rights reserved.
//

#import "DYQiniuUpload.h"
#import <Qiniu/QiniuSDK.h>
#import <Qiniu/QN_GTM_Base64.h>
#import <CommonCrypto/CommonHMAC.h>

@implementation DYQiniuUpload

+ (void)updateQiNiuWithAccessKey:(NSString *)accessKey secretKey:(NSString *)secretKey scope:(NSString *)scope zone:(DYQNZoneMode)zoneMode key:(NSString *)key uploadFilePath:(NSString *)uploadFilePath result:(QiniuUploadCallback)block {
    QNConfiguration *config = [QNConfiguration build:^(QNConfigurationBuilder *builder) {
        switch (zoneMode) {
            case DYQNZone1:
                builder.zone = [QNFixedZone zone1];
                break;
            case DYQNZone2:
                builder.zone = [QNFixedZone zone2];
                break;
            case DYQNZone3:
                builder.zone = [QNFixedZone zoneNa0];
                break;
            default:
                builder.zone = [QNFixedZone zone0];
                break;
        }
    }];
    NSString *token = [self createTokenWithScope:scope accessKey:accessKey secretKey:secretKey];
    QNUploadManager *upManager = [[QNUploadManager alloc] initWithConfiguration:config];
    [upManager putFile:uploadFilePath key:key token:token complete:^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
        block(info.ok, resp);
    } option:nil];
}


+ (NSString *)createTokenWithScope:(NSString *)scope accessKey:(NSString *)accessKey secretKey:(NSString *)secretKey {
    NSMutableDictionary *jsonDict = [[NSMutableDictionary alloc] init];
    jsonDict[@"scope"] = scope;
    NSInteger timeTemp = [[NSDate date] timeIntervalSince1970] + 3600;
    
    jsonDict[@"deadline"] = @(timeTemp);
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:jsonDict options:0 error:nil];
    
    NSString* encoded = [self URLSafeBase64Encode:jsonData];
    
    NSString *encoded_signed = [self HMACSHA1:secretKey text:encoded];
    
    NSString *uploadToken=[NSString stringWithFormat:@"%@:%@:%@",accessKey,encoded_signed,encoded];
    
    return uploadToken;
}

+ (NSString *)URLSafeBase64Encode:(NSData *)text {
    
    NSString *base64 = [[NSString alloc] initWithData:[QN_GTM_Base64 encodeData:text] encoding:NSUTF8StringEncoding];
    base64 = [base64 stringByReplacingOccurrencesOfString:@"+" withString:@"-"];
    base64 = [base64 stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    return base64;
}

+  (NSString *)HMACSHA1:(NSString *)key text:(NSString *)text {
    const char *cKey = [key cStringUsingEncoding:NSUTF8StringEncoding];
    const char *cData = [text cStringUsingEncoding:NSUTF8StringEncoding];
    char cHMAC[CC_SHA1_DIGEST_LENGTH];
    CCHmac(kCCHmacAlgSHA1, cKey, strlen(cKey), cData, strlen(cData), cHMAC);
    NSData *HMAC = [[NSData alloc] initWithBytes:cHMAC length:CC_SHA1_DIGEST_LENGTH];
    NSString *hash = [self URLSafeBase64Encode:HMAC];
    return hash;
}


+ (void)updateQiNiuWithData:(NSData *)data key:(NSString *)key token:(NSString *)token zone:(DYQNZoneMode)zoneMode result:(nonnull QiniuUploadCallback)block {
    QNConfiguration *config = [QNConfiguration build:^(QNConfigurationBuilder *builder) {
        switch (zoneMode) {
            case DYQNZone1:
                builder.zone = [QNFixedZone zone1];
                break;
            case DYQNZone2:
                builder.zone = [QNFixedZone zone2];
                break;
            case DYQNZone3:
                builder.zone = [QNFixedZone zoneNa0];
                break;
            default:
                builder.zone = [QNFixedZone zone0];
                break;
        }
    }];
    QNUploadManager *upManager = [[QNUploadManager alloc] initWithConfiguration:config];
    [upManager putData:data key:key token:token complete:^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
        block(info.ok, resp);
    } option:nil];
}

+ (void)updateQiNiuWithFilePath:(NSString *)filePath key:(NSString *)key token:(NSString *)token zone:(DYQNZoneMode)zoneMode result:(QiniuUploadCallback)block {
    QNConfiguration *config = [QNConfiguration build:^(QNConfigurationBuilder *builder) {
        switch (zoneMode) {
            case DYQNZone1:
                builder.zone = [QNFixedZone zone1];
                break;
            case DYQNZone2:
                builder.zone = [QNFixedZone zone2];
                break;
            case DYQNZone3:
                builder.zone = [QNFixedZone zoneNa0];
                break;
            default:
                builder.zone = [QNFixedZone zone0];
                break;
        }
    }];
    QNUploadManager *upManager = [[QNUploadManager alloc] initWithConfiguration:config];
    [upManager putFile:filePath key:key token:token complete:^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
        block(info.ok, resp);
    } option:nil];
}


@end
