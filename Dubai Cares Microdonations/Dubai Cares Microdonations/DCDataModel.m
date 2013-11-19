//
//  DCDataModel.m
//  Dubai Cares Microdonations
//
//  Created by Oleg Grishin on 11/19/13.
//  Copyright (c) 2013 Dubai Cares. All rights reserved.
//

#import "DCDataModel.h"

@implementation DCDataModel

-(id)init {
    self = [super init];
    data = [[NSMutableDictionary alloc] initWithCapacity:3];
    [data setObject:@"none" forKey:@"mode"];
    [data setObject:@"none" forKey:@"occasion"];
    [data setObject:[NSNumber numberWithInt:0] forKey:@"amount"];
    [data setObject:@"none" forKey:@"phone"];
    [data setObject:@"none" forKey:@"name"];
    return self;
}

-(void)setData:(id)val forKey:(NSString*)key {
    [data setObject:val forKey:key];
}

-(void)clear {
    [data removeAllObjects];
    [data setObject:@"none" forKey:@"mode"];
    [data setObject:@"none" forKey:@"occasion"];
    [data setObject:[NSNumber numberWithInt:0] forKey:@"amount"];
    [data setObject:@"none" forKey:@"phone"];
    [data setObject:@"none" forKey:@"name"];
}

-(id)dataForKey:(NSString*)key {
    NSArray *keys = data.allKeys;
    if( keys.count == 0 ) return nil;
    return [data objectForKey:key];
}

@end
