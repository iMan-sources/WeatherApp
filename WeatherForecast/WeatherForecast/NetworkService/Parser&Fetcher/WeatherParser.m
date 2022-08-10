//
//  WeatherParser.m
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/20/22.
//

#import "WeatherParser.h"
#import "Weather.h"
#import "NSString+NSString_Extention.h"
#import "NetworkError.h"

@implementation WeatherParser

- (void)parseCurrentWeather:(NSData *)data withSuccess:(void (^)(Weather *))successCompletion error:(void (^)(NSError *))errorCompletion {
    NSError *error;
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error: &error];
    
    
    //CHECK BASE ERROR THROWED BY DEVICES
    if (error || !jsonDictionary) {
        errorCompletion(error);
        return;
    }
    
    //CHECK API ERROR THROWED BY SERVER
    
    NSInteger cod = [[jsonDictionary objectForKey:@"cod"] integerValue];
    NSString *msg = [jsonDictionary objectForKey:@"message"];
    Message *message = [self generateMessageObj:cod withMessage:msg];
    
    if (message.cod > 201) {
        NSError *err = [NetworkError localizedCustomError:message];
        errorCompletion(err);
        return;
    }
    //get data from json
    NSString *name  = [jsonDictionary objectForKey:@"name"];
    NSDictionary *mainDictionary = [jsonDictionary objectForKey: @"main"];
    NSDictionary *windDictionary = [jsonDictionary objectForKey: @"wind"];
    //initialize Mains
    MainJSON *main = [self generateMainObj:mainDictionary];
    

    //initialize wind
    Wind *wind = [self generateWindObj:windDictionary];
    Weather *weather = [[Weather alloc] initWithName:name withMain:main withWind:wind];
    
    successCompletion(weather);
}


- (void)parseForecastWeather:(NSData *)data withSuccess:(void (^)(NSArray<Weather *> *))successCompletion error:(void (^)(NSError *))errorCompletion{
    
    NSError *error;
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    
    //CHECK BASE ERROR THROWED BY DEVICES
    if (error || !jsonDictionary) {
        errorCompletion(error);
        return;
    }
    
    //CHECK API ERROR THROWED BY SERVER
    
    NSInteger cod = [[jsonDictionary objectForKey:@"cod"] integerValue];
    NSString *msg = [jsonDictionary objectForKey:@"message"];
    Message *message = [self generateMessageObj:cod withMessage:msg];
    
    if (message.cod > 201) {
        NSError *err = [NetworkError localizedCustomError:message];
        errorCompletion(err);
        return;
    }
    
    
    NSArray *array = [jsonDictionary objectForKey:@"list"];
    NSMutableArray<Weather *> *forecastWeatherArray = [[NSMutableArray alloc] init];
    for(NSDictionary *item in array){
        NSDictionary *mainDictionary = [item objectForKey: @"main"];
        MainJSON *main = [self generateMainObj:mainDictionary];
        NSString *day = [item objectForKey:@"dt_txt"];
        DayTxt *dayTxt = [self generateDayTxTObj:day];
        Weather *weather = [[Weather alloc] initWithDay:dayTxt withMain:main];

        [forecastWeatherArray addObject:weather];
    }
    successCompletion(forecastWeatherArray);
    
}

#pragma mark - Helpers
-(MainJSON *) generateMainObj: (NSDictionary *)mainDictionary{
    double temp = [[mainDictionary objectForKey:@"temp"] doubleValue] / 10.0;
    double feel_like = [[mainDictionary objectForKey:@"feel_like"] doubleValue] ;
    double temp_min = [[mainDictionary objectForKey:@"temp_min"] doubleValue] / 10.0;
    double temp_max = [[mainDictionary objectForKey:@"temp_max"] doubleValue] / 10.0;
    int pressure = [[mainDictionary objectForKey:@"pressure"] intValue];
    int humidity = [[mainDictionary objectForKey:@"humidity"] intValue];
    int sea_level = [[mainDictionary objectForKey:@"sea_level"] intValue];
    int grnd_level = [[mainDictionary objectForKey:@"grnd_level"] intValue];
    MainJSON *main = [[MainJSON alloc] initWithTemp:temp withFeelsLike:feel_like withTempMin:temp_min withTempMax:temp_max withPressure:pressure withHumidity:humidity withSeaLevel:sea_level withGrndLevel:grnd_level];
    
    return main;
}

-(Wind *) generateWindObj: (NSDictionary *)windDictionary{
    double speed = [[windDictionary objectForKey:@"speed"] doubleValue];
    double deg = [[windDictionary objectForKey:@"deg"] doubleValue];
    double gust = [[windDictionary objectForKey:@"gust"] doubleValue];

    Wind *wind = [[Wind alloc]initWithSpeed:speed withDeg:deg withGust:gust];
    return wind;
}

-(DayTxt *) generateDayTxTObj: (NSString *) day{
    NSString *date = [NSString formatterDate:day];
    DayTxt *dayTxt = [[DayTxt alloc] initWithDay:date];
    return dayTxt;
}

-(Message *) generateMessageObj: (NSInteger)cod withMessage: (NSString *) msg{
    Message *message = [[Message alloc] initWithCod:cod withMessage:msg];
    return message;
}


@end
