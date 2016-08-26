//
//  Tasks.m
//  RMToDoList
//
//  Created by Student P_02 on 24/08/16.
//  Copyright © 2016 Rahul Mankar. All rights reserved.
//

#import "Tasks.h"

@implementation Tasks
@synthesize Id;
@synthesize Task_iD;
@synthesize textName;
@synthesize completed;


- (instancetype)init
{
    self = [super init];
    if (self) {
        self.textName=@"";
        self.completed=NO;
    }
    return self;
}

-(instancetype)initWithID:(int)IDFrm
                  Task_iD:(NSString *)Task_iD
                  andText:(NSString *)textFrom
             andCompleted:(BOOL)completedFrm{
    
    Tasks *taskModelObject=[[Tasks alloc]init];
    taskModelObject.Task_iD=Task_iD;
    taskModelObject.textName=textFrom;
    taskModelObject.Id=IDFrm;
    taskModelObject.completed=completedFrm;
    return taskModelObject;
    
}

@end
