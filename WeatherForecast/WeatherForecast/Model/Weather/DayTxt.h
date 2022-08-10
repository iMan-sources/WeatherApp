//
//  Day.h
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/21/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DayTxt : NSObject
@property(assign, nonatomic) NSString *day;

-(instancetype) initWithDay: (NSString *) day;

-(void) printOut;
@end

NS_ASSUME_NONNULL_END
