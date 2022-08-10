//
//  NetworkService.h
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/20/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
#pragma mark - Protocol
@protocol NetworkServiceProtocol <NSObject>


-(void) getUrl: (NSURL *)url withSuccess: (void(^)(NSData *response))successCompletion error: (void(^)(NSError *))errorCompletion;

@end

#pragma mark - Init
@interface NetworkService : NSObject<NetworkServiceProtocol>

@end

NS_ASSUME_NONNULL_END
