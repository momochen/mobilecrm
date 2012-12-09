//
//  DataDBinfo.m
//  MyApp2
//
//  Created by momo on 11/12/12.
//  Copyright (c) 2012 RPI. All rights reserved.
//

#import "DataDBinfo.h"

@implementation DataDBinfo
@synthesize dbWebServerAddr;
@synthesize dbImageFolderAddr;
@synthesize dbWebServerQueryBaseAddr;

static DataDBinfo *_sharedInstance;

- (id) init
{
	if (self = [super init])
	{
		// custom initialization
		// memset(date, 0, sizeof(date));
        dbWebServerAddr = @"http://128.113.106.6";
        dbWebServerPort = @"10035";
        dbImageFolderAddr = @"ios-hastens-pic";
        dbWebServerQueryBaseAddr = @"http://128.113.106.6:10035/repositories/ios-hastens?query=";
        
	}
	return self;
}

+ (DataDBinfo *) sharedInstance
{
	if (!_sharedInstance)
	{
		_sharedInstance = [[DataDBinfo alloc] init];
	}
    
	return _sharedInstance;
}


@end
