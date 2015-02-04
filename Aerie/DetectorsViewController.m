#import "DetectorsCollectionView.h"
#import "DetectorsViewController.h"
#import "DetectorViewModel.h"
#import "DetectorStatusViewController.h"

@interface DetectorsViewController () <DetectorsCollectionViewDelegate>

@property (weak, nonatomic) IBOutlet DetectorsCollectionView *detectorsCollectionView;
@property (nonatomic) DetectorViewModel *selectedDetectorViewModel;

@end

@implementation DetectorsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DetectorViewModel *livingRoom = [[DetectorViewModel alloc] initWithName:@"Living Room" status:@"Normal"];
    DetectorViewModel *bedroom = [[DetectorViewModel alloc] initWithName:@"Bed Room" status:@"Normal"];
    [self.detectorsCollectionView setRoomViewModels:@[livingRoom, bedroom]];
    self.detectorsCollectionView.collectionViewDelegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetectorStatusViewController *detectorStatusViewController = [segue destinationViewController];
    [detectorStatusViewController setDetectorViewModel:self.selectedDetectorViewModel];
}


-(void)cellTappedForRoom:(DetectorViewModel *)roomViewModel {
    self.selectedDetectorViewModel = roomViewModel;
    [self performSegueWithIdentifier:@"DetectorStatusViewController" sender:self];
}

-(void)addNewRoomTapped {
    
}

@end
