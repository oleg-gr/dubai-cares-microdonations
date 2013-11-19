//
//  DCDataModel.h
//  Dubai Cares Microdonations
//
//  Created by Oleg Grishin on 11/19/13.
//  Copyright (c) 2013 Dubai Cares. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DCDataModel : NSObject
{
    NSMutableDictionary *data;
}

-(void)clear;
-(id)dataForKey:(NSString*)key;
-(void)setData:(id)val forKey:(NSString*)key;
-(id)init;

@end

