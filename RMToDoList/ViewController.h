//
//  ViewController.h
//  RMToDoList
//
//  Created by Student P_02 on 24/08/16.
//  Copyright © 2016 Rahul Mankar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMDatabaseManager.h"



@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
{
    NSArray *allTasksInList;
}
@property (strong, nonatomic) IBOutlet UITextField *textFieldToEnterTask;

@property (strong, nonatomic) IBOutlet UITableView *tableViewOutlet;
- (IBAction)insertButtonAction:(id)sender;

@end

