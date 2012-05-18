//
//  UpdateObjectViewController.h
//  StackMobStarterProject
//
//  Created by Matt Vaznaian on 5/15/12.
//  Copyright (c) 2012 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UpdateObjectViewController : UIViewController <UITextFieldDelegate>
@property (retain, nonatomic) IBOutlet UITextField *aNewValueTextField;
@property (retain, nonatomic) IBOutlet UILabel *updateOutputLabel;

- (IBAction)updateObject:(id)sender;

@end
