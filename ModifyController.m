//
//  ModifyController.m
//  RMToDoList
//
//  Created by Student P_05 on 30/08/16.
//  Copyright © 2016 Rahul Mankar. All rights reserved.
//

#import "ModifyController.h"

@interface ModifyController ()

@end

@implementation ModifyController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self initialiseScreen];
    // Do any additional setup after loading the view.
}

-(void)initialiseScreen{
    
    selectedTask=self.taskSelected;
    self.updateTaskTextField.text=selectedTask.textName;
    self.updateButtonOutlet.enabled=NO;
    priviousTextInTextField=selectedTask.textName;
    self.updateTaskTextField.enabled=NO;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)editTaskButtonAction:(id)sender {
}

- (IBAction)deleteTaskButtonAction:(id)sender {
}

- (IBAction)updateTaskButtonAction:(id)sender {
}

-(BOOL)textFieldShouldReturn:(UITextField *)updateTaskTextField {
    [self.updateTaskTextField resignFirstResponder];
//    NSString *tempText=self.updateTaskTextField;
    
    
    return YES;
}
@end
