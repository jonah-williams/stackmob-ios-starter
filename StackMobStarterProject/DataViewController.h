//
//  DataViewController.h
//  StackMobStarterProject
//
//  Created by Ty Amell on 12/15/11.
//  Copyright 2011 StackMob. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DataViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *dataLabel;
@property (strong, nonatomic) id dataObject;
@end
