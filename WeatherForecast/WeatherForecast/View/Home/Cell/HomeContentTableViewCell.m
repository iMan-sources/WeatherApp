//
//  HomeContentTableViewCell.m
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/20/22.
//

#import "HomeContentTableViewCell.h"

@interface HomeContentTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleLabelLeading;

@end

@implementation HomeContentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setup];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
#pragma mark - Helpers
-(void) setup{
    self.backgroundColor = [UIColor clearColor];
    [self configTitleLabel];
}

-(void) configTitleLabel{
    CGFloat screenWidth = UIScreen.mainScreen.bounds.size.width;
    CGFloat leading = screenWidth / 4;
    
    self.titleLabelLeading.constant = leading;
}

- (void)bindingData:(WeatherFeature)feature withWeather:(Weather *)weather{
//    NSLog(@"%@", weather.wind);
    switch (feature) {
        case temp:
            self.titleLabel.text = [[NSString alloc] initWithFormat:@"Temperature: %.1f °C", weather.mainJSON.temp];
            return;
        case humid:
            self.titleLabel.text = [[NSString alloc] initWithFormat:@"Humidity: %ld", (long)weather.mainJSON.humidity];
            return;
        case maxTemp:
            self.titleLabel.text = [[NSString alloc] initWithFormat:@"Max Temp: %.2f °C", weather.mainJSON.tempMax];
            return;
        case minTemp:
            self.titleLabel.text = [[NSString alloc] initWithFormat:@"Min Temp: %.2f °C", weather.mainJSON.tempMin];
            return;
        case winspeed:
            self.titleLabel.text = [[NSString alloc] initWithFormat:@"Win speed: %.2f km/h", weather.wind.speed];
            return;
    }
}
#pragma mark - Constants

+ (NSString *)getReuseIdentifier{
    return @"HomeContentTableViewCellID";
}

+ (NSString *)getNibName{
    return @"HomeContentTableViewCell";
}

@end
