#import "DetectorsCollectionView.h"
#import "DetectorsViewController.h"
#import "DetectorViewModel.h"
#import "DetectorStatusViewController.h"
#import "AppDelegate.h"

@interface DetectorsViewController () <DetectorsCollectionViewDelegate, DetectorStatusViewControllerDelegate>

@property (weak, nonatomic) IBOutlet DetectorsCollectionView *detectorsCollectionView;
@property (nonatomic) DetectorViewModel *selectedDetectorViewModel;

@end

@implementation DetectorsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [self.detectorsCollectionView setRoomViewModels:appDelegate.detectors];
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
