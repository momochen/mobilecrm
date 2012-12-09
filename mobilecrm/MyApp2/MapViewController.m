//
//  MapViewController.m
//  Activity3
//
//  Created by Lu Cai on 10/24/12.
//  Copyright (c) 2012 Lu Cai. All rights reserved.
//

#import "MapViewController.h"
#import "ActivityDetail.h"
#import "NewClass.h"

@interface MapViewController ()

@end

@implementation MapViewController

@synthesize mapview,ActivityDetail,theLocationManager,num;

-(IBAction)getlocation {
    
    CLLocationCoordinate2D _coordinate = theLocationManager.location.coordinate;
    
    MKCoordinateRegion extentsRegion = MKCoordinateRegionMakeWithDistance(_coordinate, 800, 800);
    
    [mapview setRegion:extentsRegion animated:YES];
    
}

-(IBAction)setMap:(id)sender {
    switch (((UISegmentedControl *) sender).selectedSegmentIndex) {
        case 0:
            mapview.mapType = MKMapTypeStandard;
            break;
        case 1:
            mapview.mapType = MKMapTypeSatellite;
            break;
        case 2:
            mapview.mapType = MKMapTypeHybrid;
            break;
            
        default:
            break;
    }
}

-(IBAction)BackToActivityTableView:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

-(void)viewDidLoad{
    [super viewDidLoad];
    
    [mapview setMapType:MKMapTypeStandard];
    [mapview setZoomEnabled:YES];
    [mapview setScrollEnabled:YES];
    
    MKCoordinateRegion region1 = { {0.0,0.0},{0.0,0.0 } };
    region1.center.latitude = 31.204359;
    region1.center.longitude = 121.402763;
    region1.span.longitudeDelta = 0.01f;
    region1.span.latitudeDelta = 0.01f;
    [mapview setRegion:region1 animated:YES];
    NewClass *ann1 = [[NewClass alloc] init];
    ann1.title = @"Shanghai";
    ann1.subtitle = @"Phone: 021-62092318";
    ann1.coordinate = region1.center;
    ann1.num = 1;
    [mapview addAnnotation:ann1];
    
    MKCoordinateRegion region2 = { {0.0,0.0},{0.0,0.0 } };
    region2.center.latitude = 39.911382;
    region2.center.longitude = 116.456384;
    region2.span.longitudeDelta = 0.01f;
    region2.span.latitudeDelta = 0.01f;
    [mapview setRegion:region2 animated:YES];
    NewClass *ann2 = [[NewClass alloc] init];
    ann2.title = @"Beijing Chaoyang";
    ann2.subtitle = @"Phone: 010-59772209";
    ann2.coordinate = region2.center;
    ann2.num = 2;
    [mapview addAnnotation:ann2];
    
    MKCoordinateRegion region3 = { {0.0,0.0},{0.0,0.0 } };
    region3.center.latitude = 39.908419;
    region3.center.longitude = 116.429831;
    region3.span.longitudeDelta = 0.01f;
    region3.span.latitudeDelta = 0.01f;
    [mapview setRegion:region3 animated:YES];
    NewClass *ann3 = [[NewClass alloc] init];
    ann3.title = @"Beijing Dongcheng";
    ann3.subtitle = @"Phone: 010-65278320";
    ann3.coordinate = region3.center;
    ann3.num = 3;
    [mapview addAnnotation:ann3];
    
    
    NSMutableArray* activities=[[NSMutableArray alloc] init];
    
    
    [activities addObject:ann1];
    [activities addObject:ann2];
    [activities addObject:ann3];
    mapview.showsUserLocation = YES;
    
}

/*
 -(MKAnnotationView *) mapview:(MKMapView *)mapview viewForAnnotation:(id<MKAnnotation>)annotation {
 MKPinAnnotationView *Mypin = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"current"];
 Mypin.pinColor = MKPinAnnotationColorPurple;
 
 UIButton *advertButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
 if ([[annotation title] isEqualToString:@"lululu"]) {
 [advertButton addTarget:self action:@selector(lululuClicked:) forControlEvents:UIControlEventTouchUpInside];
 }
 if ([[annotation title] isEqualToString:@"Oulaoshi"]) {
 [advertButton addTarget:self action:@selector(OulaoshiClicked:) forControlEvents:UIControlEventTouchUpInside];
 }
 
 Mypin.rightCalloutAccessoryView = advertButton;
 Mypin.draggable = NO;
 Mypin.highlighted = YES;
 Mypin.animatesDrop = TRUE;
 Mypin.canShowCallout = YES;
 
 return Mypin;
 }*/



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
/*
 - (void)viewDidLoad
 {
 [super viewDidLoad];
 // Do any additional setup after loading the view from its nib.
 }*/

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
	NSLog(@"welcome into the map view annotation");
	
	// if it's the user location, just return nil.
    if ([annotation isKindOfClass:[MKUserLocation class]])
        return nil;
    
	// try to dequeue an existing pin view first
	static NSString* AnnotationIdentifier = @"AnnotationIdentifier";
	MKPinAnnotationView* pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:AnnotationIdentifier];
	pinView.animatesDrop=YES;
	pinView.canShowCallout=YES;
	pinView.pinColor=MKPinAnnotationColorPurple;
	
	
	UIButton* rightButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	[rightButton setTitle:annotation.title forState:UIControlStateNormal];
	[rightButton addTarget:self
					action:@selector(showDetails:)
		  forControlEvents:UIControlEventTouchUpInside];
	pinView.rightCalloutAccessoryView = rightButton;
	
	//UIImageView *profileIconView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"profile.png"]];
	//pinView.leftCalloutAccessoryView = profileIconView;
	
	
	return pinView;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    if (theLocationManager == nil)
        theLocationManager = [[CLLocationManager alloc] init];
    
    [theLocationManager startUpdatingLocation];
    //The current user location is
    CLLocationCoordinate2D test_loc = theLocationManager.location.coordinate;
    NSLog(@"current location is %f and %f",test_loc.latitude,test_loc.longitude);
    
}

- (void) mapView:(MKMapView *)theMapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    NSLog(@"user location called");
    if (theLocationManager == nil)
        theLocationManager = [[CLLocationManager alloc] init];
    
    [theLocationManager startUpdatingLocation];
    //The current user location is
    CLLocationCoordinate2D test_loc = theLocationManager.location.coordinate;
    NSLog(@"current location is %f and %f",test_loc.latitude,test_loc.longitude);
}


-(IBAction)showDetails:(id)sender{
    //NSLog(@"Here %@",[[(UIButton*)sender titleLabel] text]);
    
	NSLog(@"Annotation Click");
    
    ActivityDetail * activities = [[ActivityDetail alloc] initWithNibName:@"ActivityDetail" bundle:nil];
    NSLog(@"num=%d",num);
    NSLog(@"avNUM=%d",activities.activityNumber);
    activities.activityNumber = num;
    NSLog(@"Activity num= %d",activities.activityNumber);
    
    [self presentModalViewController:activities animated:YES];
}



- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view
{
    // Here push your view controller
    NSLog(@"Did selecte some annotation view");
    
    num =[(NewClass*)view.annotation num];
}


- (void)viewDidUnload {
    [self setBackToActivityTableView:nil];
    [super viewDidUnload];
}
@end
