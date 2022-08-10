//
//  ForecastViewModel.h
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/21/22.
//

#import <Foundation/Foundation.h>


#import "Weather.h"

NS_ASSUME_NONNULL_BEGIN

@interface ForecastViewModel : NSObject

-(void) getForecastWeatherArrayWithSuccess: (void(^)(NSArray<Weather *> *weather)) successCompletion error: (void(^) (NSError *error)) errorCompletion;

-(NSInteger) numberOfSections;
-(NSInteger) numberOfRowsInSection:(NSInteger)section;

-(instancetype) initWithCityName: (NSString *)cityName;
-(Weather *) cellForRowAtIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
