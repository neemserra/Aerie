#import "DetectorsCollectionView.h"
#import "DetectorsViewController.h"
#import "DetectorViewModel.h"

@interface DetectorsViewController () <DetectorsCollectionViewDelegate>

@property (weak, nonatomic) IBOutlet DetectorsCollectionView *detectorsCollectionView;

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)cellTappedForRoom:(DetectorViewModel *)roomViewModel {
    
}

-(void)addNewRoomTapped {
    
}

@end
