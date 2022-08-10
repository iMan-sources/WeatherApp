//
//  CityAlertController.m
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/22/22.
//

#import "AlertController.h"
#import "UserDefaultsNames.h"
@implementation AlertController

- (void)showAlertRequestNewcity:(nonnull UIViewController *)vc success:(nonnull void (^)(NSString * _Nonnull))successComletion {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    //check if userdefault exists
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"City name";
    }];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSString *textFromTF = [[alertController textFields][0] text];
        if (![textFromTF isEqualToString:@""]) {
            successComletion(textFromTF);
        }
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    
    [alertController addAction: confirmAction];
    [alertController addAction:cancelAction];
    
    [vc presentViewController:alertController animated:true completion:nil];
}

- (void)showNetworkErrorAlert:(nonnull UIViewController *)vc withErrorMessage:(nonnull NSString *)message completionHandler:(nonnull void (^)(NSNull * _Nonnull))completion {
    NSString *errorMessage = [NSString stringWithFormat:@"%@", message];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Error" message:errorMessage preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    
    [alertController addAction:confirmAction];
    
    [vc presentViewController:alertController animated:true completion:nil];
}







@end
