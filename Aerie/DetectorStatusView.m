
#import "DetectorStatusView.h"

@interface DetectorStatusView ()
@property (weak, nonatomic) IBOutlet UILabel *roomLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UIButton *call911button;
@property (weak, nonatomic) IBOutlet UIButton *emergencyContactsButton;
@property (weak, nonatomic) IBOutlet UIButton *turnOffAlarmButton;

@property (weak, nonatomic) IBOutlet UIButton *backButton;

@end

@implementation DetectorStatusView

-(void)setDetectorViewModel:(DetectorViewModel *)detectorViewModel {
    self.roomLabel.text = detectorViewModel.roomNameString;
    self.backgroundColor = detectorViewModel.backgroundColor;
    self.statusLabel.text = detectorViewModel.status;
    if ([detectorViewModel.status isEqualToString:@"Normal"]) {
        self.call911button.hidden = YES;
        self.emergencyContactsButton.hidden = YES;
        self.turnOffAlarmButton.hidden = YES;
    }
}

- (IBAction)backButton:(id)sender {
    [self.delegate backButtonTapped];
}

- (IBAction)call911Tapped:(id)sender {
}

- (IBAction)emergencyContactsButtonTapped:(id)sender {
}

- (IBAction)turnOffAlarmButtonTapped:(id)sender {
}

@end
