//
//  Weather.m
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/20/22.
//

#import "Weather.h"
@implementation Weather


- (instancetype)initWithName:(NSString *)name withMain:(MainJSON *)mainJSON withWind:(Wind *)wind{
    if (self = [super init]) {
        self.name = name;
        self.mainJSON = mainJSON;
        self.wind = wind;
    }
    return self;
}

- (instancetype)initWithDay:(DayTxt *)day withMain:(MainJSON *)mainJSON{
    if (self = [super init]) {
        self.day = day;
        self.mainJSON = mainJSON;
    }
    return self;
}
@end
