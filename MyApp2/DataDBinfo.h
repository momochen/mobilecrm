//
//  DataDBinfo.h
//  MyApp2
//
//  Created by momo on 11/12/12.
//  Copyright (c) 2012 RPI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataDBinfo : NSObject{
    
    NSString *dbWebServerAddr;
    NSString *dbWebServerPort;
    NSString *dbImageFolderAddr;
    NSString *dbWebServerQueryBaseAddr;
}

+ (DataDBinfo *) sharedInstance;

@property (nonatomic,retain) NSString* dbWebServerAddr;
@property (nonatomic,retain) NSString* dbImageFolderAddr;
@property (nonatomic,retain) NSString* dbWebServerPort;
@property (nonatomic,retain) NSString* dbWebServerQueryBaseAddr;
@end
