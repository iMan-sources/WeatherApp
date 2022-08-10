//
//  UserDefaultsNames.m
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/22/22.
//

#import "UserDefaultsNames.h"

@implementation UserDefaultsNames

+ (NSString *)getCityNames{
    return @"cityNames_userdefault";
}

+(NSString *) getCurrentCity{
    return @"currentCity_userdefault";
}

@end
