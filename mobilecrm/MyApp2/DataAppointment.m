//
//  DataAppointment.m
//  MyApp2
//
//  Created by Quan-lab on 9/30/12.
//  Copyright (c) 2012 RPI. All rights reserved.
//

#import "DataAppointment.h"

@implementation DataAppointment

static DataAppointment *_sharedInstance;

- (id) init
{
	if (self = [super init])
	{
		// custom initialization
		// memset(date, 0, sizeof(date));
        date=[[NSDate alloc] init];
        place=[[NSString alloc] initWithFormat:@"Unselected"];
        comment=[[NSString alloc] initWithFormat:@""];
        dateString=[[NSString alloc] initWithFormat:@"Unselected"];
	}
	return self;
}

+ (DataAppointment *) sharedInstance
{
	if (!_sharedInstance)
	{
		_sharedInstance = [[DataAppointment alloc] init];
	}
    
	return _sharedInstance;
}


-(NSDate *) date
{
    return date;
}

-(void) setDate:(NSDate *) newDate
{
    date=newDate;
}

-(NSString *) place
{
    return place;
}

-(void) setPlace:(NSString *) newPlace
{
    place=newPlace;
}

-(NSString *) comment
{
    return comment;
}

-(void) setComment:(NSString *) newComment
{
    comment=newComment;
}

-(NSString *) dateString
{
    return dateString;
}

-(void) date2string
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"hh:mm, MMM dd, yyyy"];
    dateString = [dateFormat stringFromDate:date];
}

@end
