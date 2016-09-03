//
//  RMDatabaseManager.m
//  RMToDoList
//
//  Created by Student P_02 on 24/08/16.
//  Copyright © 2016 Rahul Mankar. All rights reserved.
//

#import "RMDatabaseManager.h"

@implementation RMDatabaseManager

+(instancetype)sharedManager{
    static RMDatabaseManager *sharedInstance;
    if (sharedInstance==nil) {
        sharedInstance=[[RMDatabaseManager alloc]init];
        
    }
    return sharedInstance;
}
-(NSString*)getPathOfDatabase{
    NSArray* documentDirectory=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *databasePath=[[documentDirectory objectAtIndex:0] stringByAppendingPathComponent:kDatabaseFullName];
    NSLog(@"DATABASE PATH IS: \n%@\n",databasePath);
    return databasePath;
    
}
-(void)copyDataBaseFromMainBundleToSandBOX{
    
    NSString *pathOfSource=[[NSBundle mainBundle]pathForResource:kDatabaseName ofType:kDatabaseExtension];
    NSLog(@"%@",pathOfSource);
    NSString *pathOfDestination=[self getPathOfDatabase];
    
    BOOL isSourceExistsInMainBundle=[[NSFileManager defaultManager]fileExistsAtPath:pathOfSource];
    BOOL isDestinationExistsInDocDirectory=[[NSFileManager defaultManager]fileExistsAtPath:pathOfDestination];
    
    
    if (isSourceExistsInMainBundle) {
        
        if (isDestinationExistsInDocDirectory) {
            
            NSLog(@"database already copied in document directory");
        }
        else
        {
            NSError *error;
            [[NSFileManager defaultManager]copyItemAtPath:pathOfSource toPath:pathOfDestination error:&error];
            if (error) {
                NSLog(@"%@",error.localizedDescription);
            }
            else
                NSLog(@"database is successfully copied to docDir");
            
        }
    }
    else
    NSLog(@"database is not present in main bundle please check.");
    
}



-(BOOL)executeGivenQuery:(NSString *)query{
    
    BOOL status=false;
    sqlite3_stmt *statment;
    const char *UTFQuery=[query UTF8String];
    const char *UTFDatabasePath=[[self getPathOfDatabase] UTF8String];
    if (sqlite3_open(UTFDatabasePath,&myDataBase) == SQLITE_OK){
   
        if (sqlite3_prepare_v2(myDataBase,UTFQuery,-1,&statment,NULL)==SQLITE_OK) {
            if (sqlite3_step(statment) == SQLITE_DONE) {
                status = true;
            }
            }
        
        sqlite3_close(myDataBase);
        }
    return status;
    
    }

//-(NSArray *)executeSelectedQuery:(NSString *)query{

-(BOOL)insertTask:(Tasks *)taskModel{

    
    NSString *insertQuery=[NSString stringWithFormat:@"INSERT INTO TODOLISTDATA (TASK_ID,TASK_NAME,COMPLETED) VALUES('%@','%@','%d')",taskModel.Task_iD,taskModel.textName,taskModel.completed];
    NSLog(@"%@",insertQuery);
    
    if ([[RMDatabaseManager sharedManager]executeGivenQuery:insertQuery]==YES) {
        return YES;
    }
    else
    {
        return NO;
    }
    
}

-(NSArray *)getAllTask {
    
    NSMutableArray *allTasks = [[NSMutableArray alloc]init];
    
    NSString *selectQuery = @"SELECT * FROM TODOLISTDATA";
    
    const char * UTFQuery = [selectQuery UTF8String];
    
    sqlite3_stmt *statement;
    
    NSString *databasePath = [self getPathOfDatabase];
    const char * UTFDatabasePath = [databasePath UTF8String];

    
    if (sqlite3_open(UTFDatabasePath, &myDataBase) == SQLITE_OK) {
        if (sqlite3_prepare_v2(myDataBase, UTFQuery, -1, &statement, NULL) == SQLITE_OK) {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                
                int row_id = sqlite3_column_bytes(statement,0);
                
                const unsigned char * task_id = sqlite3_column_text(statement,1);
                
                NSString *task_idString = [NSString stringWithFormat:@"%s",(const char *)task_id];
                
                const unsigned char * text = sqlite3_column_text(statement,2);
                
                NSString *textString = [NSString stringWithFormat:@"%s",(const char *)text];
                
                
                int completed = sqlite3_column_bytes(statement,3);
                
                BOOL completedBOOL;
                
                if (completed == 0) {
                    completedBOOL = NO;
                }
                else if (completed == 1) {
                    completedBOOL = YES;
                }
                else {
                    completedBOOL = NO;
                }
                
                Tasks *taskFromDatabase = [[Tasks alloc]initWithID:row_id Task_iD:task_idString andText:textString andCompleted:completedBOOL];
                
                [allTasks addObject:taskFromDatabase];
            }
            
        }
        sqlite3_close(myDataBase);
    }
    
    return (NSArray *)allTasks;
    
    
}

-(BOOL)updatePreviousInsertedTask:(Tasks *)taskModel{

    NSString *queryToUpdateTask=[NSString stringWithFormat:@"UPDATE TODOLISTDATA SET TASK_NAME='%@',COMPLETED='%d', TASK_ID='%@'",taskModel.textName,taskModel.completed,taskModel.Task_iD];
    
    if ([[RMDatabaseManager sharedManager]executeGivenQuery:queryToUpdateTask]) {
        NSLog(@"success: Updated Tasks %d",taskModel.Id);
        return YES;
    }
    else
    {
        NSLog(@"Unable to update task.");
                return NO;
    }

}






@end
