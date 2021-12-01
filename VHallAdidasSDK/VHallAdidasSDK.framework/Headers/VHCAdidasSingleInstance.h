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
 * 跳转登录界面
 * @param viewController 所在控制器
 * @param block il_id  房间号 / member_id   三方唯一ID / phone   手机号码
 */
- (void)toLoginToAdidasViewController:(UIViewController *)viewController completion:(void(^)(NSString * il_id , NSString * member_id , NSString * phone))block;
/**
 * 获取推送权限接口
 * @param block 完成操作 isPush YES以开启推送权限 NO未开启推送权限
 */
- (void)requestPushPermissionToAdidasCompletion:(void(^)(BOOL isPush))block;
/**
 * 调整推送权限设置界面
 */
- (void)openPushPermissionToAdidas;
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
- (void)openShareToAdidasShareImg:(NSString *)shareImg viewController:(UIViewController *)viewController;

@end

@interface VHCAdidasSingleInstance : NSObject <VHCAdidasSDK>

+ (instancetype)sharedInstance;

/** 由Adidas初始化VHall时注入实现该协议对象 */ 
- (void)registerAdidasSDK:(id<VHCAdidasSDK>)adidasSDK;


@end
