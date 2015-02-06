#import "DetectorCollectionViewCell.h"

@interface DetectorCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *roomNameLabel;


@end

@implementation DetectorCollectionViewCell

-(void)setRoomViewModel:(DetectorViewModel *)room {
    self.roomNameLabel.text = room.roomNameString.length > 0 ? room.roomNameString : @"";
    self.backgroundColor = room.backgroundColor;
}


@end

