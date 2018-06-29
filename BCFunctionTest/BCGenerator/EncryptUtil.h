//
//  EncryptUtil.h
//  textDemo
//
//  Created by caobo56 on 2018/3/13.
//  Copyright © 2018年 dahua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EncryptUtil : NSObject

+ (NSString*)sha1StrWithString:(NSString *)str;

+ (NSString*)sha1StrWithData:(NSData *)data;

+ (NSData*)sha1DataWithData:(NSData *)data;

+ (Byte *)sha1BytesWithData:(NSData *)data;

+ (NSString *)sha256StringWithString:(NSString *)srcString;

+ (NSString *)sha256StringWithData:(NSData *)data;

+ (NSData *)sha256DataWithData:(NSData *)data;

+ (NSData *)sha256DataTwice:(NSData *)data;

+ (NSData *)sha256DataTwiceKey:(NSData *)data;

+ (NSData *)convertHexStrToData:(NSString *)str;

@end
