//
//  SettingsHeaderTableViewCell.h
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/21/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingsHeaderTableViewCell : UITableViewHeaderFooterView
+(NSString *) getReuseIdentifier;

+(CGFloat) getRowHeight;

+(NSString *) getNibName;
@end

NS_ASSUME_NONNULL_END
