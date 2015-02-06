#import <UIKit/UIKit.h>
#import "DetectorViewModel.h"

@interface DetectorCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UIImageView *addimage;
-(void)setRoomViewModel:(DetectorViewModel *)room;

@end