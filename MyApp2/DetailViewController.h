//
//  DetailViewController.h
//  Activity3
//
//  Created by Lu Cai on 10/14/12.
//  Copyright (c) 2012 Lu Cai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView * picture;

@property int itemNumber;

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UITextView *detailDescriptionLabel;

@end
