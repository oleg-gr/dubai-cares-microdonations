//
//  DCNewsViewController.h
//  Dubai Cares Microdonations
//
//  Created by Oleg Grishin on 11/18/13.
//  Copyright (c) 2013 Dubai Cares. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DCNewsViewController : UIViewController <UIWebViewDelegate>


@property (weak, nonatomic) IBOutlet UIWebView *mapWebView;
@property (strong, nonatomic) UIActivityIndicatorView *loadingIndicator;


@end
