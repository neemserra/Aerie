#import "DetectorsCollectionView.h"
#import "DetectorCollectionViewCell.h"
#import "DetectorViewModel.h"

@interface DetectorsCollectionView () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic) NSArray *roomViewModels;

@end

@implementation DetectorsCollectionView

static NSString* const kCellIdentifier = @"DetectorCollectionViewCell";

- (void)awakeFromNib {
    self.delegate = self;
    self.dataSource = self;
    
    self.backgroundView = nil;
    self.backgroundColor = [UIColor clearColor];
    
    UINib *cellNib = [UINib nibWithNibName:@"DetectorCollectionViewCell" bundle:[NSBundle mainBundle]];
    [self registerNib:cellNib forCellWithReuseIdentifier:kCellIdentifier];
}

-(void)setRoomViewModels:(NSArray *)roomViewModels {
    _roomViewModels = roomViewModels;
    [self reloadData];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.roomViewModels.count + 1;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {

    DetectorCollectionViewCell *itemCell = (DetectorCollectionViewCell *)cell;

    if (indexPath.row < self.roomViewModels.count) {
        DetectorViewModel *detector = self.roomViewModels[indexPath.row];
        itemCell.addimage.hidden = YES;
        [itemCell setRoomViewModel:detector];
    } else {
        itemCell.backgroundColor = [UIColor clearColor];
        itemCell.layer.borderColor = [UIColor lightGrayColor].CGColor;
        itemCell.layer.borderWidth = 2.0f;
        [itemCell setRoomViewModel:nil];
        itemCell.addimage.hidden = NO;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.frame.size.width / 2 - 15, self.frame.size.width / 2 - 15);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.roomViewModels.count) {
        DetectorViewModel *detector = self.roomViewModels[indexPath.row];
        [self.collectionViewDelegate cellTappedForRoom:detector];
    } else {
        [self.collectionViewDelegate addNewRoomTapped];
    }
}

@end

