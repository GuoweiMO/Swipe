//
//  SWCardCreationLandingViewController.m
//  Swipe
//
//  Created by Guowei Mo on 03/04/2016.
//  Copyright © 2016 Guowei Mo. All rights reserved.
//

#import "SWCardCreationLandingViewController.h"
#import "SWCardCreationlandingView.h"

@interface SWCardCreationLandingViewController ()

@end

@implementation SWCardCreationLandingViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view from its nib.
  
  SWCardCreationLandingView *landingView = [[SWCardCreationLandingView alloc] init];
  landingView.frame = self.view.bounds;
  [self.view addSubview:landingView];
}

@end
