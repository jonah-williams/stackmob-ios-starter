//
//  StackMobStarterProjectAppDelegate.h
//  StackMobStarterProject
//
//  Created by Ty Amell on 12/15/11.
//  Copyright 2011 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StackMobStarterProjectAppDelegate : UIResponder <UIApplicationDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) UIWindow *window;

- (IBAction)iaAdRecieved:(id)sender;
- (IBAction)iaDefaultAdRecieved:(id)sender;
- (IBAction)iaAdFailed:(id)sender;
- (IBAction)iaAdClicked:(id)sender;
- (IBAction)iaAdWillShow:(id)sender;
- (IBAction)iaAdDidShow:(id)sender;
- (IBAction)iaAdWillHide:(id)sender;
- (IBAction)iaAdDidHide:(id)sender;
- (IBAction)iaAdWillClose:(id)sender;
- (IBAction)iaAdDidClose:(id)sender;
- (IBAction)iaAdWillResize:(id)sender;
- (IBAction)iaAdDidResize:(id)sender;
- (IBAction)iaAdWillExpand:(id)sender;
- (IBAction)iaAdDidExpand:(id)sender;
- (IBAction)iaAppShouldSuspend:(id)sender;
- (IBAction)iaAppShouldResume:(id)sender;

@end
