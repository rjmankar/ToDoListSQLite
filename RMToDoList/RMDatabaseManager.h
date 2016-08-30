//
//  RMDatabaseManager.h
//  RMToDoList
//
//  Created by Student P_02 on 24/08/16.
//  Copyright © 2016 Rahul Mankar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AllConstants.h"
#import "Tasks.h"
#import <sqlite3.h>

@interface RMDatabaseManager : NSObject
{
    sqlite3 *myDataBase;
    
}

+(instancetype)sharedManager;
-(NSString*)getPathOfDatabase;
-(void)copyDataBaseFromMainBundleToSandBOX;
-(BOOL)executeGivenQuery:(NSString *)query;

-(NSArray *)getAllTask;

-(BOOL)insertTask:(Tasks *)taskModel;



@end
