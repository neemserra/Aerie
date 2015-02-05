#import "DetectorsCollectionView.h"
#import "DetectorsViewController.h"
#import "DetectorViewModel.h"
#import "DetectorStatusViewController.h"

@interface DetectorsViewController () <DetectorsCollectionViewDelegate, DetectorStatusViewControllerDelegate>

@property (weak, nonatomic) IBOutlet DetectorsCollectionView *detectorsCollectionView;
@property (nonatomic) DetectorViewModel *selectedDetectorViewModel;

@end

@implementation DetectorsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DetectorViewModel *livingRoom = [[DetectorViewModel alloc] initWithName:@"Living Room" status:@"Normal"];
    DetectorViewModel *diningRoom = [[DetectorViewModel alloc] initWithName:@"Dining Room" status:@"Normal"];
    DetectorViewModel *kitchen = [[DetectorViewModel alloc] initWithName:@"Kitchen" status:@"Smoke Detected!"];
    [self.detectorsCollectionView setRoomViewModels:@[livingRoom, diningRoom, kitchen]];
    self.detectorsCollectionView.collectionViewDelegate = self;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetectorStatusViewController *detectorStatusViewController = [segue destinationViewController];
    detectorStatusViewController.delegate = self;
    [detectorStatusViewController setDetectorViewModel:self.selectedDetectorViewModel];
}


-(void)cellTappedForRoom:(DetectorViewModel *)roomViewModel {
    self.selectedDetectorViewModel = roomViewModel;
    [self performSegueWithIdentifier:@"DetectorStatusViewController" sender:self];
}

-(void)backButtonTapped {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)addNewRoomTapped {
    
}

@end
