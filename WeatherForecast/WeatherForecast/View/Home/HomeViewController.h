//
//  HomeViewController.h
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/20/22.
//

#import <UIKit/UIKit.h>
#import "HomeContentFooterViewCell.h"
#import "SettingsViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController : UIViewController<UITableViewDelegate, UITableViewDataSource,HomeContentFooterViewCellDelegate, SettingsViewControllerDelegate>

@end

NS_ASSUME_NONNULL_END
