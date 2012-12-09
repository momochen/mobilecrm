//
//  SearchResultViewController.m
//  green-machine
//
//  Created by momo on 10/25/12.
//
//

#import "SearchResultViewController.h"
#import "ProductViewController.h"
#import "DataSearchResults.h"

@interface SearchResultViewController ()
@end

@implementation SearchResultViewController
@synthesize returnedItems;

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
    //self.returnedItems = [[NSArray alloc] initWithObjects:@"A",@"B",@"C",nil];
    
    
    //self.returnedItems = [[DataSearchResults sharedInstance] queryResult];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    self.returnedItems = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    NSLog(@"%d rows in total",[[[DataSearchResults sharedInstance] queryproductNameList] count]);
    return [[[DataSearchResults sharedInstance] queryproductNameList] count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    NSString* imageAbsURL = [[DataSearchResults sharedInstance] serverImageFolderURL];
    NSString* dbImgName = [[[DataSearchResults sharedInstance] productImageList] objectAtIndex:[indexPath row]];
    dbImgName = [[dbImgName componentsSeparatedByString:@"\""] objectAtIndex:1];
    imageAbsURL = [imageAbsURL stringByAppendingFormat:@"%@",dbImgName];
    
    //NSLog(@"Image address is %@",imageAbsURL);
    
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: imageAbsURL]];
    cell.imageView.image = [UIImage imageWithData: imageData];
    
    cell.textLabel.text = [[[DataSearchResults sharedInstance] queryproductNameList] objectAtIndex:[indexPath row]];
    
    // get substring from 1 to end-1
    cell.textLabel.text = [[cell.textLabel.text substringToIndex:[cell.textLabel.text length] - 1] substringFromIndex:1];
    //cell.detailTextLabel.text = [NSString stringWithFormat:@"About %@",[self.returnedItems objectAtIndex:[indexPath row]]];
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
    NSLog(@"Called");
    
    ProductViewController *myProductView = [[ProductViewController alloc] initWithNibName:@"ProductViewController" bundle:nil];
        
    myProductView.productID = [indexPath row];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:myProductView animated:YES];
    
     
}

@end
