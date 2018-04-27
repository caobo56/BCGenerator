//
//  ViewController.m
//  BCFunctionTest
//
//  Created by caobo56 on 2018/4/25.
//  Copyright © 2018年 caobo56. All rights reserved.
//

#import "ViewController.h"
#import "BCGenerator.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self test];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)test{
    BCGenerator * generator = [[BCGenerator alloc]initWithWith:@"pseudorandom sequence"];
    // pseudorandom sequence 为你的随机数生成的结果
    NSLog(@"\ngenerator.rootPrivatekey = %@\n generator.mainProcessingKey = %@\ngenerator.rootPublickey = %@\ngenerator.address = %@",generator.rootPrivatekey,generator.mainProcessingKey,generator.rootPublickey,generator.address);
}



@end
