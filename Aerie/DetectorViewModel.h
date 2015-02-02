#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DetectorViewModel : NSObject

@property (nonatomic) NSString *roomNameString;
@property (nonatomic) UIColor *backgroundColor;
@property (nonatomic) NSString *status;

-(instancetype)initWithName:(NSString *)name status:(NSString *)status;

@end
