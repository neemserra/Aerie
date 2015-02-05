#import <UIKit/UIKit.h>
#import "DetectorViewModel.h"

@protocol DetectorStatusViewDelegate <NSObject>

-(void)backButtonTapped;

@end

@interface DetectorStatusView : UIView

-(void)setDetectorViewModel:(DetectorViewModel *)detectorViewModel;
@property (nonatomic, weak) id<DetectorStatusViewDelegate> delegate;

@end
