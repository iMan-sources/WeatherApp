//
//  mainJSON.m
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/20/22.
//

#import "MainJSON.h"

@implementation MainJSON

- (instancetype)initWithTemp:(double)temp withFeelsLike:(double)feelsLike withTempMin:(double)tempMin withTempMax:(double)tempMax withPressure:(NSInteger)pressure withHumidity:(NSInteger)humidity withSeaLevel:(NSInteger)seaLevel withGrndLevel:(NSInteger)grndLevel{
    if (self = [super init]) {
        self.temp = temp;
        self.feelsLike = feelsLike;
        self.tempMax = tempMax;
        self.tempMin = tempMin;
        self.pressure = pressure;
        self.humidity = humidity;
        self.seaLevel = seaLevel;
        self.grndLevel = grndLevel;
    }
    return self;
}

- (void)printOut{
    NSLog(@"temp: %f", self.temp);
    NSLog(@"feelLike: %f", self.feelsLike);
    NSLog(@"tempMax: %f", self.tempMax);
    NSLog(@"tempMin: %f", self.tempMin);
    NSLog(@"humidity: %ld", (long)self.humidity);
    NSLog(@"seaLevel: %ld",(long)self.seaLevel);
    NSLog(@"grndLevel: %ld", (long)self.grndLevel);
}

@end
