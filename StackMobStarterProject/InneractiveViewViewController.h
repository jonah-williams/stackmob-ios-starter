//
//  InneractiveViewViewController.h
//  StackMobStarterProject
//
//  Created by Douglas Rapp on 5/9/12.
//  Copyright (c) 2012 StackMob. All rights reserved.
//

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