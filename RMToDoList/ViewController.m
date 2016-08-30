//
//  ViewController.m
//  RMToDoList
//
//  Created by Student P_02 on 24/08/16.
//  Copyright © 2016 Rahul Mankar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    UIImage *image =[[UIImage alloc]init];
self.view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"todo.jpg" ]];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewDidAppear:(BOOL)animated {
    
    [self updateTaskTableView];
}

//-(void)fetchAllTask {
//    
//    allTasksInList = [[RMDatabaseManager sharedManager]executeSelectedQuery:@"SELECT * FROM TASKS"];

//}


-(void)updateTaskTableView {
    
//    [self fetchAllTask];
    if (allTasksInList.count > 0) {
        [self.tableViewOutlet reloadData];
        
    }
}








-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return allTasksInList.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    Tasks *taskModel=[allTasksInList objectAtIndex:indexPath.row];
    
    cell.textLabel.text = taskModel.textName;
    
    if (taskModel.completed) {
        cell.backgroundColor = [UIColor greenColor];
    }
    else {
        cell.backgroundColor = [UIColor redColor];
    }
    
    return cell;
    
    
}
-(void)insertTask:(NSString *)text {
    if (text.length > 0 && ![text isEqualToString:@""]) {
        
        Tasks *taskModel = [[Tasks alloc]init];
        taskModel.textName = text;
        taskModel.Task_iD = [text uppercaseString];
        
        if ([[RMDatabaseManager sharedManager]insertTask:taskModel]) {
            NSLog(@"Task inserted.");
            [self updateTaskTableView];
            self.textFieldToEnterTask.text = @"";
        }
        else {
            NSLog(@"Unable to insert task.");
        }
        
    }
}




- (IBAction)insertButtonAction:(id)sender {
    
    NSString *text = self.textFieldToEnterTask.text;
    
    [self insertTask:text];

}
@end
