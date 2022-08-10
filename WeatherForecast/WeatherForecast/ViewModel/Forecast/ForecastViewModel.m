//
//  ForecastViewModel.m
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/21/22.
//

#import "ForecastViewModel.h"
#import "WeatherFetcher.h"
#import <UIKit/UIKit.h>

@interface ForecastViewModel()
@property(nonatomic, strong) id<WeatherFetcherProtocol> currentWeatherFetcher;
@property(nonatomic, strong) NSArray<Weather *> *weatherArray;
@property(nonatomic, strong) NSString *cityName;
@end
@implementation ForecastViewModel


#pragma mark -Init

- (instancetype)initWithCityName:(NSString *)cityName{
    if (self = [super init]) {
        self.weatherArray = @[];
        self.currentWeatherFetcher  = [[WeatherFetcher alloc] initWithClient:[[NetworkService alloc]init] withParser:[[WeatherParser alloc] init]];
        self.cityName = cityName;
    }
    return self;
}


#pragma mark -API

- (void)getForecastWeatherArrayWithSuccess:(void (^)(NSArray<Weather *> * _Nonnull))successCompletion error:(void (^)(NSError * _Nonnull))errorCompletion{
    __weak ForecastViewModel *weakSelf = self;
    
    [weakSelf.currentWeatherFetcher fetcherForecastWeatherWithSuccess:self.cityName success:^(NSArray<Weather *> *weathers) {
        self.weatherArray = [self removeDuplicateInWeatherArray:weathers];
        successCompletion(self.weatherArray);
    } error:errorCompletion];
}

-(NSArray<Weather *>*) removeDuplicateInWeatherArray: (NSArray<Weather *> *) array{
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    NSMutableArray *newArray = [[NSMutableArray alloc]init];
    for (Weather *weather in array){
        NSString *key = weather.day.day;
        if (dictionary[key] != nil) {
            [dictionary setObject:weather forKey:key];
        }else{
            dictionary[key] = weather;
        }
    }
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        if (dictionary[key] != nil) {
            [newArray addObject:dictionary[key]];
        }
    }];
    //sorted array by day
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter  setDateFormat:@"MM-dd"];
    NSArray *sortedArray = [newArray sortedArrayUsingComparator:^NSComparisonResult(Weather *obj1, Weather *obj2) {
        NSDate *date_1 = [dateFormatter dateFromString: obj1.day.day];
        NSDate *date_2 = [dateFormatter dateFromString: obj2.day.day];
        
        return [date_1 compare:date_2];
    }];
    NSArray<Weather *> *arr = [[NSArray alloc] initWithArray:sortedArray];
    
    return arr;
}


#pragma mark -Helpers
- (NSInteger)numberOfSections{
    return 1;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    NSInteger rows = self.weatherArray.count;
    return rows;
}

- (Weather *)cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    Weather *weather = self.weatherArray[row];
    return weather;
}

@end
