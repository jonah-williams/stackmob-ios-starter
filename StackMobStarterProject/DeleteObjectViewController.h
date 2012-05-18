//
//  DeleteObjectViewController.h
//  StackMobStarterProject
//
//  Created by Matt Vaznaian on 5/15/12.
//  Copyright (c) 2012 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeleteObjectViewController : UIViewController
@property (retain, nonatomic) IBOutlet UILabel *deleteStatusLabel;

- (IBAction)deleteObject:(id)sender;

@end
