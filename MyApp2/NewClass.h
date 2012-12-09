//
//  NewClass.h
//  Activity3
//
//  Created by Lu Cai on 10/24/12.
//  Copyright (c) 2012 Lu Cai. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>

@interface NewClass : NSObject <MKAnnotation> {
    CLLocationCoordinate2D coordinate;
    int num;
    NSString *title;
    NSString *subtitle;
}

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic) int num;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@end
