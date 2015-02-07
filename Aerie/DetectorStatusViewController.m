#import "DetectorStatusViewController.h"
#import "DetectorStatusView.h"

@interface DetectorStatusViewController () <DetectorStatusViewDelegate>

@property (nonatomic) DetectorViewModel *detectorViewModel;

@end

@implementation DetectorStatusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = self.detectorViewModel.backgroundColor;
}

-(void)setDetectorViewModel:(DetectorViewModel *)detectorViewModel {
    _detectorViewModel = detectorViewModel;
    DetectorStatusView *view = (DetectorStatusView *)self.view;
    [view setDetectorViewModel:detectorViewModel];
    view.delegate = self;
}

-(void)backButtonTapped {
    [self.delegate backButtonTapped];
}

-(void)emergencyButtonTapped {
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.tabBarController setSelectedIndex:1];
}

@end
