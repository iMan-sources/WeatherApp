//
//  SettingsViewController.m
//  WeatherForecast
//
//  Created by AnhVT12.REC on 7/21/22.
//

#import "SettingsViewController.h"
#import "SettingsTableViewCell.h"
#import "SettingsHeaderTableViewCell.h"
#import "UserDefaultsNames.h"
#import "SettingsViewModel.h"
#import "AlertController.h"
@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) SettingsViewModel *viewModel;
@property (strong, nonatomic) AlertController *cityAlert;
@end

@implementation SettingsViewController

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configViewModel];
    [self setup];
    [self fetchData];
    
}

#pragma mark - Helpers

-(void) setup{
    [self configBarButon];
    
    self.view.backgroundColor = [UIColor systemBlueColor];
    [self configTableView];
    
    [self configCityAlert];
}

-(void) configTableView{
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerNib:[UINib nibWithNibName:[SettingsTableViewCell getNibName] bundle:nil] forCellReuseIdentifier:[SettingsTableViewCell getReuseIdentifier]];
    
    [self.tableView registerNib:[UINib nibWithNibName:[SettingsHeaderTableViewCell getNibName] bundle:nil] forHeaderFooterViewReuseIdentifier:[SettingsHeaderTableViewCell getReuseIdentifier]];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.rowHeight = [SettingsTableViewCell getRowHeight];
}

-(void) configCityAlert{
    self.cityAlert = [[AlertController alloc] init];
}

-(void) configBarButon{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:self action:@selector(didAddButtonTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    [button setTitle:@"Add" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor systemBlueColor] forState:UIControlStateNormal];
    
    UIBarButtonItem *settingButton = [[UIBarButtonItem alloc]initWithCustomView:button];
    self.navigationItem.rightBarButtonItem = settingButton;
    
}

-(void) configViewModel{
    self.viewModel = [[SettingsViewModel alloc] init];
}

#pragma mark - User Default

-(void) fetchData{
    
    __weak SettingsViewController *weakSelf = self;
    [self.viewModel getCityNameArray:^(NSArray * _Nonnull array) {
        
        [weakSelf.tableView reloadData];
        
    }];
}

#pragma mark - Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cityName = [self.viewModel didSelectRowAtIndexPath:indexPath];
    
    [self.delegate didCityNameSelected:cityName];
    
    //navigation
    [self.navigationController popViewControllerAnimated:YES];
    
    
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
    SettingsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[SettingsTableViewCell getReuseIdentifier] forIndexPath:indexPath];
    NSString *cityName = [self.viewModel cellForRowAtIndexPath:indexPath];
    [cell bindingData:cityName];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    SettingsHeaderTableViewCell *headerCell = (SettingsHeaderTableViewCell *) [tableView dequeueReusableHeaderFooterViewWithIdentifier:[SettingsHeaderTableViewCell getReuseIdentifier]];
    
    return headerCell;
}

#pragma mark - Action
-(void)didAddButtonTapped: (UIButton *) sender{
    
    __weak SettingsViewController *weakSelf = self;
    [self.cityAlert showAlertRequestNewcity:self success:^(NSString * _Nonnull cityName) {
        [self.viewModel insertCityToCityNamesUserDefault:cityName];
        
        [self.viewModel reloadViewModel];
        
        [weakSelf.tableView reloadData];
        
    }];
}


@end
