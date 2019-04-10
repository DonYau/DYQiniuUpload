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

@interface DYQiniuUpload : NSObject

+ (void)updateQiNiuWithAccessKey:(NSString *)accessKey secretKey:(NSString *)secretKey scope:(NSString *)scope zone:(DYQNZoneMode)zoneMode key:(NSString *)key uploadFilePath:(NSString *)uploadFilePath result:(void (^)(BOOL success))block;

@end

NS_ASSUME_NONNULL_END
