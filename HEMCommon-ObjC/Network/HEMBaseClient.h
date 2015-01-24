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

/**
 *  Set the base URL for production and test environment.
 *
 *  @param baseURLString URL string.
 */
+ (void)setBaseURLForTestAndProduction:(NSString *)baseURLString;

/**
 *  Set the base URL for production and test environment.
 *
 *  @param testBaseURLString       URL String for test environment.
 *  @param productionBaseURLString URL String for production environment.
 */
+ (void)setBaseURLsForTest:(NSString *)testBaseURLString
                production:(NSString *)productionBaseURLString;

/**
 *  Set the default environment for use of defaultClient method.
 *
 *  @param defaultEnvironment HEMBaseClientEnvTest or HEMBaseClientEnvProduction.
 */
+ (void)setDefaultEnvironment:(HEMBaseClientEnv)defaultEnvironment;

/**
 *  Singleton instance for the a client based on default envrironment.
 *
 *  @return Singleton instance.
 */
+ (instancetype)defaultClient;

/**
 *  Singleton instance for client of test environment.
 *
 *  @return Singleton instance.
 */
+ (instancetype)sharedTestClient;

/**
 *  Singleton instance for client of production environment.
 *
 *  @return Singleton instance.
 */
+ (instancetype)sharedProductionClient;

@end