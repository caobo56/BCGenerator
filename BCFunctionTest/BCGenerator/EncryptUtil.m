//
//  EncryptUtil.m
//  textDemo
//
//  Created by caobo56 on 2018/3/13.
//  Copyright © 2018年 dahua. All rights reserved.
//

#import "EncryptUtil.h"
#import <CommonCrypto/CommonDigest.h>
#import "NSData+UTF8.h"

@implementation EncryptUtil

+ (NSString*)sha1StrWithString:(NSString *)str
{
    const char *cstr = [str cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:str.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (unsigned int)data.length, digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    return output;
}

+ (NSString*)sha1StrWithData:(NSData *)data{
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (unsigned int)data.length, digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    return (NSString*)output;
}

+ (NSData*)sha1DataWithData:(NSData *)data{
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (unsigned int)data.length, digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    NSData *outData = [output dataUsingEncoding:NSUTF8StringEncoding];
    return outData;
}

+ (Byte *)sha1BytesWithData:(NSData *)data{
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    CC_SHA1(data.bytes, (unsigned int)data.length, digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i=0; i<CC_SHA1_DIGEST_LENGTH; i++) {
        [output appendFormat:@"%02x", digest[i]];
    }
    NSData *outData = [output dataUsingEncoding:NSUTF8StringEncoding];
    Byte *bytes = (Byte *)[outData bytes];
    return bytes;
}

//sha256加密方式
+ (NSString *)sha256StringWithString:(NSString *)srcString {
    const char *cstr = [srcString cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:srcString.length];
    
    uint8_t digest[CC_SHA256_DIGEST_LENGTH];
    
    CC_SHA256(data.bytes, (int)data.length, digest);
    
    NSMutableString* result = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    
    return result;
}

+ (NSString *)sha256StringWithData:(NSData *)data{
    uint8_t digest[CC_SHA256_DIGEST_LENGTH];
    
    CC_SHA256(data.bytes, (int)data.length, digest);
    
    NSMutableString* result = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    return result;
}

+ (NSData *)sha256DataWithData:(NSData *)data{
    uint8_t digest[CC_SHA256_DIGEST_LENGTH];
    
    CC_SHA256(data.bytes, (int)data.length, digest);
    
    NSMutableString* result = [NSMutableString stringWithCapacity:CC_SHA256_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA256_DIGEST_LENGTH; i++) {
        [result appendFormat:@"%02x", digest[i]];
    }
    NSData *outData = [result dataUsingEncoding:NSUTF8StringEncoding];
    return outData;
}


+ (NSData *)sha256DataTwice:(NSData *)data{
    NSString * firstkey = [EncryptUtil sha256StringWithData:data];
    
    NSData * firstData = [NSData convertHexStrToData:firstkey];
    
    NSString * secondKey = [EncryptUtil sha256StringWithData:firstData];
    NSData * secondData = [NSData convertHexStrToData:secondKey];
    
    return secondData;
}


+ (NSData *)sha256DataTwiceKey:(NSData *)data{
    NSString * firstkey = [EncryptUtil sha256StringWithData:data];
    
    NSData * firstData = [NSData convertHexStrToData:firstkey];
    
    NSString * secondKey = [EncryptUtil sha256StringWithData:firstData];
    NSData * secondData = [NSData convertHexStrToData:secondKey];

    return [secondData subdataWithRange:NSMakeRange(0, 4)];
}
@end
