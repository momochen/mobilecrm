//
//  FaqViewController.m
//  MyApp2
//
//  Created by Quan-lab on 9/30/12.
//  Copyright (c) 2012 RPI. All rights reserved.
//

#import "FaqViewController.h"

@interface FaqViewController ()

@end

@implementation FaqViewController

@synthesize textView=_textView;

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
    [self.textView setUserInteractionEnabled:YES];
    [self.textView setScrollEnabled:YES];
    
    self.textView.text=
    @"In an industry where everyone else focuses on cost, Hästens keeps its focus on quality. The vision of giving the world the best bed allows for no shortcuts. In more than 150 years Hästens has hand crafted beds using nothing but all natural filling materials.    \n\nIn the late 1980’s the present owner, Jan Ryde took over the reigns at Hästens and thus became the fifth generation to run the privately owned family company. Since then sales of these chequered first quality beds have risen by more than 30,000 percent. Jan Rydes aim is that Hästens should provide as much benefit for the user as possible. A good night’s sleep gives a better day and in the long-run a better life.    \n\nHästens, which was founded in 1852, is Sweden’s oldest manufacturer of beds and started out by primarily making saddles and carriage furniture. The main filling material used for saddles was horsehair and already back then it was common knowledge that horsehair also provided the best possible filling material for mattresses. To begin with the saddle makers at Hästens only manufactured beds on demand. This demand increased at such rate that making beds with time became the main business for the company. The Hästens brand name (‘Häst’ is Swedish for horse) and logo are references to its origin as a saddle making company.    \n\nCraftsmanship and quality are two keywords at Hästens where beds are still made by hand using only natural filling material. Hästens is exclusive among bed manufacturers by having all of their beds awarded the Swedish Svan environmental certification, as well as attaining the standards set by Öko-Tex and Möbelfakta for home and public environment. Hästens beds are appreciated by many from palace to cottage, since 1952 Hästens has had the honour of being the supplier of beds to His Majesty King Carl XVI Gustaf of Sweden.    \n\nHästens is currently established in 35 markets and continues to expand organically in existing markets as well as initiating sales in new markets. The part of the business which is represented by exports is steadily rising, from just 4 percent in 1994 to 71 percent in 2005. In April of 2006 Hästens was awarded the ‘Grand Export Prize’ by His Majesty the King of Sweden in recognition of its successes.";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setTextView:nil];
    [super viewDidUnload];
}
@end
