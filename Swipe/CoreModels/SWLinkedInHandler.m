//
//  SWLinkedInHandler.m
//  Swipe
//
//  Created by Guowei Mo on 03/04/2016.
//  Copyright © 2016 Guowei Mo. All rights reserved.
//

#import "SWLinkedInHandler.h"

@implementation SWLinkedInHandler

+ (void)authenticateLinkedInWithCompletionBlock:(LICompletionBlock)successblock
{
  NSString *url = @"https://api.linkedin.com/v1/people/~:(id,first-name,last-name,headline,email-address,picture-url)";
  
  if (![LISDKSessionManager hasValidSession]) {
    [LISDKSessionManager createSessionWithAuth:[NSArray arrayWithObjects:LISDK_BASIC_PROFILE_PERMISSION, LISDK_EMAILADDRESS_PERMISSION, LISDK_CONTACT_INFO_PERMISSION, nil]
                                         state:@"some state"
                        showGoToAppStoreDialog:YES
                                  successBlock:^(NSString *returnState) {
                                    
                                    NSLog(@"%s","success called!");
                                    LISDKSession *session = [[LISDKSessionManager sharedInstance] session];
                                    NSLog(@"value=%@ isvalid=%@",[session value],[session isValid] ? @"YES" : @"NO");
                                    NSMutableString *text = [[NSMutableString alloc] initWithString:[session.accessToken description]];
                                    [text appendString:[NSString stringWithFormat:@",state=\"%@\"",returnState]];
                                  }
                                    errorBlock:^(NSError *error) {
                                      NSLog(@"%s %@","error called! ", [error description]);
                                    }
     ];
  }
  
  [[LISDKAPIHelper sharedInstance] getRequest:url
                                      success:^(LISDKAPIResponse *response) {
                                        successblock(response);
                                      }
                                        error:^(LISDKAPIError *apiError) {

                                        }];
}
@end
