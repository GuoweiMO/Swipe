//
//  SWButton.m
//  Swipe
//
//  Created by Guowei Mo on 03/04/2016.
//  Copyright © 2016 Guowei Mo. All rights reserved.
//

#import "SWButton.h"

@implementation SWButton

- (instancetype)init
{
  self = [super init];
  if (self != nil) {
    
  }
  return self;
}

- (instancetype)initWithDefaultStyle
{
  self = [super init];
  if (self != nil) {
    self.backgroundColor = [UIColor redColor];
    self.layer.cornerRadius = 5;
    self.titleLabel.textColor = [UIColor whiteColor];
  }
  return self;
}

- (instancetype)initWithBackgroundColor:(UIColor *)bgColor
                           cornerRadius:(CGFloat)radius
                             titleColor:(UIColor *)titleColor
{
  self = [super init];
  if (self != nil) {
    self.backgroundColor = bgColor;
    self.layer.cornerRadius = radius;
    self.titleLabel.textColor = titleColor;
  }
  return self;
}

@end
