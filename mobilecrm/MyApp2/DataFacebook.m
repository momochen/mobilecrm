//
//  DataFacebook.m
//  MyApp2
//
//  Created by Yan Ou on 11/12/12.
//  Copyright (c) 2012 RPI. All rights reserved.
//

//
//  Data.m
//  Calculator
//
//  Created by Yan Ou on 9/27/12.
//  Copyright (c) 2012 Yan Ou. All rights reserved.
//

#import "DataFacebook.h"

@implementation DataFacebook

static DataFacebook *_sharedInstance;

- (id) init
{
	if (self = [super init])
	{
		// custom initialization
	}
	return self;
}

+ (DataFacebook *) sharedInstance
{
	if (!_sharedInstance)
	{
		_sharedInstance = [[DataFacebook alloc] init];
	}
    
	return _sharedInstance;
}
-(NSMutableArray *) name
{
    return name;
}

-(void) setName:(NSMutableArray *)newName
{
    name = newName;
}
@end