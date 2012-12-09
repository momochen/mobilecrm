//
//  DataSearchResults.m
//  MyApp2
//
//  Created by Quan-lab on 9/23/12.
//  Copyright (c) 2012 RPI. All rights reserved.
//

#import "DataSearchResults.h"
#import "SBJson.h"
#import "DataDBinfo.h"

@implementation DataSearchResults
@synthesize queryResult;
@synthesize queryResultNameImg;
@synthesize queryResultColor;
@synthesize productNameList;
@synthesize productColorList;
@synthesize productImageList;
@synthesize serverImageFolder;

static DataSearchResults *_sharedInstance;

- (id) init
{
	if (self = [super init])
	{
		// custom initialization
		// memset(date, 0, sizeof(date));
        
        queryResultColor = [[NSString alloc] init];
        queryResultNameImg = [[NSString alloc] init];
        productImageList = [[NSArray alloc] init];
        productColorList = [[NSArray alloc] init];
        productNameList = [[NSArray alloc] init];
        serverURL = [[NSString alloc] initWithFormat:@"%@/",[[DataDBinfo sharedInstance] dbWebServerAddr]];
        serverImageFolder = [[NSString alloc] initWithFormat:@"%@/",[[DataDBinfo sharedInstance] dbImageFolderAddr]];
        
	}
	return self;
}

+ (DataSearchResults *) sharedInstance
{
	if (!_sharedInstance)
	{
		_sharedInstance = [[DataSearchResults alloc] init];
	}
    
	return _sharedInstance;
}

-(NSString *) serverImageFolderURL
{
    return [serverURL stringByAppendingFormat:@"%@",serverImageFolder];
}

-(void) setQueryResultNameImg:(NSString *)queryResult{
    
    queryResultNameImg = queryResult;
    //Once obtaint the result, then trigger the conversion
    if(queryResult){
        [self convertToProductNameImg];
    }
    
}

-(void) setQueryResultColor:(NSString *)queryResult{
    
    queryResultColor = queryResult;
    //Once obtaint the result, then trigger the conversion
    if(queryResult){
        [self convertToProductColor];
    }
    
}


-(NSArray *) queryproductNameList
{
    return productNameList;
}

-(void) setproductName:(NSArray *) productNameList
{
    self.productNameList = productNameList;
}

-(NSArray *) queryProductColorList
{
    return productColorList;
}
-(void) setproductColorList:(NSArray *) productColorList
{
    self.productColorList = productColorList;
}

-(NSArray *) queryProductImageList
{
    return productImageList;
}
-(void) setProductImageList:(NSArray *) productImageList
{
    self.productImageList = productImageList;
}


# pragma Private Methods

-(void) convertToProductNameImg{
    
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    // 1. get the top level value as a dictionary
    NSDictionary *jsonObject = [parser objectWithString:self.queryResultNameImg error:NULL];
    // 2. get the lessons object as an array
    NSArray *queryNameList = [jsonObject objectForKey:@"names"];
    NSArray *queryValueList = [jsonObject objectForKey:@"values"];
    
    NSMutableArray *queryProductName = [[NSMutableArray alloc] initWithObjects:nil];
    NSMutableArray *queryProductImage = [[NSMutableArray alloc] initWithObjects:nil];
    
    for (NSInteger i = 0; i<[queryValueList count]; i++) {
        [queryProductName addObject:[[queryValueList objectAtIndex:i] objectAtIndex:0]];
        [queryProductImage addObject:[[queryValueList objectAtIndex:i] objectAtIndex:1]];
    }

    productNameList = queryProductName;
    productImageList = queryProductImage;
    
    NSLog(@"Stored %d names and %d images",[queryProductName count],[queryProductImage count]);
}

-(void) convertToProductColor{
    
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    // 1. get the top level value as a dictionary
    NSDictionary *jsonObject = [parser objectWithString:self.queryResultColor error:NULL];
    // 2. get the lessons object as an array
    NSArray *queryNameList = [jsonObject objectForKey:@"names"];
    NSArray *queryValueList = [jsonObject objectForKey:@"values"];
    
    NSMutableArray *queryProductColor = [[NSMutableArray alloc] initWithObjects:nil];
    
    for (NSInteger i = 0; i<[queryValueList count]; i++) {
        [queryProductColor addObject:[[queryValueList objectAtIndex:i] objectAtIndex:0]];
    }
    
    productColorList = queryProductColor;
    NSLog(@"Stored %d colors",[queryProductColor count]);
}


@end
