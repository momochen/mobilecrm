//
//  AppointmentPlaceViewController.h
//  MyApp2
//
//  Created by Quan-lab on 9/30/12.
//  Copyright (c) 2012 RPI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppointmentPlaceViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    //UIPickerView *placePicker;
    //NSArray *placeList;
}

@property (strong, nonatomic) IBOutlet UIPickerView *placePicker;
@property (strong, nonatomic) NSArray *placeList;
@property (strong, nonatomic) IBOutlet UIButton *button;

@end
