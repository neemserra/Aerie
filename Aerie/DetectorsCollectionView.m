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
    return self.roomViewModels.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return [collectionView dequeueReusableCellWithReuseIdentifier:kCellIdentifier forIndexPath:indexPath];
}

-(void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    DetectorViewModel *detector = self.roomViewModels[indexPath.row];
    DetectorCollectionViewCell *itemCell = (DetectorCollectionViewCell *)cell;
    [itemCell setRoomViewModel:detector];
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.frame.size.width / 2 - 20, self.frame.size.width / 2 - 20);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    DetectorViewModel *detector = self.roomViewModels[indexPath.row];
    [self.collectionViewDelegate cellTappedForRoom:detector];
}

@end

