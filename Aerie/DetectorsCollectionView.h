#import <UIKit/UIKit.h>
#import "DetectorViewModel.h"

@protocol DetectorsCollectionViewDelegate <NSObject>

-(void)cellTappedForRoom:(DetectorViewModel *)roomViewModel;
-(void)addNewRoomTapped;

@end


@interface DetectorsCollectionView : UICollectionView

@property (nonatomic, weak) id<DetectorsCollectionViewDelegate> collectionViewDelegate;
-(void)setRoomViewModels:(NSArray *)roomViewModels;

@end