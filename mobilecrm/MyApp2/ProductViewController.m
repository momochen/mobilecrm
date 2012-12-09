//
//  ProductViewController.m
//  green-machine
//
//  Created by momo on 10/25/12.
//
//

#import "ProductViewController.h"
#import "DataSearchResults.h"

@interface ProductViewController ()

@end

@implementation ProductViewController

@synthesize productName=_productName;
@synthesize productColorScrollView=_productColorScrollView;
@synthesize productID=_productID;

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
    
    // Do any additional setup after loading the view from its nib.
    // Image for the specific product
    NSLog(@"Product ID is %d",productID);
    NSString* imageAbsURL = [[DataSearchResults sharedInstance] serverImageFolderURL];
    NSString* dbImgName = [[[DataSearchResults sharedInstance] productImageList] objectAtIndex:productID];
    
    dbImgName = [[dbImgName componentsSeparatedByString:@"\""] objectAtIndex:1];
    imageAbsURL = [imageAbsURL stringByAppendingFormat:@"%@",dbImgName];
    
    NSLog(@"Image address is %@",imageAbsURL);
    
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: imageAbsURL]];
    self.productImage.image = [UIImage imageWithData: imageData];
    self.productImage.contentMode = UIViewContentModeScaleAspectFit;
    
    // Image for the colors
    // Show up all the images in the scroll view
    
    NSArray* colorList = [[DataSearchResults sharedInstance] queryProductColorList];
    
    self.productColorScrollView.delegate = self;
    
    NSLog(@"%d Numbers of color images",colorList.count);
    
    for (NSInteger i = 0; i<[colorList count]; i++) {
        imageAbsURL = @"";
        dbImgName = [[[colorList objectAtIndex:i] componentsSeparatedByString:@"\""] objectAtIndex:1];
        NSLog(@"Color image named :%@",dbImgName);
        
        imageAbsURL = [[[DataSearchResults sharedInstance] serverImageFolderURL] stringByAppendingFormat:@"%@",dbImgName];
                
        imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: imageAbsURL]];
        
        CGRect frame;
        frame.origin.x = self.productColorScrollView.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.productColorScrollView.frame.size;
        
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:frame];
        
        imageView.image = [UIImage imageWithData:imageData];
        
        imageView.userInteractionEnabled = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        
        [self.productColorScrollView addSubview:imageView];
        
    }
    
    self.productColorScrollView.contentSize = CGSizeMake(self.productColorScrollView.frame.size.width * colorList.count, self.productColorScrollView.frame.size.height);
    self.title = [[[DataSearchResults sharedInstance] queryproductNameList] objectAtIndex:productID];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    
    [self setProductImage:nil];
    
    [super viewDidUnload];
}
@end
    
