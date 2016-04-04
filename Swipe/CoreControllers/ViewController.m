//
//  ViewController.m
//  Swipe
//
//  Created by Guowei Mo on 25/02/2016.
//  Copyright © 2016 Guowei Mo. All rights reserved.
//

#import "ViewController.h"
#import <linkedin-sdk/LISDK.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
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
                                        // do something with response
                                        NSLog(@"Response label text %@", response.data);
                                        NSError *error = nil;
                                        NSData *data = [response.data dataUsingEncoding:NSUTF8StringEncoding];
                                        NSDictionary *kvData = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
                                        dispatch_async(dispatch_get_main_queue(), ^{
 //                                         self.fullName.text = [NSString stringWithFormat:@"%@ %@",[kvData objectForKey:@"firstName"],[kvData objectForKey:@"lastName"]];
   //                                       self.jobTitle.text = [kvData objectForKey:@"headline"];
//                                          self.emailAddress.text = [kvData objectForKey:@"emailAddress"];
                                          [self downloadImageWithURL:[NSURL URLWithString:kvData[@"pictureUrl"]]
                                                     completionBlock:^(BOOL succeeded, UIImage *image) {
                                                       if (succeeded) {
//                                                         self.profileImage.image = image;
                                                       }
                                                     }];
                                        });
                                      }
                                        error:^(LISDKAPIError *apiError) {
                                          // do something with error
                                        }];
  
  UISwipeGestureRecognizer *swipeCard = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(cardDidSwipe:)];
  swipeCard.direction = UISwipeGestureRecognizerDirectionUp;
//  [self.cardView addGestureRecognizer:swipeCard];
}

- (void)cardDidSwipe:(UISwipeGestureRecognizer *)sender{
//  struct CGRect originalFrame = self.cardView.frame;
//  [UIView animateWithDuration:2 delay:0.5 options:UIViewAnimationOptionCurveEaseOut animations:^{
//    self.cardView.frame = CGRectMake(CGRectGetMinX(self.cardView.frame), -0.5 * self.cardView.frame.size.height, CGRectGetWidth(self.cardView.frame), CGRectGetHeight(self.cardView.frame));
//    self.cardView.alpha = 0;
//  } completion:^(BOOL finished) {
//    self.cardView.frame = originalFrame;
//    self.cardView.alpha = 1;
//  }];
}

- (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock
{
  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
  [NSURLConnection sendAsynchronousRequest:request
                                     queue:[NSOperationQueue mainQueue]
                         completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                           if(!error)
                           {
                             UIImage *image = [[UIImage alloc] initWithData:data];
                             completionBlock(YES,image);
                           }else{
                             completionBlock(NO,nil);
                           }
                         }];
}

@end
