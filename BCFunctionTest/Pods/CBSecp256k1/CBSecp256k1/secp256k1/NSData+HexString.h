//
//  NSData+HexString.h
//  ASKSecp256k1
//
//  Created by caobo56 on 2017/8/18.
//  Copyright © 2017年 caobo56. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (HexString)
- (NSString *)dataToHexString;
+ (NSData *)hexStringToData:(NSString *)hexString;
@end
