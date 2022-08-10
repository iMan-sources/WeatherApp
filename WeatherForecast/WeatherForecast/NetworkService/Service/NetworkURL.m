//
//  NetworkURL.m
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/20/22.
//

#import "NetworkURL.h"

@interface NetworkURL()

@end
@implementation NetworkURL

+ (NSString *)getWeatherURL:(ApiDomain)domain{
    NSString *domainURL = @"https://api.openweathermap.org/data/2.5/";
    switch (domain) {
        case weather:
            return [[NSString alloc] initWithFormat:@"%@weather",domainURL];
        case forecast:
            return [[NSString alloc] initWithFormat:@"%@forecast",domainURL];

    }
    return @"";
}

@end
