#import "DetectorStatusViewController.h"
#import "DetectorStatusView.h"

@interface DetectorStatusViewController ()

@property (nonatomic) DetectorViewModel *detectorViewModel;

@end

@implementation DetectorStatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = self.detectorViewModel.backgroundColor;
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

-(void)setDetectorViewModel:(DetectorViewModel *)detectorViewModel {
    _detectorViewModel = detectorViewModel;
    DetectorStatusView *view = (DetectorStatusView *)self.view;
    [view setDetectorViewModel:detectorViewModel];
}

@end
