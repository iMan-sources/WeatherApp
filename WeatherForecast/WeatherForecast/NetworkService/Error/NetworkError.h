//
//  NetworkError.h
//  WeatherForecast
//
//  Created by AnhLe on 23/07/2022.
//

#import <Foundation/Foundation.h>
#import "Message.h"
NS_ASSUME_NONNULL_BEGIN

@interface NetworkError : NSObject

+(NSError *) localizedCustomError: (Message *)message;
@end

NS_ASSUME_NONNULL_END
