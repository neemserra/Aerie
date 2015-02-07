#import <Parse/Parse.h>
#import "AppDelegate.h"
#import "DetectorViewModel.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [Parse setApplicationId:@"hDYfKAEThkm2emN2IBpnGpWOizlz6o7lypTbHkJs"
                  clientKey:@"7Oun0l803ROnfeQBvDzL4hBYvZaZSbzMNBzxPpuY"];
    // Register for Push Notitications
    UIUserNotificationType userNotificationTypes = (UIUserNotificationTypeAlert |
                                                    UIUserNotificationTypeBadge |
                                                    UIUserNotificationTypeSound);
    UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:userNotificationTypes
                                                                             categories:nil];
    [application registerUserNotificationSettings:settings];
    [application registerForRemoteNotifications];
    
    DetectorViewModel *livingRoom = [[DetectorViewModel alloc] initWithName:@"Living Room" status:@"Normal"];
    DetectorViewModel *diningRoom = [[DetectorViewModel alloc] initWithName:@"Dining Room" status:@"Normal"];
    DetectorViewModel *kitchen = [[DetectorViewModel alloc] initWithName:@"Kitchen" status:@"Normal"];
    self.detectors = [NSMutableArray arrayWithArray:@[livingRoom, diningRoom, kitchen]];
    
    NSDictionary *notificationPayload = launchOptions[UIApplicationLaunchOptionsRemoteNotificationKey];
    if(notificationPayload) {
        NSString *message = [notificationPayload objectForKey:@"alert"];
        if ([message containsString:@"Living"]) {
            self.detectors[0] = [[DetectorViewModel alloc] initWithName:@"Living Room" status:@"Smoke detected!"];
        } else if ([message containsString:@"Dining"]) {
            self.detectors[1] = [[DetectorViewModel alloc] initWithName:@"Dining Room" status:@"Smoke Detected!"];
        } else if ([message containsString:@"Kitchen"]) {
            self.detectors[2] = [[DetectorViewModel alloc] initWithName:@"Kitchen" status:@"Smoke Detected!"];
        }
    }
    
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor lightGrayColor] }
                                             forState:UIControlStateNormal];
    [[UITabBarItem appearance] setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor whiteColor] }
                                             forState:UIControlStateSelected];
    [[UITabBar appearance] setTintColor:[UIColor whiteColor]];

    
    return YES;
}

- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    // Store the deviceToken in the current installation and save it to Parse.
    PFInstallation *currentInstallation = [PFInstallation currentInstallation];
    [currentInstallation setDeviceTokenFromData:deviceToken];
    [currentInstallation saveInBackground];
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    [PFPush handlePush:userInfo];
    NSString *message = [userInfo objectForKey:@"alert"];
    if ([message containsString:@"Living"]) {
        self.detectors[0] = [[DetectorViewModel alloc] initWithName:@"Living Room" status:@"Smoke detected!"];
    } else if ([message containsString:@"Dining"]) {
        self.detectors[1] = [[DetectorViewModel alloc] initWithName:@"Dining Room" status:@"Smoke Detected!"];
    } else if ([message containsString:@"Kitchen"]) {
        self.detectors[2] = [[DetectorViewModel alloc] initWithName:@"Kitchen" status:@"Smoke Detected!"];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
