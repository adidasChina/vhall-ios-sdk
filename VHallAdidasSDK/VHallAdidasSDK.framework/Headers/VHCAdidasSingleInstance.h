//
//  VHCAdidasSingleInstance.h
//  Adidas
//
//  Created by 郭超 on 2021/11/10.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol VHCAdidasSDK <NSObject>

@required

/**
 * 获取登录状态接口
 * @param block 完成操作 isLogin YES登录 NO未登录
 */
- (void)requestLoginStatusToAdidasCompletion:(void(^)(BOOL isLogin))block;
/**
 * 获取用户信息
 * @param block member_id   三方唯一ID / phone   手机号码
 */
- (void)requestToUserInfoToAdidasCompletion:(void(^)(NSString * member_id , NSString * phone))block;
/**
 * 跳转登录界面
 * @param viewController 所在控制器
 * @param block member_id   三方唯一ID / phone   手机号码
 */
- (void)toLoginToAdidasViewController:(UIViewController *)viewController completion:(void(^)(NSString * member_id , NSString * phone))block;
/**
 * 获取推送权限接口
 * @param block 完成操作 isPush YES以开启推送权限 NO未开启推送权限
 */
- (void)requestPushPermissionToAdidasCompletion:(void(^)(BOOL isPush))block;
/**
 * 调整推送权限设置界面
 * @param viewController 所在控制器
 */
- (void)openPushPermissionToAdidasToViewController:(UIViewController *)viewController;
/**
 * 进入商品半屏界面
 * @param good_id 商品id
 * @param viewController 所在控制器
 */
- (void)enterGoodsAlertToAdidasGoodId:(NSString *)good_id viewController:(UIViewController *)viewController;
/**
 * 进入商品详情页
 * @param good_id 商品id
 * @param viewController 所在控制器
 */
- (void)enterGoodsDetailToAdidasGoodId:(NSString *)good_id viewController:(UIViewController *)viewController;

/**
 * 打开分享页面接口
 * @param shareImg 分享的图片url
 * @param viewController 所在控制器
 */
- (void)openShareToAdidasShareImg:(NSString *)shareImg viewController:(UIViewController *)viewController liveName:(NSString *)liveName;

/**
 * 埋点接口
 * @param event   事件
 * @param dotDict 属性
 */
- (void)requestDotToAdidasEvent:(NSString *)event dotDict:(NSMutableDictionary *)dotDict;


/**
 * 获取Adidas指定控制器
 */
- (UIViewController *)getToAdidasVC;

@end

@interface VHCAdidasSingleInstance : NSObject <VHCAdidasSDK>

+ (instancetype)sharedInstance;

/** 由Adidas初始化VHall时注入实现该协议对象 */ 
- (void)registerAdidasSDK:(id<VHCAdidasSDK>)adidasSDK;


@end
