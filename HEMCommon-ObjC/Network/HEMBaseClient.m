//
//  HEMBaseClient.m
//  HEMCommon-ObjC
//
// Created by Marcilio Junior on 1/23/15.
// Copyright (c) 2015 HE:mobile. All rights reserved.
//

#import "HEMBaseClient.h"

static NSString *_testBaseURLString = nil;
static NSString *_productionBaseURLString = nil;
static HEMBaseClientEnv _defaultEnvironment = HEMBaseClientEnvTest;

@implementation HEMBaseClient

#pragma mark - Client Configuration

+ (void)setBaseURLForTestAndProduction:(NSString *)baseURLString
{
    NSAssert(baseURLString != nil, @"BaseURL should not be nil");

    _testBaseURLString = baseURLString;
    _productionBaseURLString = baseURLString;
}

+ (void)setBaseURLsForTest:(NSString *)testBaseURLString
                production:(NSString *)productionBaseURLString
{
    NSAssert(testBaseURLString != nil, @"BaseURL for Test Environment should not be nil");
    NSAssert(productionBaseURLString != nil, @"BaseURL for Production Environment should not be nil");
    
    _testBaseURLString = testBaseURLString;
    _productionBaseURLString = productionBaseURLString;
}

+ (void)setDefaultEnvironment:(HEMBaseClientEnv)defaultEnvironment
{
    _defaultEnvironment = defaultEnvironment;
}

+ (NSDictionary *)clientHolder
{
    NSAssert(_testBaseURLString != nil && _productionBaseURLString != nil, @"You should call setBaseURLForTest:production: before start using this base client");
    
    static NSDictionary *clientHolder = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        id testClient = [[[self class] alloc] initWithBaseURL:[NSURL URLWithString:_testBaseURLString]];
        [testClient configureTestClient];
        HEMBaseClient *productionClient = [[[self class] alloc] initWithBaseURL:[NSURL URLWithString:_productionBaseURLString]];
        [productionClient configureProductionClient];
        
        clientHolder = @{@(HEMBaseClientEnvTest): testClient,
                         @(HEMBaseClientEnvProduction): productionClient};
    });
    
    return clientHolder;
}

#pragma mark - Client Singletons

+ (instancetype)defaultClient
{
    return [[self class] clientHolder][@(_defaultEnvironment)];
}

+ (instancetype)sharedTestClient
{
    return [[self class] clientHolder][@(HEMBaseClientEnvTest)];
}

+ (instancetype)sharedProductionClient
{
    return [[self class] clientHolder][@(HEMBaseClientEnvProduction)];
}

#pragma mark - Overridable Methods

- (void)configureTestClient
{
    // OVERRIDE THIS METHOD TO CONFIGURE THE CLIENT ON INIT
}

- (void)configureProductionClient
{
    // OVERRIDE THIS METHOD TO CONFIGURE THE CLIENT ON INIT
}

@end