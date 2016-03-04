//
//  AppDelegate.h
//  SimpleLoveAPP
//
//  Created by lanou3g on 16/2/29.
//  Copyright © 2016年 张泽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import <RongIMLib/RongIMLib.h>
#import <RongIMKit/RongIMKit.h>
@interface AppDelegate : UIResponder <UIApplicationDelegate,RCIMConnectionStatusDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

