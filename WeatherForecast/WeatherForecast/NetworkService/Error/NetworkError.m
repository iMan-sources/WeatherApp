//
//  NetworkError.m
//  WeatherForecast
//
//  Created by AnhLe on 23/07/2022.
//

#import "NetworkError.h"


@interface NetworkError()
//@property(weak, nonatomic) NSError *notFoundError;
@end
@implementation NetworkError

+ (NSError *)localizedCustomError:(Message *)message{
    
    NSString *msg = [NSString stringWithFormat:@"%@", message.message];
    NSError *err = [[NSError alloc] initWithDomain:@"" code:message.cod userInfo:@{ NSLocalizedDescriptionKey:msg}];
    
    NSLog(@"%@", err);
    return err;
}


@end
