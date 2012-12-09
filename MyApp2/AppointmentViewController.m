//
//  AppointmentViewController.m
//  MyApp2
//
//  Created by Quan-lab on 9/30/12.
//  Copyright (c) 2012 RPI. All rights reserved.
//

#import "AppointmentViewController.h"
#import "DataAppointment.h"

@interface AppointmentViewController ()

@end

@implementation AppointmentViewController

@synthesize timeLabel=_timeLabel;
@synthesize placeLabel=_placeLabel;
@synthesize comments=_comments;

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
    DataAppointment *appointment = [DataAppointment sharedInstance];
    self.timeLabel.text = appointment.dateString;
    self.placeLabel.text = appointment.place;
    self.comments.text = appointment.comment;
    NSLog(@"timeLabel:%@",appointment.dateString);
	// Do any additional setup after loading the view.
}

- (void) viewWillAppear:(BOOL)animated
{
    [self viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTimeLabel:nil];
    [self setPlaceLabel:nil];
    [self setComments:nil];
    [super viewDidUnload];
}

- (IBAction)submit:(id)sender {
    if([self.timeLabel.text isEqualToString:@"Unselected"])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message"
                                                        message:@"You must select a specific time to make an appointment!"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];

    }
    else if([self.placeLabel.text isEqualToString:@"Unselected"])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message"
                                                        message:@"You must select a specific place to make an appointment!"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];

    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message"
                                                        message:@"Your appointment has been made."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)theTextField {
    if (theTextField == self.comments) {
        [theTextField resignFirstResponder];
    }
    DataAppointment *appointment = [DataAppointment sharedInstance];
    appointment.comment=self.comments.text;
    return YES;
}

@end
