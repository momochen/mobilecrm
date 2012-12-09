//
//  ShowCaseTypeViewController.h
//  MyApp2
//
//  Created by Quan-lab on 10/25/12.
//  Copyright (c) 2012 RPI. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowCaseTypeViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>
{
    NSMutableArray *typeList;
}

@property (strong, nonatomic) IBOutlet UIPickerView *typePicker;

@property (strong, nonatomic) IBOutlet UIButton *button;

@property (strong,nonatomic) NSMutableArray *typeList;

@end
