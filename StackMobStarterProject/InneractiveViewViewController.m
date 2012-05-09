//
//  InneractiveViewViewController.m
//  StackMobStarterProject
//
//  Created by Douglas Rapp on 5/9/12.
//  Copyright (c) 2012 StackMob. All rights reserved.
//

#import "InneractiveViewViewController.h"

@interface InneractiveViewViewController ()

@end

@implementation InneractiveViewViewController


- (void)loadView
{
	CGRect appFrame = [[UIScreen mainScreen] applicationFrame];
	self.view = [[UIView alloc] initWithFrame:appFrame];
    
	// Full screen button
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[button addTarget:self action:@selector(fullScreenAd:) forControlEvents:UIControlEventTouchUpInside];
	[button setTitle:@"Full screen dialog" forState:UIControlStateNormal];
	button.frame = CGRectMake(0, appFrame.size.height-40, appFrame.size.width, 25);
	button.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleRightMargin;
	[self.view addSubview:button];
	
	// Optional parameters
	NSMutableDictionary *optionalParams = [[NSMutableDictionary alloc] init];
	[optionalParams setObject:@"25" forKey:[NSNumber numberWithInt:Key_Age]];
	[optionalParams setObject:@"642" forKey:[NSNumber numberWithInt:Key_Distribution_Id]];
	[optionalParams setObject:@"Test_EID" forKey:[NSNumber numberWithInt:Key_External_Id]];
	[optionalParams setObject:@"m" forKey:[NSNumber numberWithInt:Key_Gender]];
	[optionalParams setObject:@"53.542132,-2.239856" forKey:[NSNumber numberWithInt:Key_Gps_Coordinates]];
	[optionalParams setObject:@"inneractive,test" forKey:[NSNumber numberWithInt:Key_Keywords]];
	[optionalParams setObject:@"US,NY,NY" forKey:[NSNumber numberWithInt:Key_Location]];
	[optionalParams setObject:@"972561234567" forKey:[NSNumber numberWithInt:Key_Msisdn]];
    
    /*
     * Optional notifications, for the following events:
     *
     * IaAdReceived         - Called when the ad view has finished loading a paid ad.
     * IaDefaultAdReceived	- Called when the ad view has finished loading a default ad.
     * IaAdFailed           - Called when the ad view has failed to load an ad.
     * IaAdClicked          - Called when the ad has been clicked.
     * IaAdWillShow         - Called when the ad is about to show.
     * IaAdDidShow          - Called when the ad did show.
     * IaAdWillHide         - Called when the ad is about to hide.
     * IaAdDidHide          - Called when the ad did hide.
     * IaAdWillClose        - Called when the ad is about to close.
     * IaAdDidClose         - Called when the ad did close.
     * IaAdWillResize       - Called when the ad is about to resize.
     * IaAdDidResize        - Called when the ad did resize.
     * IaAdWillExpand       - Called when the ad is about to expand.
     * IaAdDidExpand        - Called when the ad did expand.
     * IaAppShouldSuspend   - Called when the app should suspend (for example, when the ad expands).
     * IaAppShouldResume    - Called when the app should resume (for example, when the ad collapses).
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(iaAdRecieved:) name:@"IaAdRecieved" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(iaDefaultAdRecieved:) name:@"IaDefaultAdRecieved" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(iaAdFailed:) name:@"IaAdFailed" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(iaAdClicked:) name:@"IaAdClicked" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(iaAdWillShow:) name:@"IaAdWillShow" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(iaAdDidShow:) name:@"IaAdDidShow" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(iaAdWillHide:) name:@"IaAdWillHide" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(iaAdDidHide:) name:@"IaAdDidHide" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(iaAdWillClose:) name:@"IaAdWillClose" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(iaAdDidClose:) name:@"IaAdDidClose" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(iaAdWillResize:) name:@"IaAdWillResize" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(iaAdDidResize:) name:@"IaAdDidResize" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(iaAdWillExpand:) name:@"IaAdWillExpand" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(iaAdDidExpand:) name:@"IaAdDidExpand" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(iaAppShouldSuspend:) name:@"IaAppShouldSuspend" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(iaAppShouldResume:) name:@"IaAppShouldResume" object:nil];
    
	// Display ad
    if (![InneractiveAd DisplayAd:@"iOS_Test" withType:IaAdType_Banner withRoot:self.view withReload:120 withParams:optionalParams])
	{
		UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"This application is free but requires an internet connection." message:@"Please configure your connectivity settings and re-try." delegate:self cancelButtonTitle:@"Exit" otherButtonTitles:nil] autorelease];
		[alert show];
	}
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)fullScreenAd:(id)sender
{
	// Display ad
	if (![InneractiveAd DisplayAd:@"iOS_Test" withType:IaAdType_FullScreen withRoot:self.view withReload:0])
	{
		UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"This application is free but requires an internet connection." message:@"Please configure your connectivity settings and re-try." delegate:self cancelButtonTitle:@"Exit" otherButtonTitles:nil] autorelease];
		[alert show];
	}
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	// Exit application
	exit(0);
}

- (IBAction)iaAdRecieved:(id)sender
{
    // The ad view has finished loading a paid ad
}
- (IBAction)iaDefaultAdRecieved:(id)sender
{
    // The ad view has finished loading a default ad
}
- (IBAction)iaAdFailed:(id)sender
{
    // The ad view has failed to load an ad
}
- (IBAction)iaAdClicked:(id)sender
{
    // The ad has been clicked
}

- (IBAction)iaAdWillShow:(id)sender
{
    // The ad is about to show
}

- (IBAction)iaAdDidShow:(id)sender
{
    // The ad did show
}

- (IBAction)iaAdWillHide:(id)sender
{
    // The ad is about to hide
}

- (IBAction)iaAdDidHide:(id)sender
{
    // The ad did hide
}

- (IBAction)iaAdWillClose:(id)sender
{
    // The ad is about to close
}

- (IBAction)iaAdDidClose:(id)sender
{
    // The ad did close
}

- (IBAction)iaAdWillResize:(id)sender
{
    // The ad is about to resize
}

- (IBAction)iaAdDidResize:(id)sender
{
    // The ad did resize
}

- (IBAction)iaAdWillExpand:(id)sender
{
    // The ad is about to expand
}

- (IBAction)iaAdDidExpand:(id)sender
{
    // The ad did expand
}

- (IBAction)iaAppShouldSuspend:(id)sender
{
    // The app should suspend (for example, when the ad expands)
}

- (IBAction)iaAppShouldResume:(id)sender
{
    // The app should resume (for example, when the ad collapses)
}


@end
