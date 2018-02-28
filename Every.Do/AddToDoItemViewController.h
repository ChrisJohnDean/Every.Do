//
//  AddToDoItemViewController.h
//  Every.Do
//
//  Created by Chris Dean on 2018-02-27.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@class AddToDoItemViewController;


@protocol addToDoDelegate <NSObject>

- (void)addToDoItem:(ToDo*)toDoItem;

@end


@interface AddToDoItemViewController : UIViewController

@property (nonatomic, weak) id<addToDoDelegate> delegate;

@end
