//
//  VHSDK.h
//  Adidas
//
//  Created by 郭超 on 2021/11/10.
//

#import <Foundation/Foundation.h>
#import <UIKIT/UIKIT.h>

@interface VHSDK : NSObject
/**
 * @brief 单例方法。
 * @return 返回单例对象。
 */
+ (instancetype)sharedInstance;

/**
 * 用来获得当前sdk的版本号
 * return 返回sdk版本号
 */
+ (NSString *) getVHSDKVersion;

/**
 *  注册app
 *  @param app_id       vhall后台注册生成的app_id
 *  @param secret_key   vhall后台注册生成的secret_key
 *  @param app_host     接口host地址
 *
 */
+ (void)registerApp_id:(NSString *)app_id
            secret_key:(NSString *)secret_key
              app_host:(NSString *)app_host;

/** 进入房间
 *  @param il_id        房间号
 *  @param member_id    三方唯一ID
 *  @param phone        手机号码
 */
+ (void)enterRoomIl_id:(NSString *)il_id
             member_id:(NSString *)member_id
                 phone:(NSString *)phone
                sucess:(void(^)(void))sucessBlock
               failure:(void(^)(NSString *msg))failureBlock;

/**
 * 关闭悬浮窗
 */
+ (void)closePIPView;


@end
