//
//  HomeViewModel.h
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/20/22.
//

#import <Foundation/Foundation.h>
#import "Weather.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSInteger, WeatherFeature){
    temp,
    humid,
    maxTemp,
    minTemp,
    winspeed
};
@interface HomeViewModel : NSObject
-(void) getCurrentWeatherAPI: (NSString *)cityName success:(void(^)(Weather *weather))successCompletion error: (void(^)(NSError *error))errorCompletion;
-(NSInteger) numberOfSections;
-(NSInteger) numberOfRowsInSection:(NSInteger)section;
-(WeatherFeature) featureForCellAtIndexPath: (NSIndexPath *)indexPath;

-(Weather *) WeatherForCellAtIndexPath:(NSIndexPath *)indexPath;
-(BOOL) checkCityAvailable;
-(NSString *) getCity;
-(void)insertCityToCityNamesUserDefault: (NSString *)city;

-(void) replaceCityNameInUserDefault: (NSString *)city;
@end

NS_ASSUME_NONNULL_END
