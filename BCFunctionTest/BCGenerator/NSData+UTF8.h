//
//  NSData+UTF8.h
//  textDemo
//
//  Created by caobo56 on 2018/3/8.
//  Copyright © 2018年 dahua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData(UTF8)

+ (NSData *)int2Nsdata:(int)intNum;

- (NSString *)utf8String;

+ (NSData *)convertHexStrToData:(NSString *)str;

@end
