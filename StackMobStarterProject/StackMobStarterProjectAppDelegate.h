//
//  StackMobStarterProjectAppDelegate.h
//  StackMobStarterProject
//
//  Created by Ty Amell on 12/15/11.
//  Copyright 2011 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InneractiveViewViewController.h"

@interface StackMobStarterProjectAppDelegate : UIResponder <UIApplicationDelegate, UIAlertViewDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) IBOutlet InneractiveViewViewController *viewController;

@end
