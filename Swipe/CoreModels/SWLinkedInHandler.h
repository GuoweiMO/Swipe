//
//  SWLinkedInHandler.h
//  Swipe
//
//  Created by Guowei Mo on 03/04/2016.
//  Copyright © 2016 Guowei Mo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <linkedin-sdk/LISDK.h>

typedef void (^LICompletionBlock)(LISDKAPIResponse *response);

@interface SWLinkedInHandler : NSObject

+ (void)authenticateLinkedInWithCompletionBlock:(LICompletionBlock)successblock;

@end
