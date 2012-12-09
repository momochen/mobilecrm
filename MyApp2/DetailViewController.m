//
//  DetailViewController.m
//  Activity3
//
//  Created by Lu Cai on 10/14/12.
//  Copyright (c) 2012 Lu Cai. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController

@synthesize detailItem = _detailItem;
@synthesize detailDescriptionLabel = _detailDescriptionLabel;
@synthesize picture = _picture;
@synthesize itemNumber = _itemNumber;

#pragma mark - Managing the detail item

/*
- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
}
 */

- (void)configureView
{
    // Update the user interface for the detail item.
/*
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem description];
    }*/
    
    //create the UIImage object
    UIImage * Activity1Image = [UIImage imageNamed:@"Bed Party.png"];
    UIImage * Activity2Image = [UIImage imageNamed:@"Fashion Night.png"];
    UIImage * Activity3Image = [UIImage imageNamed:@"Model Show.png"];
    UIImage * Activity4Image = [UIImage imageNamed:@"New Store.png"];
    UIImage * Activity5Image = [UIImage imageNamed:@"Ribbon Cutting.png"];
    
    
    
    switch (_itemNumber) {
        case 0:
            _detailDescriptionLabel.text = @"Bed party will be held at Silent Luxe Shanghai!";
            _picture.image = Activity1Image;
            self.title = @"Bed Party";
            break;
        
        case 1:
            _detailDescriptionLabel.text = @"Fashion night was held at Hästens Beijing. ";
            _picture.image = Activity2Image;
            self.title = @"Fashion Night";
            NSLog(@"image size %f",Activity2Image.size.height);
            NSLog(@"aaaaa%f`",Activity2Image.size.height);
            break;
            
        case 2:
            _detailDescriptionLabel.text = @"World famous models invited to the Silent Luxe model show!";
            _picture.image = Activity3Image;
            self.title = @"Model Show";
            break;
            
        case 3:
            _detailDescriptionLabel.text = @"A new Silent Luxe store starts its business at Beijing Dongcheng.";
            _picture.image = Activity4Image;
            self.title = @"New Store";
            break;
            
        case 4:
            _detailDescriptionLabel.text = @"The ribbon cutting ceremony of the new Silent Luxe store.";
            _picture.image = Activity5Image;
            self.title = @"Ribbon Cutting";
            break;
            
        default:
            _detailDescriptionLabel.text = @"Bed party will be held at Silent Luxe Shanghai!";
            _picture.image = Activity1Image;
            self.title = @"Bed Party";
            break;

    }
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = NSLocalizedString(@"Detail", @"Detail");
    }
    return self;
}
							
- (void)viewDidUnload {
    [self setDetailDescriptionLabel:nil];
    [super viewDidUnload];
}
@end
