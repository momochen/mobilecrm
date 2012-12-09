//
//  ShowCaseSearchViewController.m
//  MyApp2
//
//  Created by Quan-lab on 10/25/12.
//  Copyright (c) 2012 RPI. All rights reserved.
//

#import "ShowCaseSearchViewController.h"
#import "DataSearchCondition.h"
#import "SBJson.h"
#import "SearchResultViewController.h"
#import "DataSearchResults.h"
#import "DataSearchCondition.h"
#import "DataInventory.h"
#import "DataDBinfo.h"

@interface ShowCaseSearchViewController ()

@end

@implementation ShowCaseSearchViewController

- (IBAction)QueryToDatabase:(id)sender {
    
    //Target URL
    NSString* dbURL = [[DataDBinfo sharedInstance] dbWebServerQueryBaseAddr];
    
    //Draft query
    NSString* query = [[NSString alloc] initWithFormat:@"prefix hastens:<http://ios-hastens/> select (str(?name) as ?result) where {?s hastens:has-member ?members. ?members hastens:hasName ?name. }"];
    
    //Construct conditioned query
    NSString *typeCondition = @"";
    if ([[[DataSearchCondition sharedInstance] type] isEqualToString:@"Unselected"]) {
        typeCondition = @"";
    }else{
        typeCondition = [[DataSearchCondition sharedInstance] type];
    }
    
    NSString *sizeCondition = @"";
    if ([[[DataSearchCondition sharedInstance] size] isEqualToString:@"Unselected"]) {
        sizeCondition = @"";
    }else{
        sizeCondition = [[DataSearchCondition sharedInstance] size];
    }
    
    NSString *colorCondition = @"";
    if ([[[DataSearchCondition sharedInstance] color] isEqualToString:@"Unselected"]) {
        colorCondition = @"";
    }else{
        colorCondition = [[DataSearchCondition sharedInstance] color];
    }
    
    
    NSString* conditionedQueryModelImage = [[NSString alloc] initWithFormat:@"prefix hastens:<http://ios-hastens/> \
                                  select distinct ?model ?image \
                                  where \
    { \
        ?bed hastens:hasBedModel ?model.                        \
        ?bed hastens:hasBedType ?size.                          \
        ?bed foaf:img ?image.                                   \
        FILTER regex(str(?model),\"%@\").                        \
        FILTER regex(str(?size),\"%@\").                         \
    }",typeCondition,sizeCondition];
    
    NSString* conditionedQueryColor = [[NSString alloc] initWithFormat:@"prefix hastens:<http://ios-hastens/> \
                                       select distinct ?colorImage \
                                       where \
    { \
        ?color hastens:hasColorName ?colorName. \
        ?color foaf:img ?colorImage. \
        FILTER regex(str(?colorName),\"%@\"). \
    }",colorCondition];
    
    NSString* modelImageResult = [self queryAgainstTripleStore:conditionedQueryModelImage];
    NSString* colorResult = [self queryAgainstTripleStore:conditionedQueryColor];
    NSLog(@"%@",modelImageResult);
    NSLog(@"%@",colorResult);
    
    [[DataSearchResults sharedInstance] setQueryResultNameImg:modelImageResult];
    [[DataSearchResults sharedInstance] setQueryResultColor:colorResult];
    
    SearchResultViewController* mySearchResult = [[SearchResultViewController alloc] initWithNibName:@"SearchResultViewController" bundle:nil];
    [self.navigationController pushViewController:mySearchResult animated:YES];
    
}

- (NSString*)queryAgainstTripleStore:(NSString *)sparqlQuery{
    
    NSString* dbURL = [[DataDBinfo sharedInstance] dbWebServerQueryBaseAddr];
    
    sparqlQuery = (__bridge NSString *)CFURLCreateStringByAddingPercentEscapes(
                                                                         NULL,
                                                                         (CFStringRef)sparqlQuery,
                                                                         NULL,
                                                                         (CFStringRef)@"!*'();:@&=+$,/?%#[]",
                                                                         kCFStringEncodingUTF8 );
    
    
    //Aggregated the query string
    NSString* aggregatedQuery = [dbURL stringByAppendingString:sparqlQuery];
    
    //Prepare reqeust
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:aggregatedQuery]];
    [request setHTTPMethod:@"GET"];
    
    //Set header
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    //Get response
    NSHTTPURLResponse* urlResponse = nil;
    NSError *error = [[NSError alloc] init];
    NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
    NSString *result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
    
    NSLog(@"Response code:%d",[urlResponse statusCode]);
    NSLog(@"Response content:%@",result);
    
    if ([urlResponse statusCode]>=200 && [urlResponse statusCode] <300) {
        return result;
        
    }else{
        result = nil;
        return result;
    }
    
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    DataSearchCondition *searchCondition = [DataSearchCondition sharedInstance];
    DataInventory *inventoryList = [DataInventory sharedInstance];
    
    self.typeLabel.text = searchCondition.type;
    self.sizeLabel.text = searchCondition.size;
    self.colorLabel.text = searchCondition.color;
	// Do any additional setup after loading the view.
}

- (void) viewWillAppear:(BOOL)animated
{
    [self viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTypeLabel:nil];
    [self setSizeLabel:nil];
    [self setColorLabel:nil];
    [self setSearchButton:nil];
    [super viewDidUnload];
}
@end
