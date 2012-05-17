//
//  CreateObjectViewController.h
//  StackMobStarterProject
//
//  Created by Matt Vaznaian on 5/15/12.
//  Copyright (c) 2012 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StackMob.h"

@interface CreateObjectViewController : UIViewController <UIAlertViewDelegate, UITextFieldDelegate>

@property (retain, nonatomic) IBOutlet UITextField *schemaField;
@property (retain, nonatomic) IBOutlet UITextField *valueField;
@property (retain, nonatomic) IBOutlet UITextField *keyField;
@property (retain, nonatomic) IBOutlet UILabel *statusLabel;

-(IBAction)createNewObject:(id)sender;



@end
