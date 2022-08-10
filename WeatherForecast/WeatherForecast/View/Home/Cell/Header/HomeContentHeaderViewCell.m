//
//  HomeContentHeaderCellTableViewCell.m
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/20/22.
//

#import "HomeContentHeaderViewCell.h"
@interface HomeContentHeaderViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end
@implementation HomeContentHeaderViewCell
#pragma mark - Lifecycle
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setup];
}

#pragma mark - Helpers
-(void) setup{
    self.tintColor = [UIColor systemBlueColor];

}
#pragma mark - Constants
+ (NSString *)getNibName{
    return @"HomeContentHeaderViewCell";
}

+ (NSString *)getReuseIdentifier{
    return @"HomeContentHeaderReuseIdentifier";
}

+ (CGFloat) getRowHeight{
    return 150.0;
}

- (void)bindingData:(NSString *)cityName{
    self.titleLabel.text = cityName;
}


@end
