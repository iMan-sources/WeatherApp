//
//  HomeViewController.m
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/20/22.
//

#import "HomeViewController.h"
#import "HomeViewModel.h"
#import "HomeContentTableViewCell.h"
#import "HomeContentHeaderViewCell.h"
#import "HomeContentFooterViewCell.h"
#import "ViewControllerIdentifiers.h"
#import "ForecastViewController.h"
#import "SettingsViewController.h"
 #import "AlertController.h"
#import "UserDefaultsNames.h"

@interface HomeViewController ()
@property (weak, nonatomic) IBOutlet UITableView *contentTableView;
@property (strong, nonatomic) HomeViewModel *viewModel;
@property (strong, nonatomic) NSString *currentCity;
@property (strong, nonatomic) AlertController *alertCity;
@property (strong, nonatomic) NSUserDefaults *userDefaults;
@end

@implementation HomeViewController

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setup];
    [self layout];
}

#pragma mark - API



#pragma mark - Action
-(void) didSettingsButtonTapped: (UIButton *)sender{
    NSString *storyboardName = [ViewControllerIdentifiers getStoryboardName];
    NSString *settingsVCIdentifier = [ViewControllerIdentifiers getSettingsVCIdentifier];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    SettingsViewController *settingsVC = [storyboard instantiateViewControllerWithIdentifier:settingsVCIdentifier];
    
    settingsVC.delegate = self;
    
    [self.navigationController pushViewController:settingsVC animated:true];
}


#pragma mark - Helpers


-(void) checkHavingCurrentCity{
    
    self.alertCity = [[AlertController alloc]init];

    //check current city existed
    BOOL isCityAvailable = [self.viewModel checkCityAvailable];
    
    if (!isCityAvailable) {
        [self.alertCity showAlertRequestNewcity:self success:^(NSString * _Nonnull cityName) {
            self.currentCity = cityName.lowercaseString;

            [self.viewModel insertCityToCityNamesUserDefault:self.currentCity];

            [self.viewModel replaceCityNameInUserDefault:cityName];

            [self fetchCurrentWeather];
        }];
    }else{
        self.currentCity = [self.viewModel getCity];
        [self fetchCurrentWeather];
    }
    
}

-(void) setup{
    [self configViewModel];
    self.view.backgroundColor = [UIColor systemBlueColor];
    
    [self configNavigationBar];
    
    [self checkHavingCurrentCity];
    
    [self fetchCurrentWeather];

    [self configTableView];
}

-(void) configNavigationBar{
    self.title = @"Weather";
    [self configBarButon];
    
}

-(void) configCityName{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    //check if userdefault exists
    NSString *currentCity = [userDefaults objectForKey: [UserDefaultsNames getCurrentCity]];

    self.currentCity = currentCity;
}

-(void) configBarButon{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(didSettingsButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [button setTitle:@"Settings" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
    
    UIBarButtonItem *settingButton = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = settingButton;
    
}

-(void) configViewModel{
    self.viewModel = [[HomeViewModel alloc] init];
}

-(void) fetchCurrentWeather{
    __weak HomeViewController *weakSelf = self;
    
    [self.viewModel getCurrentWeatherAPI:self.currentCity success:^(Weather * _Nonnull weather) {
        dispatch_sync(dispatch_get_main_queue(), ^{
            //tableview reload
  
            [weakSelf.contentTableView reloadData];
        });
    } error:^(NSError * _Nonnull error) {
        NSString *errorMsg = [error localizedDescription];
        dispatch_sync(dispatch_get_main_queue(), ^{
            [weakSelf.alertCity showNetworkErrorAlert:self withErrorMessage:errorMsg completionHandler:^(NSNull * _Nonnull null) {
            }];
        });

    }];
}

-(void) layout{
    
}

-(void) configTableView{
    [self.contentTableView registerNib:[UINib nibWithNibName:[HomeContentTableViewCell getNibName] bundle:nil] forCellReuseIdentifier:[HomeContentTableViewCell getReuseIdentifier]];
    
    [self.contentTableView registerNib:[UINib nibWithNibName:[HomeContentHeaderViewCell getNibName] bundle:nil] forHeaderFooterViewReuseIdentifier:[HomeContentHeaderViewCell getReuseIdentifier]];
    
    [self.contentTableView registerNib:[UINib nibWithNibName:[HomeContentFooterViewCell getNibName] bundle:nil] forHeaderFooterViewReuseIdentifier:[HomeContentFooterViewCell getReuseIdentifier]];
    
    self.contentTableView.delegate = self;
    self.contentTableView.dataSource = self;
    self.contentTableView.rowHeight = 60.0;
    self.contentTableView.backgroundColor = [UIColor clearColor];
    
}


#pragma mark - Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (void)didForecastButtonTapped{
    NSString *storyboardName = [ViewControllerIdentifiers getStoryboardName];
    NSString *forecastVCIdentifier = [ViewControllerIdentifiers getForecastVCIdentifier];
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle: nil];
    ForecastViewController *forecastVC = [storyboard instantiateViewControllerWithIdentifier:forecastVCIdentifier];
    forecastVC.cityName = self.currentCity;
    [self.navigationController pushViewController:forecastVC animated:true];
}

- (void)didCityNameSelected:(NSString *)cityName{
    //update current city name
    [self.viewModel replaceCityNameInUserDefault:cityName];
    
    self.currentCity = [self.viewModel getCity];
    
    [self fetchCurrentWeather];
}

#pragma mark - Datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    NSInteger sections = [self.viewModel numberOfSections];
    return sections;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger rows = [self.viewModel numberOfRowsInSection:section];
    return rows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeContentTableViewCell *cell = (HomeContentTableViewCell *) [tableView dequeueReusableCellWithIdentifier:[HomeContentTableViewCell getReuseIdentifier] forIndexPath:indexPath];
    WeatherFeature feature = [self.viewModel featureForCellAtIndexPath:indexPath];
    Weather *weather = [self.viewModel WeatherForCellAtIndexPath:indexPath];
    [cell bindingData:feature withWeather: weather];
    
    return cell;
}
//header
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    HomeContentHeaderViewCell *headerCell = (HomeContentHeaderViewCell *) [tableView dequeueReusableHeaderFooterViewWithIdentifier:[HomeContentHeaderViewCell getReuseIdentifier]];
    NSString *cityName = [self.viewModel getCity];
    [headerCell bindingData:cityName];
    
    return headerCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CGFloat height = [HomeContentHeaderViewCell getRowHeight];
    
    return height;
}

//footer

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    HomeContentFooterViewCell *footerCell = (HomeContentFooterViewCell *) [tableView dequeueReusableHeaderFooterViewWithIdentifier:[HomeContentFooterViewCell getReuseIdentifier]];
    footerCell.delegate = self;
    return footerCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    CGFloat height = [HomeContentFooterViewCell getRowHeight];

    return height;
}

@end
