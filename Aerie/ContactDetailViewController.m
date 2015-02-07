#import "ContactDetailViewController.h"
#import "ContactDetailView.h"

@interface ContactDetailViewController ()
@property (nonatomic, copy) NSString *contact;
@end

@implementation ContactDetailViewController

- (instancetype)initWithContact:(NSString *)contact {
    self = [super init];
    self.contact = contact;
    self.navigationController.navigationBar.tintColor = UIColor.redColor;
    return self;
}

- (void)loadView {
    ContactDetailView *view = [[[NSBundle mainBundle] loadNibNamed:@"ContactDetailView" owner:self options:nil] firstObject];
    [view setName:self.contact];
    [view setEmail:[NSString stringWithFormat:@"%@@email.com", self.contact.lowercaseString]];
    [view setPhoneNumber:@"1 (314) 555-1212"];
    [view setAddress:@"435 Address Rd.\nSt. Louis, MO\nUnited States."];
    self.view = view;
}

@end
