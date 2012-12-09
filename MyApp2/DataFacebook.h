//
//  DataFacebook.h
//  MyApp2
//
//  Created by Yan Ou on 11/12/12.
//  Copyright (c) 2012 RPI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataFacebook : NSObject
{
    NSMutableArray *name;
}
+ (DataFacebook *) sharedInstance;
-(NSMutableArray*) name;
-(void) setName:(NSMutableArray *) newName;

@end