//
//  SWButton.h
//  Swipe
//
//  Created by Guowei Mo on 03/04/2016.
//  Copyright © 2016 Guowei Mo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWButton : UIButton

- (instancetype)initWithBackgroundColor:(UIColor *)bgColor
                           cornerRadius:(CGFloat)radius
                             titleColor:(UIColor *)titleColor;
- (instancetype)initWithDefaultStyle;

@end
