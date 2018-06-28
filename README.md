# BCGenerator
BCGenerator 一个比特币生成私钥，公钥，地址的pod库

简介：https://www.jianshu.com/p/7a259a46ecd9

相关实现原理：

技术细节：比特币私钥、公钥、钱包地址的来历和关系https://www.jianshu.com/p/bfa6a3207923

### BCGenerator项目集成方法：
可以直接使用pod集成，也可以将代码拖入项目中；
pod 集成：
```
pod 'BCGenerator'
```

### BCGenerator依赖类库：
```
  s.dependency "CBSecp256k1"
  s.dependency "CBBase58"
```
CBSecp256k1 是从 iOS比特币项目CoreBitcoin 摘出来的椭圆双曲线算法部分。

项目地址：https://github.com/caobo56/CBSecp256k1

CBBase58 是从 iOS比特币项目CoreBitcoin 摘出来的base58算法部分，并且集成了RIPEMD算法的 RIPEMD-160。

项目地址：https://github.com/caobo56/CBBase58

项目简介：https://www.jianshu.com/p/b20a26de4bc7

### BCGenerator目录
库文件目录如下：
```
BCGenerator.h	EncryptUtil.h	NSData+UTF8.h	NSString+SHA.h
BCGenerator.m	EncryptUtil.m	NSData+UTF8.m	NSString+SHA.m
```
### BCGenerator使用
其中BCGenerator 就是生成公钥私钥地址的对象，使用方法如下：
```
 #import "BCGenerator.h"
 
 -(void)test{
 BCGenerator * generator = [[BCGenerator alloc]initWithWith:@"pseudorandom sequence"];
 NSLog(@"\n generator.rootPrivatekey = %@\n generator.mainProcessingKey = %@\n generator.rootPublickey = %@\n generator.address = %@",generator.rootPrivatekey,generator.mainProcessingKey,generator.rootPublickey,generator.address);
 }
```
### BCGenerator的头文件
```
@property(strong,nonatomic)NSData * rootPrivatekey;
//主私钥

@property(strong,nonatomic)NSData * mainProcessingKey;
//主链编码

@property(strong,nonatomic)NSData * rootPublickey;
//主公钥

@property(strong,nonatomic)NSString * address;
//由主公钥生成的比特币地址

/**
 根据伪随机数生成种子
 
 @param seedStr seedStr 根据伪随机数
 @return return instancetype 生成的对象
 */
-(instancetype)initWithWith:(NSString *)seedStr;

```
### SHA
SHA1-256 主要是由 EncryptUtil 来完成的。其他的sha算法在NSString+SHA中。

--------------------------------------------------------------------------------------
### 0.9.1发布

pod 版本从 0.9.0 升级到 0.9.1 

修复生成 BCGenerator 生成后 adddress 为 nil 的bug

--------------------------------------------------------------------------------------

### 0.9.2

pod 版本从 0.9.1 升级到 0.9.2 

添加 BTCScript

下面是本次添加的文件

```
BTC256.h
BTC256.m
BTCAddress.h
BTCAddress.m
BTCAddressSubclass.h
BTCBigNumber.h
BTCBigNumber.m
BTCCurvePoint.h
BTCCurvePoint.m
BTCErrors.h
BTCErrors.m
BTCKey.h
BTCKey.m
BTCNetwork.h
BTCNetwork.m
BTCOpcode.h
BTCOpcode.m
BTCProtocolSerialization.h
BTCProtocolSerialization.m
BTCScript.h
BTCScript.m
BTCSignatureHashType.h

```

使用方法：

```
    BCGenerator * bb = [[BCGenerator alloc]initWithWith:@"caobor111111"];
    BTCScript* outputScript = [[BTCScript alloc] initWithAddress:[BTCAddress addressWithString:bb.address]];
    NSLog(@"outputScript.data == %@",outputScript.data);

```

--------------------------------------------------------------------------------------
