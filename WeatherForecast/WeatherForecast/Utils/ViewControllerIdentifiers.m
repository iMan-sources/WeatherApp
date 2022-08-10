//
//  ViewControllerIdentifiers.m
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/21/22.
//

#import "ViewControllerIdentifiers.h"

@implementation ViewControllerIdentifiers

+ (NSString *)getStoryboardName{
    return @"Main";
}

+ (NSString *)getForecastVCIdentifier{
    return @"ForecastViewControllerID";
}


+ (NSString *)getSettingsVCIdentifier{
    return @"SettingsViewControllerID";
}

+ (NSString *)getHomeVCIdentifier{
    return @"HomeViewControllerID";
}
@end
