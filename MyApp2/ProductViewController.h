//
//  ProductViewController.h
//  green-machine
//
//  Created by momo on 10/25/12.
//
//

#import <UIKit/UIKit.h>

@interface ProductViewController : UIViewController<UIScrollViewDelegate>{
    NSString *productName;
    IBOutlet UIImageView *productImage;
    IBOutlet UILabel *productDescription;
    NSInteger productID;
    IBOutlet UIScrollView *productColorScrollView;
}

@property (nonatomic,retain) NSString *productName;
@property (nonatomic,retain) IBOutlet UIImageView *productImage;
@property (nonatomic,retain) IBOutlet UIScrollView *productColorScrollView;
@property NSInteger productID;


@end
