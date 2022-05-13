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
  pod 'VHCore','2.2.2'
  pod 'VHYun_IM','2.3.2'
  pod 'VHYun_LSS','2.4.3'

```


## 工程设置修改

设置Info.plist中 App Transport Security Settings -> Allow Arbitrary Loads 设置为 YES

## 初始 SDK


```objc
#import "VHSDK.h"
#import "VHCAdidasSingleInstance.h"
```


```objc
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
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
- (void)openPushPermissionToAdidasToViewController:(UIViewController *)viewController
{
    AdidasGoodsDetailVC * mainVC = [[AdidasGoodsDetailVC alloc] init];
    mainVC.modalPresentationStyle = UIModalPresentationFullScreen;
    [viewController presentViewController:mainVC animated:YES completion:nil];
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

/**
 * 埋点接口
 */
- (void)requestDotToAdidasEvent:(NSString *)event dotDict:(NSMutableDictionary *)dotDict
{
    
}

/**
 * 获取Adidas指定控制器
 */
- (UIViewController *)getToAdidasVC
{
    return [VUITool topController];
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

1. 需要在info的'Fonts provided by application' 添加对应字体 'AdihausDIN-Bold.ttf' 'AdihausDIN-Regular.ttf'

```


## 更新日志

```objc
2022.05.13
1. 更新tag

2022.05.10
1. 优化预告页开播提醒

2022.04.01
1. 调整画中画进入房间流程

2022.03.15
1. v2.0 封版

2022.03.09
1. v2.0 UI走查完毕

2022.03.09
1. 修复清屏bug

2022.03.08
1. 完善商品icon

2022.03.07
1. 丰富抽奖功能
2. 新增清屏功能

2022.02.21
1. 修复切换前后台，界面刷新产生的跳动问题
2. 更新预告页文案展示

2022.02.10
1. 数据埋点，单机推屏卡片，单机购买按钮，单机商品列表，单机直播间。

2022.01.13
1. 优化UI

2022.01.11
1. 没有折扣的原价商品，价格显示黑色，有划线价，划线价显示红色。
2. 按钮新增按压态
3. 调整项目可见的字间距
4. 修改红包样式
5. 新增商品列表占位图
6. 填写收货地址流程优化

2022.01.07
完善设计效果

2021.12.30
优化点赞效果

2021.12.28
1.聊天区域\公告\欢迎语区域字体间距大小优化
2.新增红包按钮
3.点赞变红心
4.点击购买商品列表收起
5.删除填写信息界面人物头像

2021.12.27
1.解决日志 One of the two will be used. Which one is undefined 的问题
2.新增中奖自动弹窗

2021.12.23
UI走查

2021.12.22
包含模拟器且支持bitcode

2021.12.21
Adidas如果没有给当前显示的控制器,则vhall使用当前屏幕显示的topVC.

2021.12.19
优化登录导致的退出房间声音还存在的问题

2021.12.18
bitcode支持测试

2021.12.17
1.离开房间取消消息监听

2021.12.16
1.增加悬浮窗监听键盘弹出
2.优化切换前后台刷新直播、点播房间状态
3.优化商品列表和开屏广告弹窗

2021.12.15
1.项目UI走查,并修复UI问题

2021.12.14
1.新增获取最新用户信息接口
- (void)requestToUserInfoToAdidasCompletion:(void(^)(NSString * member_id , NSString * phone))block;
2.新增进入测试房间接口
+ (void)enterTestMember_id:(NSString *)member_id
                     phone:(NSString *)phone;
3.更改商品日志上报接口请求数据

2021.12.13
1.增加推送界面控制器
2.优化切换后台收不到消息,无法同步状态的问题

2021.12.09
1.调整开屏广告和欢迎语的顺序流程
2.增加取消和设置默认回放消息监听
3.支持虚拟抽奖

2021.12.08
1.统一tost的样式
2.增加三个抽奖流程相关的icon

2021.12.07
1.结束直播或者被踢出的时候关闭悬浮窗
2.优化点赞动画效果
3.重构画中画逻辑

2021.12.06
1.优化画中画效果
2.视频加载loading需要在视频上方
3.点击分享不打开悬浮窗
5.增加获取Adidas控制器的方法
6.新增获取Adidas指定控制器

2021.12.03
1、新增抽奖开关监听功能
2、iOS被踢出直播间后--未进行提示踢出文案
3、收到公告消息，要自动滑动到底部。
4、增加敏感词校验
5、直播页面关闭分享页面后，无法正常获取直播

2021.12.02
1.调整进入直播间之前，获取用户状态的接口
2.调整商品列表返回的数据结构
3.结束直播、结束点播监听关闭悬浮窗，踢出直播间，不展示悬浮窗
4.优化进入房间逻辑，处理了inav/get请求异常的场景
5.完善进入房间，获取最新一条公告
6.优化进入房间欢迎语
7.优化点击商品跳转参数
8.优化重新登录流程
9.优化填写地址信息界面

2021.12.01
1.优化方法和入参，application:application launchOptions:launchOptions 参数移除不需要传递了，member_id 和 phone 调整了一下 可以传nil或者@“”。
2.优化window的获取方式、使用方式
3.移除IQKeyboardManager
```


