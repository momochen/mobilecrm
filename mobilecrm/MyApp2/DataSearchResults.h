//
//  DataSearchResults.h
//  MyApp2
//
//  Created by Quan-lab on 9/23/12.
//  Copyright (c) 2012 RPI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataSearchResults : NSObject{
    
    NSString *queryResult;
    NSString *queryResultNameImg;
    NSString *queryResultColor;
    NSArray *productNameList;
    NSArray *productColorList;
    NSArray *productImageList;
    NSString *serverURL;
    NSString *serverImageFolder;
}
@property (nonatomic,copy) NSString* queryResult;
@property (nonatomic,copy) NSString* queryResultNameImg;
@property (nonatomic,copy) NSString* queryResultColor;
@property (nonatomic,copy) NSArray* productNameList;
@property (nonatomic,copy) NSArray* productColorList;
@property (nonatomic,copy) NSArray* productImageList;
@property (nonatomic,copy) NSString* serverURL;
@property (nonatomic,copy) NSString* serverImageFolder;

+ (DataSearchResults *) sharedInstance;

-(NSString *) queryResultNameImg;
-(void) setQueryResultNameImg:(NSString *) queryResult;

-(NSString *) queryResultColor;
-(void) setQueryResultColor:(NSString *) queryResult;

-(NSArray *) productInfo;
-(void) setproductInfo:(NSArray *) productInfo;

-(NSArray *) queryproductNameList;
-(void) setproductName:(NSArray *) productNameList;

-(NSArray *) queryProductColorList;
-(void) setproductColorList:(NSArray *) productColorList;

-(NSArray *) queryProductImageList;
-(void) setProductImageList:(NSArray *) productImageList;

-(NSString *) serverImageFolderURL;

@end
