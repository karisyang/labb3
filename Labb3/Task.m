//
//  TaksManager.m
//  Labb3
//
//  Created by Karis on 2014-04-28.
//  Copyright (c) 2014 easnyang. All rights reserved.
//

#import "Task.h"
@implementation Task

- (instancetype)initWithName:(NSString*) name
{
    self = [super init];
    if (self)
    {
        // Custom initialization
        self.name = name;
        self.isDone = 0;
    }
    return self;
}

-(BOOL) isTaskDone
{
    return self.isDone;
}

-(void) setTaskAsDone
{
    self.isDone = 1;
}


@end
