//
//  ToDoTableViewCell.h
//  Every.Do
//
//  Created by Chris Dean on 2018-02-27.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToDoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *priorityLabel;



@end
