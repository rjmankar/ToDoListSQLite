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
@end
