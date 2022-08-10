//
//  ForecastTableViewCell.m
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/21/22.
//

#import "ForecastTableViewCell.h"
@interface ForecastTableViewCell()
@property (weak, nonatomic) IBOutlet UILabel *dayLabel;

@property (weak, nonatomic) IBOutlet UILabel *minTempLabel;

@property (weak, nonatomic) IBOutlet UILabel *maxTempLabel;
@property (weak, nonatomic) IBOutlet UIStackView *mainStackView;

@end


@implementation ForecastTableViewCell

#pragma mark - Init
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
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    self.mainStackView.layer.borderWidth = 4.0;
    self.mainStackView.layer.borderColor = [UIColor systemGrayColor].CGColor;
    

    
    self.mainStackView.layoutMargins = UIEdgeInsetsMake(0, 36, 0, 36);
    [self.mainStackView setLayoutMarginsRelativeArrangement:YES];
}

+(NSString *) getReuseIdentifier{
    return @"ForecastTableViewCellReuseIdentifier";
}

+ (CGFloat)getRowHeight{
    return 100.0;
}

+ (NSString *)getNibName{
    return @"ForecastTableViewCell";
}

- (void)bindingData:(Weather *)weather{
    self.dayLabel.text = weather.day.day;
    self.minTempLabel.text = [NSString stringWithFormat:@"%.2f °C", weather.mainJSON.tempMin];
    self.maxTempLabel.text = [NSString stringWithFormat:@"%.2f °C", weather.mainJSON.tempMax];
}

@end
