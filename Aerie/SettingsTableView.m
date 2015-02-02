#import "SettingsTableView.h"

@interface SettingsTableView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) NSArray *settings;

@end

@implementation SettingsTableView

- (void)awakeFromNib {
    self.delegate = self;
    self.dataSource = self;
    
    self.backgroundView = nil;
    self.backgroundColor = [UIColor clearColor];
    self.allowsSelection = NO;
    self.tableFooterView = [[UIView alloc] init];

    self.settings = @[@"Set Up", @"Passcode", @"Privacy", @"Legal"];
}

#pragma mark - UITableViewDelegate/DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.settings count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"settingsCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.textLabel.text = self.settings[indexPath.row];
    cell.textLabel.textColor = [UIColor darkGrayColor];
}

@end