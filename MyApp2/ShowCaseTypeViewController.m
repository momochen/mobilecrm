//
//  ShowCaseTypeViewController.m
//  MyApp2
//
//  Created by Quan-lab on 10/25/12.
//  Copyright (c) 2012 RPI. All rights reserved.
//

#import "ShowCaseTypeViewController.h"
#import "DataSearchCondition.h"
#import "DataInventory.h"

@interface ShowCaseTypeViewController ()
@property NSInteger currentRow;
@end

@implementation ShowCaseTypeViewController

@synthesize typeList=_typeList;
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
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"check.png"]];

    UIImage *buttonImage = [UIImage imageNamed:@"submit1.png"];
    [self.button setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [self.view addSubview:self.button];
    //self.typeList = [[NSArray alloc] initWithObjects:@"Continental Beds", @"Frame Beds", @"Adjustable Beds", nil];
    self.typeList = [[NSMutableArray alloc] init];
    [self.typeList addObject:@"Unselected"];
    for (NSInteger i = 0; i < [[[DataInventory sharedInstance] productModelList] count]; i++) {
        NSInteger ending = [[[[[[[DataInventory sharedInstance] productModelList] objectAtIndex:i] description] componentsSeparatedByString:@"\""] objectAtIndexedSubscript:2] length];
        //set item per row
        NSRange stringRange = NSMakeRange(0, ending-1);
        
        [self.typeList addObject:[[[[[[[DataInventory sharedInstance] productModelList] objectAtIndex:i] description] componentsSeparatedByString:@"\""] objectAtIndexedSubscript:2] substringWithRange:stringRange]];
    }
    NSLog(@"In model selection we obtain %@",self.typeList);
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    //One column
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //set number of rows
    return self.typeList.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    return [self.typeList objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.currentRow=row;
}

- (IBAction)submitButton:(id)sender {
    DataSearchCondition *searchCondition = [DataSearchCondition sharedInstance];
    searchCondition.type=[self.typeList objectAtIndex:self.currentRow];

    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTypePicker:nil];
    [self setButton:nil];
    [super viewDidUnload];
}
@end
