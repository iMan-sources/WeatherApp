//
//  SettingsViewModel.m
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/22/22.
//

#import "SettingsViewModel.h"
#import "UserDefaultsNames.h"
#import <UIKit/UIKit.h>

@interface SettingsViewModel()
@property(strong, nonatomic) NSArray *cityNames;
@property (strong, nonatomic) NSUserDefaults *userDefaults;

@end
@implementation SettingsViewModel

- (instancetype)init{
    if (self = [super init]) {
        
        self.userDefaults = [NSUserDefaults standardUserDefaults];
        self.cityNames = [self getCityNamesFromUserDefault];

    }
    return self;
}

-(NSArray *)getCityNamesFromUserDefault{
    NSArray *arrayOfCityName = [self.userDefaults arrayForKey: [UserDefaultsNames getCityNames]];
    return arrayOfCityName;
}

- (NSInteger)numberOfSections{
    return 1;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section{
    
    return self.cityNames.count;
}

-(void)insertCityToCityNamesUserDefault: (NSString *)city{
    //check if userdefault exists
    NSArray *arrayOfCityName = [self.userDefaults arrayForKey: [UserDefaultsNames getCityNames]];;

    //get array -> convert to mutable array -> add new obj -> convert to array -> add Userdefault
    NSMutableArray *newArray = [[NSMutableArray alloc] initWithArray:arrayOfCityName];
    
    [newArray addObject:city];
    
    arrayOfCityName = [[NSArray alloc] initWithArray:newArray];
    
    //add object to userdefault
    [self.userDefaults setObject:arrayOfCityName forKey:[UserDefaultsNames getCityNames]];
}

- (void)getCityNameArray:(void (^)(NSArray * _Nonnull))successCompletion{
    
    successCompletion(self.cityNames);
}

- (NSString *)cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.cityNames.count <= 0) {
        return @"";
    }
    
    NSInteger row = indexPath.row;
    NSString *cityName = self.cityNames[row];
    
    return cityName;
    
}
-(void) reloadViewModel{
    self.cityNames = [self getCityNamesFromUserDefault];
}

- (NSString *)didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger row = indexPath.row;
    NSString *cityName = self.cityNames[row];
    return cityName;
}

@end
