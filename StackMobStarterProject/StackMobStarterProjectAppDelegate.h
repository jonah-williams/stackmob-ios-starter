//
//  StackMobStarterProjectAppDelegate.h
//  StackMobStarterProject
//
//  Created by Ty Amell on 12/15/11.
//  Copyright 2011 StackMob. All rights reserved.
//

/*
 
 The StackMob starter project offers a demo of using the StackMob service to perform basic CRUD operations.  Build and run the app to see!
 
 You can use the code provided as a basis for your project, but feel free to re-use any part of the code in your own application. Check out the online documentation to see everything the SDK offers at www.stackmob.com/devcenter.
 
 If you want to support ads in your application, checkout InneractiveViewViewController.
 
 Enjoy!
 
 - The StackMob Team
 
 */

#import <UIKit/UIKit.h>

// Define a few external variables we can reference throughout the application
extern NSString * const OBJECT_ID;
extern NSString * const SCHEMA_NAME;
extern NSString * const KEY;

@interface StackMobStarterProjectAppDelegate : UIResponder <UIApplicationDelegate>
{
    // Accessible dictionary to hold values of the object we will create
    NSMutableDictionary *dictionaryForObject;
    
    // Accessible boolean we can use to track if an object has been created
    BOOL objectCreated;
    
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) NSMutableDictionary *dictionaryForObject;
@property (nonatomic) BOOL objectCreated;



@end
