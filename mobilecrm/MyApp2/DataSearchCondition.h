//
//  DataSearchCondition.h
//  MyApp2
//
//  Created by Quan-lab on 10/25/12.
//  Copyright (c) 2012 RPI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSearchCondition : NSObject
{
    NSString *type;
    NSString *size;
    NSString *color;
}
+ (DataSearchCondition *) sharedInstance;

-(NSString *) type;
-(void) setType:(NSString *) newType;

-(NSString *) size;
-(void) setSize:(NSString *) newSize;

-(NSString *) color;
-(void) setColor:(NSString *) newColor;

@end
