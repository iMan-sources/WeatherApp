//
//  WeatherFetcher.h
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/20/22.
//
#import "Weather.h"
#import <Foundation/Foundation.h>
#import "NetworkService.h"
#import "WeatherParser.h"
#pragma mark - Protocol

@protocol WeatherFetcherProtocol <NSObject>
-(void)fetcherCurrentWeatherWithSucess: (NSString *)cityName success: (void (^)(Weather *weathers)) successCompletion error: (void (^)(NSError *error)) errorCompletion;

-(void)fetcherForecastWeatherWithSuccess: (NSString *)cityName success: (void (^)(NSArray<Weather *> *weathers)) successCompltion error: (void(^)(NSError *error)) errorCompletion;
@end
#pragma mark - Init
@interface WeatherFetcher : NSObject<WeatherFetcherProtocol>
-(instancetype) initWithClient: (id<NetworkServiceProtocol>)client withParser: (id<WeatherParserProtocol>)parser;
@end

