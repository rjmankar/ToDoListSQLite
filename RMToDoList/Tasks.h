//
//  Tasks.h
//  RMToDoList
//
//  Created by Student P_02 on 24/08/16.
//  Copyright © 2016 Rahul Mankar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Tasks : NSObject

@property (nonatomic,strong) NSString *Task_iD;
@property (nonatomic,strong) NSString *textName;
@property (nonatomic) BOOL completed;
@property (nonatomic) int Id;

- (instancetype)initWithID:(int)IDFrm
                   Task_iD:(NSString *)Task_iD
                   andText:(NSString *)textFrm
              andCompleted:(BOOL)completedFrm;


@end
