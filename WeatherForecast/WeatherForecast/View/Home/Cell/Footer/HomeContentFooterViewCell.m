//
//  HomeContentFooterViewCell.m
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/20/22.
//

#import "HomeContentFooterViewCell.h"
@interface HomeContentFooterViewCell()
@property (weak, nonatomic) IBOutlet UIButton *forecastButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *widthButtonConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightButtonConstraint;
@property(assign, nonatomic) CGFloat widthScreen;

@end
@implementation HomeContentFooterViewCell

#pragma mark - Init
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [self setup];
}

#pragma mark - Helpers
-(void) setup{
    self.widthScreen = UIScreen.mainScreen.bounds.size.width;
    self.tintColor = [UIColor systemBlueColor];
    
    [self configButton];
}

-(void) configButton{
    self.forecastButton.backgroundColor = [UIColor systemYellowColor];
    self.forecastButton.layer.borderColor = [UIColor darkGrayColor].CGColor;
    self.forecastButton.layer.borderWidth = 3;
    
    CGFloat buttonWidth = 180;
    CGFloat buttonHeight = 60;
    
    self.widthButtonConstraint.constant = buttonWidth;
    self.heightButtonConstraint.constant = buttonHeight;
    
    [self.forecastButton addTarget:self action:@selector(didForecastButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
}

+ (NSString *)getReuseIdentifier{
    return @"HomeContentFooterViewCellReuseIdentifier";
}

+ (NSString *)getNibName{
    return @"HomeContentFooterViewCell";
}

+ (CGFloat)getRowHeight{
    return 60;
}

#pragma mark - Action

-(void) didForecastButtonTapped: (UIButton *) sender{
    [self.delegate didForecastButtonTapped];
}
@end
