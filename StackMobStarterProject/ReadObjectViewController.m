//
//  ReadObjectViewController.m
//  StackMobStarterProject
//
//  Created by Matt Vaznaian on 5/15/12.
//  Copyright (c) 2012 StackMob. All rights reserved.
//

#import "ReadObjectViewController.h"
#import "StackMobStarterProjectAppDelegate.h"
#import "StackMob.h"

@interface ReadObjectViewController ()

@end

@implementation ReadObjectViewController
@synthesize readOutputLabel;
@synthesize readStatusLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

// A handy method which gives us access to all public variables in AppDelegate
- (StackMobStarterProjectAppDelegate *)appDelegate
{
    return (StackMobStarterProjectAppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	
}

- (void)viewDidAppear:(BOOL)animated
{
    // When the view appears, reflect in the UI whether an object has been created
    if ([[self appDelegate] objectCreated])
    {
        // Pull the saved object id from appDelegate
        NSString *createdObjectID = [[[self appDelegate] dictionaryForObject] objectForKey:OBJECT_ID];
    
        readStatusLabel.text = [NSString stringWithFormat:@"ID to be used for reading object from StackMob: %@", createdObjectID];
    }
    else {
        readStatusLabel.text = @"You have not created an object yet";
        readOutputLabel.text = @"";
    }
}

- (void)viewDidUnload
{
    [self setReadOutputLabel:nil];
    [self setReadStatusLabel:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [readOutputLabel release];
    [readStatusLabel release];
    [super dealloc];
}

// Method called when Read Object is tapped.
- (IBAction)readObject:(id)sender {
    
    
    if ([[self appDelegate] objectCreated])
    {
        // Pull the saved object id from appDelegate
        NSString *schemaName = [[[self appDelegate] dictionaryForObject] objectForKey:SCHEMA_NAME];
        NSString *createdObjectID = [[[self appDelegate] dictionaryForObject]objectForKey:OBJECT_ID];
        
        // In order to read an object we get it in the form <schema_name>/<object_id>
        NSString *schemaAndID = [NSString stringWithFormat:@"%@/%@", schemaName, createdObjectID];
        
        // We use the get method to read an object
        [[StackMob stackmob] get:schemaAndID
                    withCallback:^(BOOL success, id result){
                        if(success){
                            // Action after a call results in success
                            
                            // We can get the response body of the newly created object in NSDictionary form 
                            NSDictionary *resultDict = (NSDictionary *)result;
                            
                            // Update the UI to reflect success
                            readOutputLabel.text = [NSString stringWithFormat:@"%@", resultDict];
                        } else {
                            // Action after a call results in error
                            
                            UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Your obejct was not read." delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
                            [errorAlert show];
                        }
                    }];
    }
    else {
        
        // Present an alert to the user if they are trying to read an object that hasn't been created yet
        UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Your need to create an object before you read it." delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
        [errorAlert show];
    }
}
@end
