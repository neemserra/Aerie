#import "DetectorViewModel.h"

@implementation DetectorViewModel

-(instancetype)initWithName:(NSString *)name status:(NSString *)status {
    self = [super init];
    if (self) {
        self.roomNameString = name;
        self.status = status;
    }
    return self;
}

@end
