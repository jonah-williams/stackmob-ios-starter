//
//  StackMobStarterProjectAppDelegate.m
//  StackMobStarterProject
//
//  Created by Ty Amell on 12/15/11.
//  Copyright 2011 StackMob. All rights reserved.
//

#import "StackMobStarterProjectAppDelegate.h"
#import "StackMob.h"
#import "InneractiveAd.h"

@implementation StackMobStarterProjectAppDelegate
@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    [[StackMob stackmob] startSession];
    //Uncomment for an example of displaying an ad with Inneractive
    //NSMutableDictionary *optionalParams = [[NSMutableDictionary alloc] init];
    //[optionalParams setObject:@"25" forKey:[NSNumber numberWithInt:Key_Age]];
    //[optionalParams setObject:@"642" forKey:[NSNumber numberWithInt:Key_Distribution_Id]];
    //if (![InneractiveAd DisplayAd:@"iOS_Test" withType:IaAdType_Banner withRoot:self.window withReload:120 withParams:optionalParams])
    //{
    // UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"This application is free but requires an internet connection." message:@"Please configure your connectivity settings and re-try." delegate:self cancelButtonTitle:@"Exit" otherButtonTitles:nil] autorelease];
    // [alert show];
    //}
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
    [[StackMob stackmob] endSession];
}
@end
