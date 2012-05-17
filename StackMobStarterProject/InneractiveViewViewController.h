//
//  InneractiveViewViewController.h
//  StackMobStarterProject
//
//  Created by Douglas Rapp on 5/9/12.
//  Copyright (c) 2012 StackMob. All rights reserved.
//

/*
 
 The Inneractive View allows you to build an app with ads.  To see an example of the Inneractive View, go to StackMobStartProject-Info.plist and change the value of key "Main storyboard file base name" to InneractiveView.
 
 Change it back to MainStoryboard_iPhone to revert back to the original demo.
 
 */

#import <UIKit/UIKit.h>
#import "InneractiveAd.h"

@interface InneractiveViewViewController : UIViewController <UIAlertViewDelegate> {
    
}

- (IBAction)fullScreenAd:(id)sender;

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