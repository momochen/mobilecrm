//
//  DataAppointment.h
//  MyApp2
//
//  Created by Quan-lab on 9/30/12.
//  Copyright (c) 2012 RPI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataAppointment : NSObject
{
    NSDate *date;
    NSString *place;
    NSString *comment;
    NSString *dateString;
}
+ (DataAppointment *) sharedInstance;

-(NSDate *) date;
-(void) setDate:(NSDate *) newDate;

-(NSString *) place;
-(void) setPlace:(NSString *) newPlace;

-(NSString *) comment;
-(void) setComment:(NSString *) newComment;

-(NSString *) dateString;

-(void) date2string;

@end
