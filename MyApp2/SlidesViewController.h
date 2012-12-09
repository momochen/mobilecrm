//
//  SlidesViewController.h
//  MyApp2
//
//  Created by Quan-lab on 9/23/12.
//  Copyright (c) 2012 Quan-lab. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SlidesViewController : UIViewController <UIScrollViewDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UIPageControl *pages;

@end
