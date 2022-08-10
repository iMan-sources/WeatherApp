//
//  Message.h
//  WeatherForecast
//
//  Created by AnhLe on 23/07/2022.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Message : NSObject
@property(nonatomic, assign) NSInteger cod;
@property(nonatomic, strong) NSString *message;

-(instancetype) initWithCod: (NSInteger) cod withMessage: (NSString *) message;

@end

NS_ASSUME_NONNULL_END
