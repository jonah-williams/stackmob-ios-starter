//
//  ReadObjectViewController.h
//  StackMobStarterProject
//
//  Created by Matt Vaznaian on 5/15/12.
//  Copyright (c) 2012 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReadObjectViewController : UIViewController
@property (retain, nonatomic) IBOutlet UILabel *readOutputLabel;
@property (retain, nonatomic) IBOutlet UILabel *readStatusLabel;

- (IBAction)readObject:(id)sender;

@end
