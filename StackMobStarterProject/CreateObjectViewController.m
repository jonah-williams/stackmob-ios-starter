//
//  CreateObjectViewController.m
//  StackMobStarterProject
//
//  Created by Matt Vaznaian on 5/15/12.
//  Copyright (c) 2012 StackMob. All rights reserved.
//

#import "CreateObjectViewController.h"
#import "StackMobStarterProjectAppDelegate.h"

@interface CreateObjectViewController ()

@end

@implementation CreateObjectViewController
@synthesize schemaField;
@synthesize valueField;
@synthesize keyField;
@synthesize statusLabel;

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
    
    // Populate textfields with placeholder text
	schemaField.placeholder = @"blogentry";
    keyField.placeholder = @"content";
    valueField.placeholder = @"rich text";
}

- (void)viewDidAppear:(BOOL)animated
{
    // Clear the status label if no object has been created
    if (![[self appDelegate] objectCreated])
    {
        statusLabel.text = @"";
    }
}

- (void)viewDidUnload
{
    [self setSchemaField:nil];
    [self setKeyField:nil];
    [self setValueField:nil];
    [self setStatusLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

// Method called when Create New Object is tapped.
- (IBAction)createNewObject:(id)sender
{
    // Pull values from textfields, take defaults if any are blank
    NSString *schemaName = ([[schemaField text] length] == 0) ? @"blogentry" : [schemaField text];
    NSString *key = ([[keyField text] length] == 0) ? @"content" : [keyField text];
    NSString *value = ([[valueField text] length] == 0) ? @"rich text" : [valueField text];
    
    // We create a dictionary for all the keys and values we want to associate with the object
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    // Keys must be 3-25 lowercase alphanumeric characters
    [dictionary setValue:value forKey:key];
    
    // Schema name must be 3-25 lowercase alphanumeric characters
    // We use the post method to create a new object
    [[StackMob stackmob] post:schemaName
                withArguments:dictionary andCallback:^(BOOL success, id result){
                    if(success){
                        // Action after a call results in success
                        
                        // For demo we notify the user of success with an alert
                        UIAlertView *successAlert = [[UIAlertView alloc] initWithTitle:@"Success" message:[NSString stringWithFormat:@"You created a new object for schema %@", schemaName] delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
                        [successAlert show];
                        
                        // We can get the response body of the newly created object in NSDictionary form 
                        NSDictionary *resultDict = (NSDictionary *)result;
                        
                        // In order to retrieve our object we will need the value of it's primary key.  For all schemas excpet "user" that will be in the form <schema_name>_id
                        NSString *schemaNamePlusID = [NSString stringWithFormat:@"%@_id", schemaName];
                        
                        // We are going to save the schema name, key and primary key value of the created object so we can reference it for reading, updating and deleting
                        [[[self appDelegate] dictionaryForObject] setObject:[resultDict objectForKey:schemaNamePlusID] forKey:OBJECT_ID];
                        [[[self appDelegate] dictionaryForObject] setObject:key forKey:KEY];
                        [[[self appDelegate] dictionaryForObject] setObject:schemaName forKey:SCHEMA_NAME];

                        // Update the UI to reflect success
                        statusLabel.text = [NSString stringWithFormat:@"%@: %@", schemaNamePlusID, [resultDict valueForKey:schemaNamePlusID]];
                        
                        // Tell appDelegate that an object has been created
                        [[self appDelegate] setObjectCreated:YES];
                    } else {
                        // Action after a call results in error
                        
                        UIAlertView *errorAlert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Your user was not created." delegate:self cancelButtonTitle:@"Dismiss" otherButtonTitles: nil];
                        [errorAlert show];
                    }
                }];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (void)dealloc {
    [schemaField release];
    [keyField release];
    [valueField release];
    [statusLabel release];
    [super dealloc];
}
@end
