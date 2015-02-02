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
    DetectorViewModel *livingRoom = [[DetectorViewModel alloc] initWithName:@"Living Room" status:@"Normal"];
    DetectorViewModel *bedroom = [[DetectorViewModel alloc] initWithName:@"Bed Room" status:@"Normal"];
    self.roomViewModels = @[livingRoom, bedroom];
}

-(void)setRoomViewModels:(NSArray *)roomViewModels {
    _roomViewModels = roomViewModels;
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
        [itemCell setRoomViewModel:detector];
    } else {
        itemCell.backgroundColor = [UIColor clearColor];
        itemCell.layer.borderColor = [UIColor darkGrayColor].CGColor;
        itemCell.layer.borderWidth = 2.0f;
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.frame.size.width / 2 - 20, self.frame.size.width / 2 - 20);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row < self.roomViewModels.count) {
        DetectorViewModel *detector = self.roomViewModels[indexPath.row];
        [self.collectionViewDelegate cellTappedForRoom:detector];
    } else {
//display add a new detector view controller
    }
}

@end

