//
//  BCGenerator.m
//  BCFunctionTest
//
//  Created by caobo56 on 2018/4/26.
//  Copyright © 2018年 caobo56. All rights reserved.
//

#import "BCGenerator.h"
#import "EncryptUtil.h"
#import <BTCData.h>
#import <CBSecp256k1.h>
#import <NSData+Hashing.h>
#import <NS+BTCBase58.h>

static const NSString * BTCHMACSHA512key = @"Bitcoin seed";
//BTCHMACSHA512算法的key 这里用的是比特币的key

@interface BCGenerator()

@property(strong,nonatomic)NSData * seedData;

@end

@implementation BCGenerator


-(instancetype)initWithWith:(NSString *)seedStr{
    self = [super init];
    if (self) {
        [self creatSeedWith:seedStr];
        [self creatRootPrivatekey];
        [self creatmainProcessingKey];
        [self creatRootPublickey];
        [self creatAddress];
    }
    return self;
}


-(void)creatSeedWith:(NSString *)seedStr{
    NSData *seedData = [seedStr dataUsingEncoding:NSUTF8StringEncoding];
    _seedData = [[EncryptUtil sha256DataTwice:seedData] copy];
}

-(void)creatRootPrivatekey{
    NSData * hmac = BTCHMACSHA512([BTCHMACSHA512key dataUsingEncoding:NSUTF8StringEncoding], _seedData);
    self.rootPrivatekey = [[hmac subdataWithRange:NSMakeRange(0, hmac.length/2)] copy];
}

-(void)creatmainProcessingKey{
    NSData * hmac = BTCHMACSHA512([BTCHMACSHA512key dataUsingEncoding:NSUTF8StringEncoding], _seedData);
    self.mainProcessingKey = [[hmac subdataWithRange:NSMakeRange(hmac.length/2, self.rootPrivatekey.length)] copy];
}

-(void)creatRootPublickey{
    _rootPublickey = [[CBSecp256k1 generatePublicKeyWithPrivateKey:_rootPrivatekey compression:YES] copy];
}

-(void)creatAddress{
    NSData * address = BTCHash160(_rootPublickey);
    NSData * dat = [EncryptUtil convertHexStrToData:@"0"];
    NSMutableData * add = [[NSMutableData alloc]initWithData:dat];
    [add appendData:address];
    _address = [[add base58CheckString] copy];
}

@end
