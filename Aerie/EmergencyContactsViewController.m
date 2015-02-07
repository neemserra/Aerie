#import "EmergencyContactsViewController.h"
#import "EmergencyContactsView.h"
#import "ContactDetailViewController.h"
#import "FloorPlanViewController.h"

@interface EmergencyContactsViewController () <EmergencyContactsViewDelegate>
@end

@implementation EmergencyContactsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [(EmergencyContactsView *)self.view setObserver:self];
    
    self.navigationController.navigationBar.tintColor = UIColor.redColor;
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    
    UITableView *tableView = (UITableView *)self.view;
    tableView.editing = editing;
}

#pragma mark -

- (void)contactSelectedAtIndex:(NSInteger)index {
    NSArray *contacts = @[@"Mom", @"Johnny Appleseed", @"Police Department", @"Fire Department"];
    ContactDetailViewController *cdvc = [[ContactDetailViewController alloc] initWithContact:contacts[index]];
    [self.navigationController pushViewController:cdvc animated:YES];
}

- (void)floorPlanSelected {
    FloorPlanViewController *fpvc = [[FloorPlanViewController alloc] init];
    [self.navigationController pushViewController:fpvc animated:YES];
}

@end
