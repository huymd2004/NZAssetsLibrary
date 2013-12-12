//
//  UIAlertView+ShowAppMessage.m
//  Photoapp
//
//  Created by Bruno Furtado on 11/12/13.
//  Copyright (c) 2013 No Zebra Network. All rights reserved.
//

#import "UIAlertView+ShowAppMessage.h"

@implementation UIAlertView (ShowAppMessage)

+ (void)alertWithMessage:(NSString *)message
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Photoapp"
                                                    message:message
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    
    [alert show];
}

@end
