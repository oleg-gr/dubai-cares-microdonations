//
//  DCAppDelegate.h
//  Dubai Cares Microdonations
//
//  Created by Oleg Grishin on 11/2/13.
//  Copyright (c) 2013 Dubai Cares. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DCDataModel.h"

@interface DCAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) DCDataModel *appData;


@end
