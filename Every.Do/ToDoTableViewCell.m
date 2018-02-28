//
//  ToDoTableViewCell.m
//  Every.Do
//
//  Created by Chris Dean on 2018-02-27.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

#import "ToDoTableViewCell.h"

@implementation ToDoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)didComplete {
    self.backgroundColor = [UIColor redColor];
    self.descriptionLabel.font = [UIFont fontWithName:@"System" size:25];
    //swipedCell.backgroundColor = [UIColor redColor];
    //swipedCell.descriptionLabel.font = [UIFont fontWithName:@"System" size:25];
}

@end
