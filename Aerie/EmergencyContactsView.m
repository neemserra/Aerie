#import "EmergencyContactsView.h"

@interface EmergencyContactsView () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, copy) NSArray *contactsElements;
@end

@implementation EmergencyContactsView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.delegate = self;
    self.dataSource = self;
    

    self.contactsElements = @[@"Mom", @"Johnny Appleseed", @"Police Department", @"Fire Department"];
}

#pragma mark - DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return self.contactsElements.count + 1;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0 && indexPath.row < self.contactsElements.count) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ContactNameCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ContactNameCell"];
            cell.accessoryType = UITableViewCellAccessoryDetailButton;
            cell.tintColor = UIColor.redColor;
        }
        cell.textLabel.text = self.contactsElements[indexPath.row];
        return cell;
    } else if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"AddNumberCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"AddNumberCell"];
        }
        cell.textLabel.textColor = UIColor.redColor;
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.text = @"+ Add Number";
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FloorPlanCell"];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"FloorPlanCell"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        cell.textLabel.text = @"Floor Plan";
        return cell;
    }
    return nil;
}

#pragma mark - Delegate

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return (indexPath.section == 0 && indexPath.row < self.contactsElements.count);
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 1) {
        [self.observer floorPlanSelected];
    }
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath {
    [self.observer contactSelectedAtIndex:indexPath.row];
}

@end
