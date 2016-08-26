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
    NSLog(@"DATABASE PATH \n%@\n",databasePath);
    return databasePath;
    
}
-(void)copyDataBaseFromMainBundleToSandBOX{
    
    
    
    
}
@end
