//
//  HomeContentTableViewCell.h
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/20/22.
//

#import <UIKit/UIKit.h>
#import "HomeViewModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface HomeContentTableViewCell : UITableViewCell

+(NSString *) getNibName;
+(NSString *) getReuseIdentifier;
-(void) bindingData: (WeatherFeature)feature withWeather: (Weather *)weather;
@end

NS_ASSUME_NONNULL_END
