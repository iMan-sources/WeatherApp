//
//  mainJSON.h
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/20/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MainJSON : NSObject
@property (nonatomic, assign) double temp;
@property (nonatomic, assign) double feelsLike;
@property (nonatomic, assign) double tempMin;
@property (nonatomic, assign) double tempMax;
@property (nonatomic, assign) NSInteger pressure;
@property (nonatomic, assign) NSInteger humidity;
@property (nonatomic, assign) NSInteger seaLevel;
@property (nonatomic, assign) NSInteger grndLevel;
-(instancetype ) initWithTemp: (double)temp withFeelsLike: (double)feelsLike withTempMin: (double)tempMin withTempMax: (double)tempMax withPressure: (NSInteger)pressure withHumidity: (NSInteger)humidity withSeaLevel: (NSInteger)seaLevel withGrndLevel: (NSInteger)grndLevel;

-(void) printOut;

@end

NS_ASSUME_NONNULL_END
