//
//  AppointmentTimeViewController.m
//  MyApp2
//
//  Created by Quan-lab on 9/30/12.
//  Copyright (c) 2012 RPI. All rights reserved.
//

#import "AppointmentTimeViewController.h"
#import "DataAppointment.h"

@interface AppointmentTimeViewController ()

@end

@implementation AppointmentTimeViewController

@synthesize button=_button;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"check.png"]];
    
    UIImage *buttonImage = [UIImage imageNamed:@"submit1.png"];
    [self.button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [self.view addSubview:self.button];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)submitButton:(id)sender {
    DataAppointment *appointment = [DataAppointment sharedInstance];
    appointment.date=self.timePicker.date;
    [appointment date2string];
    NSLog(@"Date: %@",appointment.dateString);
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)viewDidUnload {
    [self setTimePicker:nil];
    [self setButton:nil];
    [super viewDidUnload];
}
@end
