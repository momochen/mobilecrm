//
//  DataInventory.h
//  MyApp2
//
//  Created by Quan-lab on 9/23/12.
//  Copyright (c) 2012 RPI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataInventory : NSObject{
    
    NSArray *productTypeList;
    NSArray *productColorList;
    NSArray *productModelList;
    NSString *serverURL;
    
}
+ (DataInventory *) sharedInstance;

@property (nonatomic,copy) NSArray *productTypeList;
@property (nonatomic,copy) NSArray *productColorList;
@property (nonatomic,copy) NSArray *productModelList;
@property (nonatomic,copy) NSString *serverURL;

- (NSArray *) productColorList;
- (NSArray *) productModelList;
- (NSArray *) productTypeList;

@end
