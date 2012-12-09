//
//  MapViewController.h
//  Activity3
//
//  Created by Lu Cai on 10/24/12.
//  Copyright (c) 2012 Lu Cai. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ActivityDetail.h"

@interface MapViewController : UIViewController<CLLocationManagerDelegate,MKMapViewDelegate>{
    
    IBOutlet MKMapView *mapview;
    IBOutlet ActivityDetail *ActivityDetail;
    CLLocationManager *theLocationManager;
   // MKMapView *mapview;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapview;
@property (nonatomic, retain) IBOutlet ActivityDetail *ActivityDetail;
-(IBAction)setMap:(id)sender;
-(IBAction)getlocation;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *BackToActivityTableView;
@property (nonatomic,retain) CLLocationManager *theLocationManager;
@property int num;
@end
