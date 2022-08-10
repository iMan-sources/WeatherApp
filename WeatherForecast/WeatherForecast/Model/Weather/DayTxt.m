//
//  Day.m
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/21/22.
//

#import "DayTxt.h"

@implementation DayTxt

- (instancetype)initWithDay:(NSString *)day{
    if (self = [super init]) {
        self.day = day;
    }
    return self;
}

- (void)printOut{
    NSLog(@"%@", self.day);
}
@end
