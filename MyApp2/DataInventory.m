//
//  DataInventory.m
//  MyApp2
//
//  Created by Quan-lab on 9/23/12.
//  Copyright (c) 2012 RPI. All rights reserved.
//

#import "DataInventory.h"
#import "SBJson.h"
#import "DataDBinfo.h"

@implementation DataInventory
@synthesize productColorList;
@synthesize productModelList;
@synthesize productTypeList;
@synthesize serverURL;

static DataInventory *_sharedInstance;

- (id) init
{
	if (self = [super init])
	{
		// custom initialization
		// memset(date, 0, sizeof(date));
        
        productColorList = [[NSArray alloc] init];
        productModelList = [[NSArray alloc] init];
        productTypeList = [[NSArray alloc] init];
        [self getInventoryData];
        
	}
	return self;
}

+ (DataInventory *) sharedInstance
{
	if (!_sharedInstance)
	{
		_sharedInstance = [[DataInventory alloc] init];
	}
    
	return _sharedInstance;
}

- (NSArray *) productColorList
{
    //[self getInventoryData];
    return productColorList;
}
- (NSArray *) productModelList
{
    //[self getInventoryData];
    return productModelList;
}
- (NSArray *) productTypeList
{
    //[self getInventoryData];
    return productTypeList;
}



- (void)getInventoryData
{
    //Retrieve inventory data from the database
    SBJsonParser *parser = [[SBJsonParser alloc] init];
    //Query Color List
    
    //Target URL
    NSString* dbURL = [[DataDBinfo sharedInstance] dbWebServerQueryBaseAddr];
    
    //Query Color List
    NSString* colorListQuery = [[NSString alloc] initWithFormat:@"prefix hastens:<http://ios-hastens/> \
                       select distinct ?color \
                       where{ \
                           ?s hastens:hasColorName ?color.}"];
    
    //Query Type List
    NSString* typeListQuery = [[NSString alloc] initWithFormat:@"prefix hastens:<http://ios-hastens/> \
                                select distinct ?type \
                                where{ \
                                ?s hastens:hasBedType ?type.}"];
    
    //Query Model List
    NSString* modelListQuery = [[NSString alloc] initWithFormat:@"prefix hastens:<http://ios-hastens/> \
                               select distinct ?model \
                               where{ \
                                   ?s hastens:hasBedModel ?model.  \
                               }"];
    
    //Get Model, Color restrictions
    

    
    //Encode query to UTF8
    NSString *encodedColorListQuery = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                                         NULL,
                                                                         (CFStringRef)colorListQuery,
                                                                         NULL,
                                                                         (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                         kCFStringEncodingUTF8 );
    
    NSString *encodedTypeListQuery = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                                                                   NULL,
                                                                                                   (CFStringRef)typeListQuery,
                                                                                                   NULL,
                                                                                                   (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                                   kCFStringEncodingUTF8 );
    
    NSString *encodedModelListQuery = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                                                                   NULL,
                                                                                                   (CFStringRef)modelListQuery,
                                                                                                   NULL,
                                                                                                   (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                                                   kCFStringEncodingUTF8 );
    
    
    //Aggregated the query string
    NSString* aggregatedColorListQuery = [dbURL stringByAppendingString:encodedColorListQuery];
    NSString* aggregatedTypeListQuery = [dbURL stringByAppendingString:encodedTypeListQuery];
    NSString* aggregatedModelListQuery = [dbURL stringByAppendingString:encodedModelListQuery];
    
    NSArray *querySet = [[NSArray alloc] initWithObjects:aggregatedColorListQuery,aggregatedTypeListQuery,aggregatedModelListQuery,nil];
    //NSMutableArray *querySet = [[NSMutableArray alloc] initWithObjects:aggregatedColorListQuery,aggregatedTypeListQuery,aggregatedModelListQuery,nil];
    NSMutableArray *queryResultSet = [[NSMutableArray alloc] init];
    
    __block NSInteger resultCounter = 0;
    
    for (NSInteger i = 0; i<[querySet count]; i++) {
        
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
        [request setURL:[NSURL URLWithString:[querySet objectAtIndex:i]]];
        [request setHTTPMethod:@"GET"];
        
        //Set header
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        
        //Get response
        NSHTTPURLResponse* urlResponse = nil;
        NSError *error = [[NSError alloc] init];
        
        //NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
        
        [NSURLConnection
         sendAsynchronousRequest:request
         queue:[[NSOperationQueue alloc] init]
         completionHandler:^(NSURLResponse *response,
                             NSData *data,
                             NSError *error)
         {
             
             
             if ([data length] >0 && error == nil)
             {
                 
                 // DO YOUR WORK HERE
                 NSLog(@"Data here");
                 [queryResultSet addObject:[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]];
                 resultCounter = resultCounter + 1;
                 NSLog(@"Now there are %d results",resultCounter);
                 
                 if (resultCounter==3) {
                     NSString *colorListResult = @"";
                     NSString *typeListResult = @"";
                     NSString *modelListResult = @"";
                     
                     for (NSInteger i = 0; i<[queryResultSet count];i++){
                        
                         //NSLog(@"%@",[queryResultSet objectAtIndex:i]);
                         NSArray *resultTitle = [[parser objectWithString:[queryResultSet objectAtIndex:i]] objectForKey:@"names"];
                         
                         if ([resultTitle[0] rangeOfString:@"model"].location != NSNotFound) {
                             modelListResult = [queryResultSet objectAtIndex:i];
                         }else if ([resultTitle[0] rangeOfString:@"color"].location != NSNotFound){
                             colorListResult = [queryResultSet objectAtIndex:i];
                         }else if ([resultTitle[0] rangeOfString:@"type"].location != NSNotFound){
                             typeListResult = [queryResultSet objectAtIndex:i];
                         }
                        

                     }
                     
                     if ([colorListQuery length]!=0) {
                         NSDictionary *jsonObjectColor = [parser objectWithString:colorListResult error:NULL];
                         productColorList = [jsonObjectColor objectForKey:@"values"];
                         
                     }
                     
                     if ([typeListResult length]!=0) {
                         NSDictionary *jsonObjectType = [parser objectWithString:typeListResult error:NULL];
                         productTypeList = [jsonObjectType objectForKey:@"values"];
                         
                     }
                     
                     if ([modelListResult length]!=0) {
                         NSDictionary *jsonObjectModel = [parser objectWithString:modelListResult error:NULL];
                         productModelList = [jsonObjectModel objectForKey:@"values"];
                         
                     }
                     NSLog(@"%d,%d,%d",[productColorList count],[productTypeList count],[productModelList count]);
                     
                 }
                 
             }
             else if ([data length] == 0 && error == nil)
             {
                 
                 NSLog(@"Nothing was downloaded.");
                 UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Oooooops" message:@"Nothing on server..." delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
                 
             }
             else if (error != nil){
                 
                 NSLog(@"Error = %@", error);
                 UIAlertView * alert = [[UIAlertView alloc]initWithTitle:@"Oooooops" message:error delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
             }
             else{
                 NSLog(@"Data: %@, Error: %@",data,error);
             }
             
         }];
        
    }
    
}

@end
