//
//  ForecastViewController.m
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/21/22.
//

#import "ForecastViewController.h"
#import "ForecastTableViewCell.h"
#import "ForecastViewModel.h"
@interface ForecastViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) ForecastViewModel *viewModel;
@end

@implementation ForecastViewController


#pragma mark - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setup];
    [self layout];
    
}


#pragma mark - API

-(void) fetchForecastWeatherArray{
    __weak ForecastViewController *weakSelf = self;
    [self.viewModel getForecastWeatherArrayWithSuccess:^(NSArray<Weather *> * _Nonnull weathers) {
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            [weakSelf.tableView reloadData];
        });
        
    } error:^(NSError * _Nonnull error) {
        NSLog(@"%@", error);
    }];
}

#pragma mark - Helpers

-(void) setup{
    self.view.backgroundColor = [UIColor systemBlueColor];
    [self configTableView];
    [self configViewModel:self.cityName];
    [self fetchForecastWeatherArray];
}


-(void) configNavBar{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

-(void) configViewModel: (NSString *) cityName{
    self.viewModel = [[ForecastViewModel alloc] initWithCityName:cityName];
}

-(void) layout{
    
}

-(void) configTableView{
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:[ForecastTableViewCell getNibName] bundle:nil] forCellReuseIdentifier:[ForecastTableViewCell getReuseIdentifier]];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = [ForecastTableViewCell getRowHeight];
}

#pragma mark - Delegate

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
    ForecastTableViewCell *cell = (ForecastTableViewCell *)[tableView dequeueReusableCellWithIdentifier:[ForecastTableViewCell getReuseIdentifier] forIndexPath:indexPath];
    Weather *weather = [self.viewModel cellForRowAtIndexPath:indexPath];
    [cell bindingData:weather];
    return cell;
}

@end

