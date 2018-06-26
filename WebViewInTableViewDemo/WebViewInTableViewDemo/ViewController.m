//
//  ViewController.m
//  WebViewInTableViewDemo
//
//  Created by Yun CHEN on 2018/6/20.
//  Copyright © 2018年 Yun CHEN. All rights reserved.
//

#import "ViewController.h"
#import "WebViewTableViewCell.h"
#import "DataModel.h"
#import "MJRefresh.h"
#import "Reachability.h"


@interface ViewController () <UITableViewDelegate,UITableViewDataSource,WebViewTableViewCellDelegate> {
    BOOL loaded;
    UIAlertController *reachabilityAlertController;
}

@property(nonatomic,strong) NSArray<DataModel *> *datasource;
@property (nonatomic) Reachability *internetReachability;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Check the network reachability
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    self.internetReachability = [Reachability reachabilityForInternetConnection];
    [self.internetReachability startNotifier];
    [self updateInterfaceWithReachability:self.internetReachability];

    // Set TableView
    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf loadData];
        [self.tableView.mj_header endRefreshing];
    }];
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    // Start loading data
    if (!loaded) {
        loaded = YES;
        [self loadData];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadData {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"Questions" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    NSArray *contents = [json objectForKey:@"data"];
    
    self.datasource = [DataModel parseDictionaries:contents];
    [self.tableView reloadData];
}


#pragma mark - Network Reachability
- (void)reachabilityChanged:(NSNotification *)note {
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    [self updateInterfaceWithReachability:curReach];
}

- (void)updateInterfaceWithReachability:(Reachability *)reachability {
    if (reachability.currentReachabilityStatus != NotReachable) {
        [reachabilityAlertController dismissViewControllerAnimated:NO completion:nil];
        [self loadData];
    }
    else{
        reachabilityAlertController = [UIAlertController alertControllerWithTitle:NSLocalizedString(@"No connection available, images might not be displayed",nil)
                                                                          message:NSLocalizedString(@"Give the access in \"Settings\" if the iPhone is internet reachable",nil) preferredStyle:UIAlertControllerStyleAlert];
        [reachabilityAlertController addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"OK",nil) style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {}]];
        [self presentViewController:reachabilityAlertController animated:YES completion:nil];
    }
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.datasource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.datasource[indexPath.row].contentHeight <= 0 ? 200 : self.datasource[indexPath.row].contentHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    WebViewTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"webViewTableViewCell" forIndexPath:indexPath];
    cell.model = self.datasource[indexPath.row];
    cell.delegate = self;
    return cell;
}


#pragma mark - WebViewTableViewCellDelegate
-(void)webViewTableViewCell:(WebViewTableViewCell *)cell {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    if (indexPath != nil) {
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}


@end
