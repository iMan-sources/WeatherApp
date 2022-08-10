//
//  Message.m
//  WeatherForecast
//
//  Created by AnhLe on 23/07/2022.
//

#import "Message.h"

@implementation Message

- (instancetype)initWithCod:(NSInteger)cod withMessage:(NSString *)message{
    if (self = [super init]) {
        self.message = message;
        self.cod = cod;
    }
    return self;
}
@end
