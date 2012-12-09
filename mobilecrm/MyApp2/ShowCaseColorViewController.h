//
//  ShowCaseColorViewController.h
//  MyApp2
//
//  Created by Quan-lab on 10/25/12.
//  Copyright (c) 2012 RPI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowCaseColorViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>


@property (strong, nonatomic) IBOutlet UIPickerView *colorPicker;

@property (strong, nonatomic) IBOutlet UIButton *button;

@property (strong, nonatomic) NSMutableArray *colorList;

@end
