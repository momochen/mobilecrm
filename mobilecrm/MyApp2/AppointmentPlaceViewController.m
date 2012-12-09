//
//  AppointmentPlaceViewController.m
//  MyApp2
//
//  Created by Quan-lab on 9/30/12.
//  Copyright (c) 2012 RPI. All rights reserved.
//

#import "AppointmentPlaceViewController.h"
#import "DataAppointment.h"

@interface AppointmentPlaceViewController ()
@property NSInteger currentRow;
@end

@implementation AppointmentPlaceViewController

@synthesize placeList=_placeList;
@synthesize button=_button;
@synthesize currentRow=_currentRow;

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
    self.currentRow=0;
    self.placeList = [[NSArray alloc] initWithObjects:@"Beijing", @"Shanghai", @"Guangzhou", @"Chengdu", @"Wuhan", @"Chongqing", @"Hangzhou", nil];
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

- (void)viewDidUnload {
    [self setPlacePicker:nil];
    [self setButton:nil];
    [super viewDidUnload];
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    //One column
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //set number of rows
    return self.placeList.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //set item per row
    return [self.placeList objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.currentRow=row;
}

- (IBAction)submitButton:(id)sender {
    DataAppointment *appointment = [DataAppointment sharedInstance];
    appointment.place=[self.placeList objectAtIndex:self.currentRow];
    [self.navigationController popViewControllerAnimated:YES];
}


@end
