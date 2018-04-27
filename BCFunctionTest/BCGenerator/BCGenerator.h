//
//  BCGenerator.h
//  BCFunctionTest
//
//  Created by caobo56 on 2018/4/26.
//  Copyright © 2018年 caobo56. All rights reserved.
//

/**
 使用方法：
 #import "BCGenerator.h"
 
 -(void)test{
 BCGenerator * generator = [[BCGenerator alloc]initWithWith:@"pseudorandom sequence"];
 NSLog(@"\ngenerator.rootPrivatekey = %@\n generator.mainProcessingKey = %@\ngenerator.rootPublickey = %@\ngenerator.address = %@",generator.rootPrivatekey,generator.mainProcessingKey,generator.rootPublickey,generator.address);
 }
 */

#import <Foundation/Foundation.h>

@interface BCGenerator : NSObject

@property(strong,nonatomic)NSData * rootPrivatekey;

@property(strong,nonatomic)NSData * mainProcessingKey;

@property(strong,nonatomic)NSData * rootPublickey;

@property(strong,nonatomic)NSString * address;

/**
 根据伪随机数生成种子
 
 @param seedStr seedStr 根据伪随机数
 @return return instancetype 生成的对象
 */
-(instancetype)initWithWith:(NSString *)seedStr;


@end
