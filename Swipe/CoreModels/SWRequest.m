//
//  SWRequest.m
//  Swipe
//
//  Created by Guowei Mo on 26/03/2016.
//  Copyright © 2016 Guowei Mo. All rights reserved.
//

#import "SWRequest.h"

#define SERVER_API_URL @"http://198.100.146.69:8080/QashioAPI-1.0/swapi"

@implementation SWRequest

- (instancetype)initWithURL:(NSURL *)URL{
    self = [super initWithURL:URL];
    if (self) {
        self.URL = [NSURL URLWithString:SERVER_API_URL];
        [self setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
        [self setHTTPShouldHandleCookies:NO];
        [self setTimeoutInterval:30];
        [self setHTTPMethod:@"POST"]; //always use post for security
    }
    return self;
}

- (void)configRequestBodyWithParams:(NSMutableDictionary *)params{
    [self configRequestBodyWithParams:params data:nil];
}

- (void)configRequestBodyWithParams:(NSMutableDictionary *)params data:(NSData *)data{
    
    // the boundary string : a random string, that will not repeat in post data, to separate post data fields.
    NSString *BoundaryConstant = @"----------V2ymHFg03ehbqgZCaKO6jy";
    
    // string constant for the post parameter 'file'. My server uses this name: `file`. Your's may differ
    NSString* FileParamConstant = @"file";
    
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", BoundaryConstant];
    [self setValue:contentType forHTTPHeaderField: @"Content-Type"];
    
    // post body
    NSMutableData *body = [NSMutableData data];
    for (NSString *param in params) {
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"\r\n\r\n", param] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"%@\r\n", [params objectForKey:param]] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    
    if (data) {
        [body appendData:[[NSString stringWithFormat:@"--%@\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"%@\"; filename=\"image.jpg\"\r\n", FileParamConstant] dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:[@"Content-Type: image/jpeg\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:data];
        [body appendData:[[NSString stringWithFormat:@"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    }
    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", BoundaryConstant] dataUsingEncoding:NSUTF8StringEncoding]];

    [self setHTTPBody:body];
    
    // set the content-length
    NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[body length]];
    [self setValue:postLength forHTTPHeaderField:@"Content-Length"];
}

@end
