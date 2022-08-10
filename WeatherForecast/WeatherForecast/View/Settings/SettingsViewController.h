//
//  SettingsViewController.h
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/21/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol SettingsViewControllerDelegate <NSObject>

-(void) didCityNameSelected: (NSString *)cityName;

@end

@interface SettingsViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, weak) id<SettingsViewControllerDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
