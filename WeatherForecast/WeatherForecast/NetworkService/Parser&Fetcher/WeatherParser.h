//
//  WeatherParser.h
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/20/22.
//

#import <Foundation/Foundation.h>
#import "Weather.h"
@protocol WeatherParserProtocol <NSObject>
-(void) parseCurrentWeather:(NSData *)data withSuccess: (void (^)(Weather *weather)) successCompletion error: (void (^)(NSError *error)) errorCompletion;

-(void) parseForecastWeather:(NSData *)data withSuccess: (void (^)(NSArray<Weather *> *weather)) successCompletion error: (void (^)(NSError *error)) errorCompletion;
@end

@interface WeatherParser : NSObject<WeatherParserProtocol>

@end
