//
//  NSString+NSString_Extention.m
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/21/22.
//

#import "NSString+NSString_Extention.h"

@implementation NSString (NSString_Extention)
+ (NSString *)formatterDate: (NSString *) day{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormatter dateFromString: day];
    
    [dateFormatter setDateFormat:@"MM-dd"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    return dateString;

}
@end
