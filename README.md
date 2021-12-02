# Adidas VHallSDK 集成

## 一 支持平台
支持 iOS 9.0 及以上系统

## SDK 获取部署

#### 通过pod引入微吼SDK


```objc

  pod 'VhallAdidasSDK'
  
```

#### 功能实现以来的第三方库 以及指定版本


```objc

  pod 'AFNetworking','4.0.1'
  pod 'MBProgressHUD','1.2.0'
  pod 'Masonry','1.1.0'
  pod 'SDWebImage','5.12.1'
  pod 'SDWebImageFLPlugin','0.5.0'
  pod 'MJRefresh','3.7.2'
  pod 'MJExtension','3.4.0'
  pod 'DZNEmptyDataSet','1.8.1'
  pod 'YYKit','1.0.9'
  pod 'VHCore','2.2.0'
  pod 'VHYun_IM','2.3.0'
  pod 'VHYun_LSS','2.4.0'
  pod 'VHYun_RTC','2.4.0'

```


## 工程设置修改

Build Setting 中 Enable Bitcode 设置为NO

设置Info.plist中 App Transport Security Settings -> Allow Arbitrary Loads 设置为 YES

## 初始 SDK


```objc
#import "VHSDK.h"
#import "VHCAdidasSingleInstance.h"
```


```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    <!--#define VHSDK_app_id                   @"2ASwAwye"-->
    <!--#define VHSDK_secret_key               @"dE7sLSZTjzq366lgXv3RuPC8hw5iXZSr"-->
    <!--#define VHSDK_app_host                 @"https://t-adidas-api.vhallyun.com"-->

    /// 初始化SDK
    [VHSDK registerApp_id:VHSDK_app_id secret_key:VHSDK_secret_key app_host:VHSDK_app_host];

    /// 注册原生交互回调
    [[VHCAdidasSingleInstance sharedInstance] registerAdidasSDK:self];

    return YES;
}
```



## 原生交互回调

```objc
/**
#pragma mark - VHCAdidasSDK

/**
 * 获取登录状态接口
 */
- (void)requestLoginStatusToAdidasCompletion:(void(^)(BOOL isLogin))block
{
    if (block) {
        block(YES);
    }
}
/**
 * 登录
 */
- (void)toLoginToAdidasViewController:(UIViewController *)viewController completion:(void(^)(NSString * il_id , NSString * member_id , NSString * phone))block
{
    
}
/**
 * 获取推送权限接口
 */
- (void)requestPushPermissionToAdidasCompletion:(void(^)(BOOL isPush))block
{
    if (block) {
        block(YES);
    }
}
/**
 * 调整推送权限设置界面
 */
- (void)openPushPermissionToAdidas
{
    
}
/**
 * 进入商品半屏界面
 */
- (void)enterGoodsAlertToAdidasGoodId:(NSString *)good_id viewController:(UIViewController *)viewController
{
    <!--VHMainVC * mainVC = [[VHMainVC alloc] init];-->
    <!--mainVC.modalPresentationStyle = 0;-->
    <!--[viewController presentViewController:mainVC animated:YES completion:nil];-->
}
/**
 * 进入商品详情页
 */
- (void)enterGoodsDetailToAdidasGoodId:(NSString *)good_id viewController:(UIViewController *)viewController
{
    <!--VHMainVC * mainVC = [[VHMainVC alloc] init];-->
    <!--mainVC.modalPresentationStyle = 0;-->
    <!--[viewController presentViewController:mainVC animated:YES completion:nil];-->
}

/**
 * 打开分享页面接口
 */
- (void)openShareToAdidasShareImg:(NSString *)shareImg viewController:(UIViewController *)viewController
{
    
}

```

## 进入房间

```objc
#pragma mark - 进入直播间
- (void)clickEnterRoom
{
    if (self.roomTextField.text.length < 1) {
//        [VUITool showMsg:@"房间号不能为空"];
    }
    [[[UIApplication sharedApplication] keyWindow] endEditing:YES];
    
    /// 进入房间
    [VHSDK enterRoomIl_id:self.roomTextField.text member_id:@"123123123435" phone:@"13261699658" sucess:^{
        NSLog(@"进入成功");
    } failure:^(NSString * _Nonnull msg) {
        NSLog(@"进入失败 === %@",msg);
    }];
}
```


## 注意事项

```objc

1. 需要在info的'Fonts provided by application' 团价对应字体 'AdihausDIN-Bold.ttf' 'AdihausDIN-Regular.ttf'

```


## 更新日志

```objc

2021.12.02
1.调整进入直播间之前，获取用户状态的接口
2.调整商品列表返回的数据结构
3.结束直播、结束点播监听关闭悬浮窗，踢出直播间，不展示悬浮窗
4.优化进入房间逻辑，处理了inav/get请求异常的场景
5.完善进入房间，获取最新一条公告
6.优化进入房间欢迎语
7.优化点击商品跳转参数
8.优化重新登录流程

2021.12.01
1.优化方法和入参，application:application launchOptions:launchOptions 参数移除不需要传递了，member_id 和 phone 调整了一下 可以传nil或者@“”。
2.优化window的获取方式、使用方式
3.移除IQKeyboardManager
```


