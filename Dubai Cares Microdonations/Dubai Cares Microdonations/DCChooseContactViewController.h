//
//  DCChooseContactViewController.h
//  Dubai Cares Microdonations
//
//  Created by Oleg Grishin on 11/19/13.
//  Copyright (c) 2013 Dubai Cares. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AddressBookUI/AddressBookUI.h>
#import "TPKeyboardAvoidingScrollView.h"

@interface DCChooseContactViewController : UIViewController <ABPeoplePickerNavigationControllerDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;

@end
