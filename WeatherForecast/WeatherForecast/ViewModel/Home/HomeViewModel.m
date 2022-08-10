//
//  HomeViewModel.m
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/20/22.
//

#import "HomeViewModel.h"
#import "WeatherFetcher.h"
#import <UIKit/UIKit.h>
#import "UserDefaultsNames.h"

@interface HomeViewModel()
@property(strong, nonatomic) id<WeatherFetcherProtocol> currentWeatherFetcher;
@property(strong, nonatomic) Weather *currentWeather;
@property (strong, nonatomic) NSUserDefaults *userDefaults;
@property (strong, nonatomic) NSString *currentCity;

@end
@implementation HomeViewModel

- (instancetype)init{
    if (self = [super init]) {
        self.currentWeather = [[Weather alloc]init];
        self.currentWeatherFetcher  = [[WeatherFetcher alloc] initWithClient:[[NetworkService alloc]init] withParser:[[WeatherParser alloc] init]];
        
        self.userDefaults = [NSUserDefaults standardUserDefaults];
        self.currentCity = [self.userDefaults objectForKey: [UserDefaultsNames getCurrentCity]];
    }
    
    return self;
}

- (void)getCurrentWeatherAPI:(NSString *)cityName success:(void (^)(Weather * _Nonnull))successCompletion error:(void (^)(NSError * _Nonnull))errorCompletion{
    __weak HomeViewModel *weakSelf = self;
    
    [weakSelf.currentWeatherFetcher fetcherCurrentWeatherWithSucess:cityName success:^(Weather *weather) {
        self.currentWeather = weather;
        successCompletion(weather);
    } error:errorCompletion];
}

- (NSInteger)numberOfSections{
    return 1;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    return 5;
}
    
-(WeatherFeature) featureForCellAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger idx = indexPath.row;
    switch (idx) {
        case 0:
            return temp;
        case 1:
            return humid;
        case 2:
            return maxTemp;
        case 3:
            return minTemp;
        case 4:
            return winspeed;
    }
    return temp;
}

-(Weather *) WeatherForCellAtIndexPath:(NSIndexPath *)indexPath{
    return self.currentWeather;
}

-(BOOL) checkCityAvailable{
    //check if userdefault exists
    if ([self.currentCity isEqual:@""]) {
        return false;
    }
    return true;
}

-(NSString *) getCity{
    NSString *currentCity = [self.userDefaults objectForKey: [UserDefaultsNames getCurrentCity]];
    return currentCity;
}

-(void)insertCityToCityNamesUserDefault: (NSString *)city{
    //check if userdefault exists
    NSArray *arrayOfCityName = [self.userDefaults arrayForKey: [UserDefaultsNames getCityNames]];

    //get array -> convert to mutable array -> add new obj -> convert to array -> add Userdefault
    NSMutableArray *newArray = [[NSMutableArray alloc] initWithArray:arrayOfCityName];
    
    [newArray addObject:city];
    
    arrayOfCityName = [[NSArray alloc] initWithArray:newArray];
    //add object to userdefault
    [self.userDefaults setObject:arrayOfCityName forKey:[UserDefaultsNames getCityNames]];
    
}

- (void)replaceCityNameInUserDefault:(NSString *)city{
    [self.userDefaults setObject:city forKey:[UserDefaultsNames getCurrentCity]];
}

@end
