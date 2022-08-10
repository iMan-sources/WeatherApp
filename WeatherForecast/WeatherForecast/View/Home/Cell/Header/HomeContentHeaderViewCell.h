//
//  HomeContentHeaderCellTableViewCell.h
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/20/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HomeContentHeaderViewCell : UITableViewHeaderFooterView
+(NSString *) getNibName;
+(NSString *) getReuseIdentifier;
+(CGFloat) getRowHeight;
-(void) bindingData: (NSString *)cityName;
@end

NS_ASSUME_NONNULL_END
