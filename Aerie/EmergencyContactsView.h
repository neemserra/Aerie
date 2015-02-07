#import <UIKit/UIKit.h>

@protocol EmergencyContactsViewDelegate <NSObject>

- (void)contactSelectedAtIndex:(NSInteger)index;
- (void)floorPlanSelected;

@end

@interface EmergencyContactsView : UITableView

@property (nonatomic, weak) id<EmergencyContactsViewDelegate> observer;

@end
