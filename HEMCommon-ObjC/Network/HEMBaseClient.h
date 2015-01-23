//
//  HEMBaseClient.h
//  HEMCommon-ObjC
//
// Created by Marcilio Junior on 1/23/15.
// Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

typedef NS_ENUM(NSUInteger, HEMBaseClientEnv) {
    HEMBaseClientEnvTest = 0,
    HEMBaseClientEnvProduction = 1
};

@interface HEMBaseClient : AFHTTPRequestOperationManager

+ (void)setBaseURLForTestAndProduction:(NSString *)baseURLString;
+ (void)setBaseURLsForTest:(NSString *)testBaseURLString
                production:(NSString *)productionBaseURLString;
+ (void)setDefaultEnvironment:(HEMBaseClientEnv)defaultEnvironment;

+ (instancetype)defaultClient;
+ (instancetype)sharedTestClient;
+ (instancetype)sharedProductionClient;

@end