//
//  DCWorkViewController.h
//  Dubai Cares Microdonations
//
//  Created by Oleg Grishin on 11/2/13.
//  Copyright (c) 2013 Dubai Cares. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCWorkViewController : UIViewController <UIWebViewDelegate>
{
    BOOL isInitialRequest;
}


@property (weak, nonatomic) IBOutlet UIWebView *mapWebView;
@property (strong, nonatomic) UIActivityIndicatorView *loadingIndicator;

@end
