//
//  SWCardCreationLandingView.m
//  Swipe
//
//  Created by Guowei Mo on 03/04/2016.
//  Copyright © 2016 Guowei Mo. All rights reserved.
//

#import "SWCardCreationLandingView.h"
#import "SWLinkedInHandler.h"

@implementation SWCardCreationLandingView

- (void)awakeFromNib
{
  [super awakeFromNib];
}

- (instancetype)init
{
  self = [super init];
  if (self != nil) {
    [self.creatCardButton addTarget:self action:@selector(creatCardButtonDidTap:) forControlEvents: UIControlEventTouchUpInside];
    [self.importLinkedInButton addTarget:self action:@selector(importLinkedInButtonDidTap:) forControlEvents: UIControlEventTouchUpInside];
  }
  return self;
}

- (void)creatCardButtonDidTap:(UIButton *)sender
{
  
}

- (void)importLinkedInButtonDidTap:(UIButton *)sender
{
  [SWLinkedInHandler authenticateLinkedInWithCompletionBlock:^(LISDKAPIResponse *response) {
    
  }];
}

@end
