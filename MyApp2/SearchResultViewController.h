//
//  SearchResultViewController.h
//  green-machine
//
//  Created by momo on 10/25/12.
//
//

#import <UIKit/UIKit.h>
#import "ProductViewController.h"

@interface SearchResultViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>{
    
    NSArray *returnedItems;
    
}
@property (strong,nonatomic) NSArray *returnedItems;

@end
