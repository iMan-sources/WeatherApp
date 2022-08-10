//
//  SettingsHeaderTableViewCell.m
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/21/22.
//

#import "SettingsHeaderTableViewCell.h"

@implementation SettingsHeaderTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setup];
}

-(void) setup{
    self.tintColor = [UIColor systemBlueColor];
}

+(NSString *) getReuseIdentifier{
    return @"SettingsHeaderTableViewCellReuseIdentifier";
}

+ (CGFloat)getRowHeight{
    return 30.0;
}

+ (NSString *)getNibName{
    return @"SettingsHeaderTableViewCell";
}

@end
