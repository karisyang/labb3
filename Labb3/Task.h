//
//  TaksManager.h
//  Labb3
//
//  Created by Karis on 2014-04-28.
//  Copyright (c) 2014 easnyang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Task : NSObject
@property (nonatomic) NSString* name;
@property (nonatomic) BOOL isDone;

-(BOOL) isTaskDone;
-(void) setTaskAsDone;
-(instancetype) initWithName:(NSString*) name;
@end
