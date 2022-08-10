//
//  NetworkService.m
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/20/22.
//

#import "NetworkService.h"
@interface NetworkService()
@property(strong, nonatomic) NSMutableDictionary *tasks;
@end

@implementation NetworkService

- (void)getUrl:(NSURL *)url withSuccess:(void (^)(NSData * _Nonnull))successCompletion error:(void (^)(NSError * _Nonnull))errorCompletion{
    //detect which task is running
    NSURLSessionTask *previousTask = [self.tasks objectForKey:url.absoluteURL];
    if (previousTask) {
        [previousTask cancel];
    }
    //call API
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSessionTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (error) {
            errorCompletion(error);
            return;
        }
        if (!data) {
            errorCompletion(error);
            return;
        }
        NSLog(@"%@", data);
        successCompletion(data);
    }];
    
    [task resume];
    [self.tasks setObject:task forKey:url.absoluteURL];
}

@end
