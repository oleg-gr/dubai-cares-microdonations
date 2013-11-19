//
//  DCConfirmationViewController.h
//  Dubai Cares Microdonations
//
//  Created by Oleg Grishin on 11/20/13.
//  Copyright (c) 2013 Dubai Cares. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCConfirmationViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *amount;
@property (weak, nonatomic) IBOutlet UITextView *provider;
@property (weak, nonatomic) IBOutlet UITextView *message;
@property (weak, nonatomic) IBOutlet UITextView *messageLabel;

@end
