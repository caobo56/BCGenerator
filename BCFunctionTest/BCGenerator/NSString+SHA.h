//
//  NSString+SHA.h
//  textDemo
//
//  Created by caobo56 on 2018/4/25.
//  Copyright © 2018年 dahua. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>

@interface NSString(SHA)
-(NSString *) sha1;
-(NSString *) sha224;
-(NSString *) sha256;
-(NSString *) sha384;
-(NSString *) sha512;
@end
