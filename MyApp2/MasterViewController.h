//
//  MasterViewController.h
//  Activity3
//
//  Created by Lu Cai on 10/14/12.
//  Copyright (c) 2012 Lu Cai. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController
{
    NSMutableArray *listOfItems;
}

@property (strong, nonatomic) DetailViewController *detailViewController;

@property (strong, nonatomic) NSArray * list;

@end
