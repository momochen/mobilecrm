//
//  ActivityDetail.h
//  Activity3
//
//  Created by Lu Cai on 11/3/12.
//  Copyright (c) 2012 Lu Cai. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ActivityDetail : UIViewController
@property (strong, nonatomic) IBOutlet UIBarButtonItem *BackButton;

@property (strong, nonatomic) IBOutlet UIImageView *ActivityImage;


@property (strong, nonatomic) IBOutlet UITextView *ActivityContext;

@property int activityNumber;

@property (strong, nonatomic) id contextItem;

@end
