
#import "DetectorStatusView.h"

@interface DetectorStatusView ()
@property (weak, nonatomic) IBOutlet UILabel *roomLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;


@end

@implementation DetectorStatusView

-(void)setDetectorViewModel:(DetectorViewModel *)detectorViewModel {
    self.roomLabel.text = detectorViewModel.roomNameString;
    self.backgroundColor = detectorViewModel.backgroundColor;
    self.statusLabel.text = detectorViewModel.status;
}

@end
