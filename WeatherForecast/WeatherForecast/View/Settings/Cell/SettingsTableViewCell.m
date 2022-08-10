//
//  SettingsTableViewCell.m
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/21/22.
//

#import "SettingsTableViewCell.h"
@interface SettingsTableViewCell()
@property (weak, nonatomic) IBOutlet UIStackView *mainStackView;
@property (weak, nonatomic) IBOutlet UILabel *cityLabel;

@end

@implementation SettingsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setup];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void) setup{
    self.backgroundColor = [UIColor clearColor];
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    
    [self setupStackView];
}

-(void) setupStackView{
    self.mainStackView.layer.borderWidth = 4.0;
    self.mainStackView.layer.borderColor = [UIColor systemGrayColor].CGColor;
    self.mainStackView.layer.cornerRadius = 10.0;

    self.mainStackView.layoutMargins = UIEdgeInsetsMake(0, 20, 0, 20);
    [self.mainStackView setLayoutMarginsRelativeArrangement:YES];
}


+(NSString *) getReuseIdentifier{
    return @"SettingsTableViewCellReuseIdentifier";
}

+ (CGFloat)getRowHeight{
    return 80.0;
}

+ (NSString *)getNibName{
    return @"SettingsTableViewCell";
}

- (void)bindingData:(NSString *)cityName{
    self.cityLabel.text = cityName;
}

@end
