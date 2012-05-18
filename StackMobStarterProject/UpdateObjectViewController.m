//
//  UpdateObjectViewController.m
//  StackMobStarterProject
//
//  Created by Matt Vaznaian on 5/15/12.
//  Copyright (c) 2012 StackMob. All rights reserved.
//

#import "UpdateObjectViewController.h"
#import "StackMobStarterProjectAppDelegate.h"
#import "StackMob.h"

@interface UpdateObjectViewController ()

@end

@implementation UpdateObjectViewController
@synthesize aNewValueTextField;
@synthesize updateOutputLabel;

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

- (void)viewDidAppear:(BOOL)animated
{
    // When the view appears, reflect in the UI whether an object has been created
    if ([[self appDelegate] objectCreated])
    {
        aNewValueTextField.placeholder = @"Enter new value here";
    }
    else {
        aNewValueTextField.text = @"";
        updateOutputLabel.text = @"";
        aNewValueTextField.placeholder = @"You have not created an object yet";
    }
}

- (void)viewDidUnload
{
    [self setANewValueTextField:nil];
    [self setUpdateOutputLabel:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [aNewValueTextField release];
    [updateOutputLabel release];
    [super dealloc];
}

// Method called when Update Object is tapped.
- (IBAction)updateObject:(id)sender {
    
    if ([[self appDelegate] objectCreated])
    {
        // Pull the saved schema name and object id from appDelegate
        NSString *schemaName = [[[self appDelegate] dictionaryForObject] objectForKey:SCHEMA_NAME];
        NSString *createdObjectID = [[[self appDelegate] dictionaryForObject]objectForKey:OBJECT_ID];
        
        NSString *newValue = [aNewValueTextField text];
        
        // We create a dictionary for all the keys and values we want to associate with the object
        NSDictionary *args = [NSDictionary dictionaryWithObjectsAndKeys:newValue, [[[self appDelegate] dictionaryForObject] objectForKey:KEY] , nil];
        
        // We use the put method to update an object
        [[StackMob stackmob] put:schemaName withId:createdObjectID andArguments:args andCallback:^(BOOL success, id result)
         {
             if(success){
                 // Action after a call results in success
                 
                 // We can get the response body of the newly created object in NSDictionary form 
                 NSDictionary *resultDict = (NSDictionary *)result;
                 
                 // For demonstration purposes we will display the output on a label
                 updateOutputLabel.text = [NSString stringWithFormat:@"%@", resultDict];
             } else {
                 // Action after a call results in error
                 
                 UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Your obejct was not updated." delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
                 [errorAlert show];
             }
         }];
         
    }
    else {
        
        // Present an alert to the user if they are trying to update an object that hasn't been created yet
        UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Your need to create an object before you update it." delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
        [errorAlert show];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
@end
