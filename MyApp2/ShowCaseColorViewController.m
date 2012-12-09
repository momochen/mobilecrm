//
//  ShowCaseColorViewController.m
//  MyApp2
//
//  Created by Quan-lab on 10/25/12.
//  Copyright (c) 2012 RPI. All rights reserved.
//

#import "ShowCaseColorViewController.h"
#import "DataSearchCondition.h"
#import "DataInventory.h"

@interface ShowCaseColorViewController ()
@property NSInteger currentRow;
@end

@implementation ShowCaseColorViewController

@synthesize button=_button;
@synthesize colorList=_colorList;
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
    //self.colorList = [[NSArray alloc] initWithObjects:@"Black check", @"Blue check", @"Graphite Grey check", @"Green check", @"Grey check", @"Lime check", @"Red check", @"S12", @"Silver check", @"Single Black", @"Single Brown", @"Single Navy", @"Single Sand", @"Wine Red check", @"Yellow check", @"Yonder Blue check", nil];
    self.colorList = [[NSMutableArray alloc] init];
    [self.colorList addObject:@"Unselected"];
    for (NSInteger i = 0; i < [[[DataInventory sharedInstance] productColorList] count]; i++) {
        NSInteger ending = [[[[[[[DataInventory sharedInstance] productColorList] objectAtIndex:i] description] componentsSeparatedByString:@"\""] objectAtIndexedSubscript:2] length];
        //set item per row
        NSRange stringRange = NSMakeRange(0, ending-1);
        
        [self.colorList addObject:[[[[[[[DataInventory sharedInstance] productColorList] objectAtIndex:i] description] componentsSeparatedByString:@"\""] objectAtIndexedSubscript:2] substringWithRange:stringRange]];
    }
    NSLog(@"In color selection we obtain %@",self.colorList);
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    //One column
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //set number of rows
    return self.colorList.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //set item per row
    return [self.colorList objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.currentRow=row;
}

- (IBAction)submitButton:(id)sender {
    DataSearchCondition *searchCondition = [DataSearchCondition sharedInstance];
    searchCondition.color=[self.colorList objectAtIndex:self.currentRow];

    [self.navigationController popViewControllerAnimated:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setColorPicker:nil];
    [self setButton:nil];
    [super viewDidUnload];
}
@end
