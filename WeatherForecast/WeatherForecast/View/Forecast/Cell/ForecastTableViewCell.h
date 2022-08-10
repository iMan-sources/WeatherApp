//
//  ForecastTableViewCell.h
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/21/22.
//

#import <UIKit/UIKit.h>
#import "Weather.h"
NS_ASSUME_NONNULL_BEGIN

@interface ForecastTableViewCell : UITableViewCell

+(NSString *) getReuseIdentifier;

+(CGFloat) getRowHeight;

+(NSString *) getNibName;

-(void) bindingData: (Weather *)weather;
@end

NS_ASSUME_NONNULL_END
