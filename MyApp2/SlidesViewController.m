//
//  SlidesViewController.m
//  MyApp2
//
//  Created by Quan-lab on 9/23/12.
//  Copyright (c) 2012 Quan-lab. All rights reserved.
//

#import "SlidesViewController.h"

@interface SlidesViewController ()

@end

@implementation SlidesViewController

@synthesize scrollView;
@synthesize pages;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)selectPage:(id)sender {
    CGRect frame;
    frame.size = self.scrollView.frame.size;
    frame.origin.x = self.scrollView.frame.size.width * self.pages.currentPage;
    frame.origin.y = 0;
    [self.scrollView scrollRectToVisible:frame animated:YES];
}


- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // Update the page when more than 50% of the previous/next page is visible
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    self.pages.currentPage = page;
    NSLog(@"page=%d",page);
    NSLog(@"scrollView size weight=%f, scrollView size height=%f",self.scrollView.contentSize.width,self.scrollView.contentSize.height);
    
    NSLog(@"scrollView frame size weight=%f, scrollView frame size height=%f",self.scrollView.frame.size.width,self.scrollView.frame.size.height);
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //Delegate
    self.scrollView.delegate = self;
    
    self.view.backgroundColor = [UIColor blackColor];
    NSArray *inforImage = [NSArray arrayWithObjects:[UIImage imageNamed:@"slide1"],
                           [UIImage imageNamed:@"slide2"],
                           [UIImage imageNamed:@"slide3"],
                           [UIImage imageNamed:@"slide4"],
                           [UIImage imageNamed:@"slide5"],
                           [UIImage imageNamed:@"slide6"],
                           [UIImage imageNamed:@"slide7"],
                           [UIImage imageNamed:@"slide8"],
                           [UIImage imageNamed:@"slide9"],nil];
    NSLog(@"count: %d\n",inforImage.count);
    pages.numberOfPages = inforImage.count;
    
    for (int i = 0; i < inforImage.count; i++) {
        CGRect frame;
        frame.origin.x = self.scrollView.frame.size.width * i;
        frame.origin.y = 0;
        frame.size = self.scrollView.frame.size;
        
        UIImageView* imageView = [[UIImageView alloc] initWithFrame:frame];
        
        imageView.image = [inforImage objectAtIndex:i];
        
        imageView.userInteractionEnabled = YES;
        imageView.contentMode = UIViewContentModeScaleAspectFill;
        
        [self.scrollView addSubview:imageView];
    }
    
    self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * inforImage.count, self.scrollView.frame.size.height);
}

- (void)didReceiveMemoryWarning
{
    [self setPages:nil];
    [self setScrollView:nil];
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
