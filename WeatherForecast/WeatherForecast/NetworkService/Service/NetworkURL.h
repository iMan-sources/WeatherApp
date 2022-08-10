//
//  NetworkURL.h
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/20/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger, ApiDomain){
    weather,
    forecast
};

@interface NetworkURL : NSObject

+(NSString *) getWeatherURL: (ApiDomain) domain;
@end

NS_ASSUME_NONNULL_END
