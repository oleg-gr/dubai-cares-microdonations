//
//  DCConfirmationViewController.h
//  Dubai Cares Microdonations
//
//  Created by Oleg Grishin on 11/20/13.
//  Copyright (c) 2013 Dubai Cares. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface DCConfirmationViewController : UIViewController <MFMessageComposeViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextView *amount;
@property (weak, nonatomic) IBOutlet UITextView *provider;
@property (weak, nonatomic) IBOutlet UITextView *message;
@property (weak, nonatomic) IBOutlet UITextView *messageLabel;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIButton *okButton;
@property (weak, nonatomic) IBOutlet UILabel *confirmationLabel;
@property (weak, nonatomic) IBOutlet UITextView *donationLabel;
@property (weak, nonatomic) IBOutlet UITextView *providerLabel;
@property (weak, nonatomic) IBOutlet UITextView *donationValue;
@property (weak, nonatomic) IBOutlet UITextView *providerValue;

@end
