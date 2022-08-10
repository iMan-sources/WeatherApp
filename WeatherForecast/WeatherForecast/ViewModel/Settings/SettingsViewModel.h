//
//  SettingsViewModel.h
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/22/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SettingsViewModel : NSObject
-(NSInteger) numberOfSections;
-(NSInteger) numberOfRowsInSection:(NSInteger)section;

-(void) getCityNameArray: (void (^)(NSArray *))successCompletion;
-(NSString *) cellForRowAtIndexPath:(NSIndexPath *)indexPath;

-(void)insertCityToCityNamesUserDefault: (NSString *)city;

-(void) reloadViewModel;

-(NSString *)didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
