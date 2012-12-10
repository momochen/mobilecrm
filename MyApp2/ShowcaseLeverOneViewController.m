//
//  ShowcaseLeverOneViewController.m
//  MyApp2
//
//  Created by Quan-lab on 12/9/12.
//  Copyright (c) 2012 RPI. All rights reserved.
//

#import "ShowcaseLeverOneViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ShowcaseLeverOneViewController ()

@end

@implementation ShowcaseLeverOneViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    listOfItems1 = [[NSMutableArray alloc] init];

    [listOfItems1 addObject:@"Continental Beds"];
    [listOfItems1 addObject:@"Frame Beds"];
    [listOfItems1 addObject:@"Adjustable Beds"];
    
    
    listOfItems2 = [[NSMutableArray alloc] init];
    
    [listOfItems2 addObject:@"Red"];
    [listOfItems2 addObject:@"Blue"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==0) return [listOfItems1 count];
    else return [listOfItems2 count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    NSLog(@"index1=%d, index2=%d\n",[indexPath section],[indexPath row]);
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    /*
     NSDate *object = [_objects objectAtIndex:indexPath.row];
     cell.textLabel.text = [object description];
     */
    if([indexPath section]==0)
    {
        NSString *cellValue = [listOfItems1 objectAtIndex:indexPath.row];
        cell.textLabel.text = cellValue;
        if(indexPath.row==0)
            cell.imageView.image=[UIImage imageNamed:@"continental.jpg"];
        else if(indexPath.row==1)
            cell.imageView.image=[UIImage imageNamed:@"frame.jpg"];
        else if(indexPath.row==2)
            cell.imageView.image=[UIImage imageNamed:@"adjustable.jpg"];
    }
    else if([indexPath section]==1)
    {
        NSString *cellValue = [listOfItems2 objectAtIndex:indexPath.row];
        cell.textLabel.text = cellValue;
        if(indexPath.row==0)
            cell.imageView.image=[UIImage imageNamed:@"red.gif"];
        else if(indexPath.row==1)
            cell.imageView.image=[UIImage imageNamed:@"blue.gif"];
    }

    CALayer * l = [cell.imageView layer];
    [l setMasksToBounds:YES];
    [l setCornerRadius:12.0];
    
    
    return cell;

}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if(section==0)
        return @"By type:";
    else if(section==1)
        return @"By color:";
}



@end
