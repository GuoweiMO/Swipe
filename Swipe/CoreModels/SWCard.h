//
//  SWCard.h
//  Swipe
//
//  Created by Guowei Mo on 26/03/2016.
//  Copyright © 2016 Guowei Mo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SWCard : NSObject

@property (nonatomic, strong) NSString *fullName;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *jobTitle;
@property (nonatomic, strong) NSString *phoneNum;
@property (nonatomic, strong) NSString *imageUrl;
@property (nonatomic, assign) BOOL isMyCard;

@end
