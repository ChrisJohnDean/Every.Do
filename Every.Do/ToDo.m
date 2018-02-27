//
//  ToDo.m
//  Every.Do
//
//  Created by Chris Dean on 2018-02-27.
//  Copyright © 2018 Chris Dean. All rights reserved.
//

#import "ToDo.h"

@implementation ToDo

- (instancetype)initWithTitle:(NSString*)title withDescription:(NSString*)description withPriorityNumber:(int)prioNum
{
    self = [super init];
    if (self) {
        _title = title;
        _todoDescription = description;
        _priorityNumber = prioNum;
    }
    return self;
}

- (void)didCompleteItem {
    self.isCompleted = YES;
}

@end
