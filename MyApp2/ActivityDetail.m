//
//  ActivityDetail.m
//  Activity3
//
//  Created by Lu Cai on 11/3/12.
//  Copyright (c) 2012 Lu Cai. All rights reserved.
//

#import "ActivityDetail.h"
#import "MapViewController.h"

@interface ActivityDetail ()

@end

@implementation ActivityDetail

@synthesize activityNumber = _activityNumber;
@synthesize contextItem = _contextItem;
@synthesize ActivityImage = _ActivityImage;
@synthesize ActivityContext = _ActivityContext;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }

    
    return self;
}

- (void)configureView
{
    // Update the user interface for the detail item.
    /*
     if (self.detailItem) {
     self.detailDescriptionLabel.text = [self.detailItem description];
     }*/
    
    //create the UIImage object
    UIImage * Activity1Image = [UIImage imageNamed:@"ActivityImage1.jpg"];
    UIImage * Activity2Image = [UIImage imageNamed:@"ActivityImage2.png"];
    UIImage * Activity3Image = [UIImage imageNamed:@"ActivityImage3.png"];
    
    switch (_activityNumber) {
        case 1:
            _ActivityContext.text = @"地址：上海市娄山关路75号吉盛伟邦 B003室\n电话：021-62092318";
            _ActivityImage.image = Activity1Image;
            self.title = @"Shanghai";
            break;
            
        case 2:
            _ActivityContext.text = @"地址：北京朝阳区建国门外大街光华东里8号中海广场南楼1-3楼\n电话：010-59772209";
            _ActivityImage.image = Activity2Image;
            self.title = @"Beijing Chaoyang";
            break;
            
        case 3:
            _ActivityContext.text = @"地址：北京东城区建国门内大街8号中粮广场C座401室\n电话：010-65278320";
            _ActivityImage.image = Activity3Image;
            self.title = @"Beijing Dongcheng";
            break;
            
        default:
            _ActivityContext.text = @"地址：上海市娄山关路75号吉盛伟邦 B003室\n电话：021-62092318";
            _ActivityImage.image = Activity1Image;
            self.title = @"Shanghai";
            break;
            
    }
    
}

- (IBAction)BackButton:(id)sender {
    [self dismissModalViewControllerAnimated:YES];

}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self configureView];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {

    [self setActivityImage:nil];
    [self setActivityContext:nil];
    [self setBackButton:nil];
    [self setActivityContext:nil];
    [super viewDidUnload];
}
@end
