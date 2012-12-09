//
//  AppointmentViewController.h
//  MyApp2
//
//  Created by Quan-lab on 9/30/12.
//  Copyright (c) 2012 RPI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppointmentViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UILabel *timeLabel;

@property (strong, nonatomic) IBOutlet UILabel *placeLabel;

@property (strong, nonatomic) IBOutlet UITextField *comments;

@end
