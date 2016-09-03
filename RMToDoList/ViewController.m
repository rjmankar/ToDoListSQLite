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
    
    allTasksInList = [[RMDatabaseManager sharedManager]getAllTask];
    
    [self updateTaskTableView];
}

//-(void)fetchAllTask {
//    
//    allTasksInList = [[RMDatabaseManager sharedManager]executeGivenQuery:@"SELECT FROM TODOLISTDATA"];
//}


-(void)updateTaskTableView {
    
//    [self fetchAllTask];
    if (allTasksInList.count > 0) {
        [self.tableViewOutlet reloadData];
        
    }
}






-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];

    return YES;
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

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    ModifyController *modifyView=[self.storyboard instantiateViewControllerWithIdentifier:@"ModifyController"];
    modifyView.taskSelected=[allTasksInList objectAtIndex:indexPath.row];
    [self.navigationController pushViewController:modifyView animated:YES];
    
}

    

-(void)insertTaskToDatabase:(NSString *)text {
    if (text.length > 0 && ![text isEqualToString:@""])
    {
        
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
    [self.tableViewOutlet reloadData];
}




- (IBAction)insertButtonAction:(id)sender {
    
    NSString *text = self.textFieldToEnterTask.text;
    
    [self insertTaskToDatabase:text];

}



@end
