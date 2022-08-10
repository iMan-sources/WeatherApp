//
//  HomeContentFooterViewCell.h
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/20/22.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol HomeContentFooterViewCellDelegate <NSObject>

-(void) didForecastButtonTapped;

@end

@interface HomeContentFooterViewCell : UITableViewHeaderFooterView
+(NSString *) getNibName;
+(NSString *) getReuseIdentifier;
+(CGFloat) getRowHeight;
@property(nonatomic, weak) id<HomeContentFooterViewCellDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
