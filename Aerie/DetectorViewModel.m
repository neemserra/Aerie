#import "DetectorViewModel.h"

@implementation DetectorViewModel

-(instancetype)initWithName:(NSString *)name status:(NSString *)status {
    self = [super init];
    if (self) {
        self.roomNameString = name;
        self.status = status;
        if ([status isEqualToString:@"Normal"]) {
            self.backgroundColor = [UIColor colorWithRed:134.0f/255.0f green:182.0f/255.0f blue:77.0/255.0f alpha:1.0f];
        } else {
            self.backgroundColor = [UIColor redColor];
        }
    }
    return self;
}

@end
