//
//  SocialViewController.m
//  MyApp2
//
//  Created by Quan-lab on 10/2/12.
//  Copyright (c) 2012 RPI. All rights reserved.
//

#import "SocialViewController.h"
#import "DataFacebook.h"

@interface SocialViewController () <FBLoginViewDelegate>
@property (strong, nonatomic) IBOutlet UIButton *buttonPostStatus;
@property (strong, nonatomic) id<FBGraphUser> loggedInUser;

- (void)showAlert:(NSString *)message
           result:(id)result
            error:(NSError *)error;

@end

@implementation SocialViewController


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
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"slide7.png"]];
    // Do any additional setup after loading the view, typically from a nib.
    UIImage *buttonImage = [UIImage imageNamed:@"send a tweet.png"];
    [self.tweetButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
    [self.view addSubview:self.tweetButton];
    
    UIImage *buttonImage2 = [UIImage imageNamed:@"update status.png"];
    [self.facebookButton setBackgroundImage:buttonImage2 forState:UIControlStateNormal];
    [self.view addSubview:self.facebookButton];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// Convenience method to perform some action that requires the "publish_actions" permissions.
- (void) performPublishAction:(void (^)(void)) action {
    // we defer request for permission to post to the moment of post, then we check for the permission
    if ([FBSession.activeSession.permissions indexOfObject:@"publish_actions"] == NSNotFound) {
        // if we don't already have the permission, then we request it now
        [FBSession.activeSession reauthorizeWithPublishPermissions:[NSArray arrayWithObject:@"publish_actions"]
                                                   defaultAudience:FBSessionDefaultAudienceFriends
                                                 completionHandler:^(FBSession *session, NSError *error) {
                                                     if (!error) {
                                                         action();
                                                     }
                                                     //For this example, ignore errors (such as if user cancels).
                                                 }];
    } else {
        action();
    }
    
}





- (IBAction)postStatus:(id)sender {
    // Post a status update to the user's feed via the Graph API, and display an alert view
    // with the results or an error.
    NSString *name = self.loggedInUser.first_name;
    NSString *message = [NSString stringWithFormat:@"Updating status for %@ at %@",
                         name != nil ? name : @"me" , [NSDate date]];
    
    // if it is available to us, we will post using the native dialog
    BOOL displayedNativeDialog = [FBNativeDialogs presentShareDialogModallyFrom:self
                                                                    initialText:nil
                                                                          image:nil
                                                                            url:nil
                                                                        handler:nil];
    if (!displayedNativeDialog) {
        
        [self performPublishAction:^{
            // otherwise fall back on a request for permissions and a direct post
            [FBRequestConnection startForPostStatusUpdate:message
                                        completionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
                                            
                                            [self showAlert:message result:result error:error];
                                            self.buttonPostStatus.enabled = YES;
                                        }];
            
            self.buttonPostStatus.enabled = NO;
        }];
    }
}

- (IBAction)tweetButton:(id)sender {
    if ([TWTweetComposeViewController canSendTweet]){
        TWTweetComposeViewController *tweetComposer =[[TWTweetComposeViewController alloc]init];
        [tweetComposer setInitialText:@"I am using Hästens app on iPhone. "];
        [self presentModalViewController:tweetComposer animated:YES];
    }
    else {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Please set up your Twitter account first. " delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [alertView show];
    }

}


- (void)viewDidUnload {
    [self setTweetButton:nil];
    [self setFacebookButton:nil];
    [super viewDidUnload];
}
@end
