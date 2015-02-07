#import "ContactDetailView.h"

@interface ContactDetailView ()
@property (nonatomic, weak) IBOutlet UILabel *nameLabel;
@property (nonatomic, weak) IBOutlet UILabel *phoneNumberLabel;
@property (nonatomic, weak) IBOutlet UILabel *emailLabel;
@property (nonatomic, weak) IBOutlet UILabel *addressLabel;
@end

@implementation ContactDetailView

- (void)setName:(NSString *)name {
    self.nameLabel.text = name;
}

- (void)setPhoneNumber:(NSString *)phoneNumber {
    self.phoneNumberLabel.text = phoneNumber;
}

- (void)setEmail:(NSString *)email {
    self.emailLabel.text = email;
}

- (void)setAddress:(NSString *)address {
    self.addressLabel.text = address;
}

@end
