#import "DetectorViewModel.h"

@implementation DetectorViewModel

-(instancetype)initWithName:(NSString *)name status:(NSString *)status {
    self = [super init];
    if (self) {
        self.roomNameString = name;
        self.status = status;
        if ([status isEqualToString:@"Normal"]) {
            self.backgroundColor = [UIColor colorWithRed:.455f green:.753f blue:.337f alpha:1.0f];
        } else {
            self.backgroundColor = [UIColor colorWithRed:.800f green:.125f blue:.184f alpha:1.0f];
        }
    }
    return self;
}

@end
