//
//  AppDelegate.m
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/20/22.
//

#import "AppDelegate.h"
#import "UserDefaultsNames.h"
#import "AlertController.h"
#import "HomeViewController.h"
#import "ViewControllerIdentifiers.h"

@interface AppDelegate ()

@end
@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self checkCityArrayInUserDefaultExist];
//
    [self configCurrentCity];
//    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
//    [userDefaults removeObjectForKey: [UserDefaultsNames getCityNames]];
//    [userDefaults removeObjectForKey: [UserDefaultsNames getCurrentCity]];
//
//    NSLog(@"removed");
    [self configNavBarByVersion];
    return YES;
}

-(void) checkCityArrayInUserDefaultExist{
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //check if userdefault exists
    NSArray *arrayOfCityName = [userDefaults arrayForKey: [UserDefaultsNames getCityNames]];
    NSLog(@"%ld", arrayOfCityName.count);
    if (arrayOfCityName == nil) {
        NSArray *cityName = @[];
        [userDefaults setObject:cityName forKey:[UserDefaultsNames getCityNames]];
    }
}

-(void) configCurrentCity{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //check if userdefault exists
    NSString *currentCity = [userDefaults objectForKey: [UserDefaultsNames getCurrentCity]];
    
    if (currentCity == nil) {
        currentCity = @"";
        [userDefaults setObject:currentCity forKey:[UserDefaultsNames getCurrentCity]];
    }
    
}

-(void) configNavBarByVersion{
    if (@available(iOS 15.0, *)) {
        UINavigationBarAppearance *navBarAppearance = [[UINavigationBarAppearance alloc] init];
        [navBarAppearance configureWithOpaqueBackground];
//        navBarAppearance.backgroundColor = [UIColor systemBlueColor];
        [UINavigationBar appearance].standardAppearance = navBarAppearance;
        [UINavigationBar appearance].scrollEdgeAppearance = navBarAppearance;
    }
}

#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
