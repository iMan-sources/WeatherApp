//
//  Wind.m
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/20/22.
//

#import "Wind.h"

@implementation Wind

- (instancetype)initWithSpeed:(double)speed withDeg:(double)deg withGust:(double)gust{
    if (self = [super init]) {
        self.speed = speed;
        self.deg = deg;
        self.gust = gust;
    }
    return self;
}

- (void)printOut{
    NSLog(@"speed: %f", self.speed);
    NSLog(@"deg: %f", self.deg);
    NSLog(@"gust: %f", self.gust);
}
@end
