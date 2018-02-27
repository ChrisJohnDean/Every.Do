//
//  ToDo.h
//  Every.Do
//
//  Created by Chris Dean on 2018-02-27.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject

@property (nonatomic) NSString *title;
@property (nonatomic) NSString *todoDescription;
@property (nonatomic) int priorityNumber;
@property (nonatomic) BOOL isCompleted;

- (instancetype)initWithTitle:(NSString*)title withDescription:(NSString*)description withPriorityNumber:(int)prioNum;
- (void)didCompleteItem;

@end
