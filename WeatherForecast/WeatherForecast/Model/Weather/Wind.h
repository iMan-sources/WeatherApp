//
//  Wind.h
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/20/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Wind : NSObject
@property (nonatomic, assign) double speed;
@property (nonatomic, assign) double deg;
@property (nonatomic, assign) double gust;

-(instancetype) initWithSpeed: (double)speed withDeg: (double)deg withGust: (double)gust;


-(void) printOut;
@end


NS_ASSUME_NONNULL_END
