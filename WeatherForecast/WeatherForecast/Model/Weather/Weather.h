//
//  Weather.h
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/20/22.
//

#import <Foundation/Foundation.h>
#import "MainJSON.h"
#import "Wind.h"
#import "DayTxt.h"
#import "Message.h"
@interface Weather : NSObject
@property (nonatomic, strong) MainJSON *mainJSON;
@property (nonatomic, assign) NSString *name;
@property (nonatomic, strong) Wind *wind;
@property(nonatomic, strong) DayTxt *day;
-(instancetype) initWithName: (NSString *)name withMain: (MainJSON *)mainJSON withWind: (Wind *)wind;
-(instancetype) initWithDay: (DayTxt *)day withMain: (MainJSON *)mainJSON;
@end

