//
//  ForecastViewController.h
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/21/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ForecastViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
@property(assign, nonatomic) NSString *cityName;

@end

NS_ASSUME_NONNULL_END

