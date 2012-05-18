//
//  DeleteObjectViewController.m
//  StackMobStarterProject
//
//  Created by Matt Vaznaian on 5/15/12.
//  Copyright (c) 2012 StackMob. All rights reserved.
//

#import "DeleteObjectViewController.h"
#import "StackMobStarterProjectAppDelegate.h"
#import "StackMob.h"

@interface DeleteObjectViewController ()

@end

@implementation DeleteObjectViewController
@synthesize deleteStatusLabel;

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
	// Do any additional setup after loading the view.
}

// When the view appears, reflect in the UI whether an object has been created
- (void)viewDidAppear:(BOOL)animated
{
    if ([[self appDelegate] objectCreated])
    {
        // Pull the saved object id from appDelegate
        NSString *createdObjectID = [[[self appDelegate] dictionaryForObject] objectForKey:OBJECT_ID];
        
        deleteStatusLabel.text = [NSString stringWithFormat:@"ID to be used for deleting object from StackMob: %@", createdObjectID];
    }
    else {
        deleteStatusLabel.text = @"You have not created an object yet";
    }
}

- (void)viewDidUnload
{
    [self setDeleteStatusLabel:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [deleteStatusLabel release];
    [super dealloc];
}

// Method called when Delete Object is tapped.
- (IBAction)deleteObject:(id)sender {
    
    if ([[self appDelegate] objectCreated])
    {
        // Pull the saved schema name and object id from appDelegate
        NSString *schemaName = [[[self appDelegate] dictionaryForObject] objectForKey:SCHEMA_NAME];
        NSString *createdObjectID = [[[self appDelegate] dictionaryForObject] objectForKey:OBJECT_ID];
        
        // We create a dictionary for all the keys and values we want to associate with the object
        NSDictionary *args = [NSDictionary dictionaryWithObjectsAndKeys:createdObjectID, [NSString stringWithFormat:@"%@_id", schemaName] , nil];
        
        // We use the destroy method to delete an object
        [[StackMob stackmob] destroy:schemaName withArguments:args 
                    andCallback:^(BOOL success, id result){
                        if(success){
                            // Action after a call results in success
                            
                            UIAlertView *successAlert = [[UIAlertView alloc] initWithTitle:@"Success" message:@"Your object was was deleted." delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
                            [successAlert show];
                            
                            // tell the app delegate that we no longer have a created object
                            [[self appDelegate] setObjectCreated:NO];
                            
                        } else {
                            // Action after a call results in error
                            
                            UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Your object was not deleted." delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
                            [errorAlert show];
                        }
                    }];
        
        // remove all objects from our main dictionary to reflect deletion in UI
        [[[self appDelegate] dictionaryForObject] removeAllObjects];
        deleteStatusLabel.text = @"You have not created an object yet";
    }
    else {
        
        // Present an alert to the user if they are trying to update an object that hasn't been created yet
        UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Your need to create an object before you delete it." delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
        [errorAlert show];
    }
    
}
@end
