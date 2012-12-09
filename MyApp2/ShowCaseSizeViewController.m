//
//  ShowCaseSizeViewController.m
//  MyApp2
//
//  Created by Quan-lab on 10/25/12.
//  Copyright (c) 2012 RPI. All rights reserved.
//

#import "ShowCaseSizeViewController.h"
#import "DataSearchCondition.h"
#import "DataInventory.h"

@interface ShowCaseSizeViewController ()
@property NSInteger currentRow;
@end

@implementation ShowCaseSizeViewController

@synthesize button=_button;
@synthesize sizeList=_sizeList;
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
    //self.sizeList = [[NSArray alloc] initWithObjects:@"150 cm", @"160 cm", @"180 cm", @"210 cm", @"220 cm", @"King", @"CA King", nil];
    self.sizeList = [[NSMutableArray alloc] init];
    [self.sizeList addObject:@"Unselected"];
    for (NSInteger i = 0; i < [[[DataInventory sharedInstance] productTypeList] count]; i++) {
        NSInteger ending = [[[[[[[DataInventory sharedInstance] productTypeList] objectAtIndex:i] description] componentsSeparatedByString:@"\""] objectAtIndexedSubscript:2] length];
        //set item per row
        NSRange stringRange = NSMakeRange(0, ending-1);
        
        [self.sizeList addObject:[[[[[[[DataInventory sharedInstance] productTypeList] objectAtIndex:i] description] componentsSeparatedByString:@"\""] objectAtIndexedSubscript:2] substringWithRange:stringRange]];
    }
    NSLog(@"In size selection we obtain %@",self.sizeList);
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    //One column
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    //set number of rows
    return self.sizeList.count;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    //set item per row
    return [self.sizeList objectAtIndex:row];
}

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.currentRow=row;
    
}

- (IBAction)submitButton:(id)sender {
    DataSearchCondition *searchCondition = [DataSearchCondition sharedInstance];
    searchCondition.size=[self.sizeList objectAtIndex:self.currentRow];

    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setSizePicker:nil];
    [self setButton:nil];
    [super viewDidUnload];
}
@end
