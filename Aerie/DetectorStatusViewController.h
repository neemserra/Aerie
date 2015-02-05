#import <UIKit/UIKit.h>
#import "DetectorViewModel.h"

@protocol DetectorStatusViewControllerDelegate <NSObject>

-(void)backButtonTapped;

@end

@interface DetectorStatusViewController : UIViewController

-(void)setDetectorViewModel:(DetectorViewModel *)detectorViewModel;
@property (nonatomic, weak) id<DetectorStatusViewControllerDelegate> delegate;
@end
