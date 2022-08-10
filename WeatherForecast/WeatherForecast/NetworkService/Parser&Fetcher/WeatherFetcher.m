//
//  WeatherFetcher.m
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/20/22.
//

#import "WeatherFetcher.h"
#import "NetworkURL.h"
#import "KeyAPI.h"
@interface WeatherFetcher()
@property(nonatomic, strong) id<WeatherParserProtocol> parser;
@property(nonatomic, strong) id<NetworkServiceProtocol> networkService;
@end

@implementation WeatherFetcher

- (instancetype)initWithClient:(id<NetworkServiceProtocol>)client withParser:(id<WeatherParserProtocol>)parser{
    if (self = [super init]) {
        self.parser = parser;
        self.networkService = client;
    }
    return self;
}

- (void)fetcherCurrentWeatherWithSucess:(NSString *)cityName success:(void (^)(Weather *))successCompletion error:(void (^)(NSError *))errorCompletion{
    __weak WeatherFetcher *weakSelf = self;
    NSString *urlString = [self generateURL:weather withCityName:cityName];
    NSURL *url = [NSURL URLWithString: urlString];
    
    void(^networkResponse)(NSData *) = ^(NSData *data){
        [weakSelf.parser parseCurrentWeather:data withSuccess:successCompletion error:errorCompletion];
    };
   
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND,0), ^{
        [weakSelf.networkService getUrl:url withSuccess:networkResponse error:errorCompletion];
    });
}

- (void)fetcherForecastWeatherWithSuccess:(NSString *)cityName success:(void (^)(NSArray<Weather *> *))successCompltion error:(void (^)(NSError *))errorCompletion{
    __weak WeatherFetcher *weakSelf = self;
    
    NSString *urlString = [self generateURL:forecast withCityName:cityName];
    NSURL *url = [NSURL URLWithString: urlString];
    
    void(^networkResponse)(NSData *) = ^(NSData *data){
        [weakSelf.parser parseForecastWeather:data withSuccess:successCompltion error:errorCompletion];
    };
    
    dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND,0), ^{
        [weakSelf.networkService getUrl:url withSuccess:networkResponse error:errorCompletion];
    });
}

-(NSString *) generateURL: (ApiDomain)domain withCityName: (NSString*) cityName{
    NSString *q = [[NSString alloc] initWithFormat:@"?q=%@", cityName];
    NSString *key = [[NSString alloc] initWithFormat:@"&appid=%@",[KeyAPI getKeyAPI]];
    
    NSString *prefix = [NetworkURL getWeatherURL:domain];
    NSString *urlString = [[NSString alloc]initWithFormat:@"%@%@%@", prefix, q,key];
    
    return urlString;
}

@end
