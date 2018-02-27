//
//  DetailViewController.h
//  Every.Do
//
//  Created by Chris Dean on 2018-02-27.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

