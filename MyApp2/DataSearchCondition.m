//
//  DataSearchCondition.m
//  MyApp2
//
//  Created by Quan-lab on 10/25/12.
//  Copyright (c) 2012 RPI. All rights reserved.
//

#import "DataSearchCondition.h"

@implementation DataSearchCondition

static DataSearchCondition *_sharedInstance;

- (id) init
{
	if (self = [super init])
	{
		// custom initialization
        type=[[NSString alloc] initWithFormat:@"Unselected"];
        size=[[NSString alloc] initWithFormat:@"Unselected"];
        color=[[NSString alloc] initWithFormat:@"Unselected"];
	}
	return self;
}


+ (DataSearchCondition *) sharedInstance
{
	if (!_sharedInstance)
	{
		_sharedInstance = [[DataSearchCondition alloc] init];
	}
    
	return _sharedInstance;
}

-(NSString *) type
{
    return type;
}

-(void) setType:(NSString *) newType
{
    type=newType;
}

-(NSString *) size
{
    return size;
    
}

-(void) setSize:(NSString *) newSize
{
    size=newSize;
}

-(NSString *) color
{
    return color;
}

-(void) setColor:(NSString *) newColor
{
    color=newColor;
}


@end
