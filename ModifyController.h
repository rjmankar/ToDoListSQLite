//
//  ModifyController.h
//  RMToDoList
//
//  Created by Student P_05 on 30/08/16.
//  Copyright © 2016 Rahul Mankar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Tasks.h"
#import "RMDatabaseManager.h"

@interface ModifyController : UIViewController<UITextFieldDelegate>
//{
//    Tasks *selectedTask;
//    NSString *priviousTextInTextField;
//    NSString *newTextInTextField;
//    
//}

@property(nonatomic,retain) Tasks *taskSelected;
@property (strong, nonatomic) IBOutlet UITextField *updateTaskTextField;
- (IBAction)editTaskButtonAction:(id)sender;
- (IBAction)deleteTaskButtonAction:(id)sender;
- (IBAction)updateTaskButtonAction:(id)sender;

@property (strong, nonatomic) IBOutlet UIButton *editButtonOutlet;
@property (strong, nonatomic) IBOutlet UIButton *deleteButtonOutlet;
@property (strong, nonatomic) IBOutlet UIButton *updateButtonOutlet;

@end
