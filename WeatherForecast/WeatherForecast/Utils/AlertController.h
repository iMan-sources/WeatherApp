//
//  CityAlertController.h
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/22/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN
@protocol CityAlertControllerDelegate <NSObject>

-(void)showAlertRequestNewcity: (UIViewController *) vc success: (void(^)(NSString *cityName))successComletion;

-(void)showNetworkErrorAlert: (UIViewController *) vc withErrorMessage: (NSString *)message completionHandler: (void(^) (NSNull *)) completion;

@end

@interface AlertController : NSObject<CityAlertControllerDelegate>

@end

NS_ASSUME_NONNULL_END
