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
-(void)checkText:(NSString *)previousText current:(NSString *)currentText {
    
    if ([currentText isEqualToString:previousText]) {
        self.updateButtonOutlet.enabled = NO;
    }
    else {
        self.updateButtonOutlet.enabled = YES;
    }
    
    
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
    UIButton *button=sender;
    if ([self.editButtonOutlet.titleLabel.text isEqualToString:@"Edit"]) {
        
        [button setTitle:@"Reset" forState:UIControlStateNormal];
    self.updateTaskTextField.enabled=YES;
        self.updateButtonOutlet.enabled=YES;
        
    }
}

- (IBAction)deleteTaskButtonAction:(id)sender {
}

- (IBAction)updateTaskButtonAction:(id)sender {
    if ([[RMDatabaseManager sharedManager]updatePreviousInsertedTask:selectedTask]) {
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    else {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Error" message:@"Unable to update" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *ok = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [alert dismissViewControllerAnimated:YES completion:nil];
        }];
        [alert addAction:ok];
}
}

-(BOOL)textFieldShouldReturn:(UITextField *)updateTaskTextField {
    
    selectedTask.textName=self.updateTaskTextField.text;
    
[updateTaskTextField resignFirstResponder];
    
    newTextInTextField = updateTaskTextField.text;
    [self checkText:priviousTextInTextField current:newTextInTextField];
    return YES;

}
@end
