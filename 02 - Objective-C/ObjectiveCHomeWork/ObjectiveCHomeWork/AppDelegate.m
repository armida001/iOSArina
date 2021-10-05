//
//  AppDelegate.m
//  ObjectiveCHomeWork
//
//  Created by Arina Zimonina on 04.10.2021.
//

#import "AppDelegate.h"
#import "Prototype.h"
#import "ObjectiveCHomeWork-Swift.h"

@class Person;
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //Тест домашней работы по GoF паттернам. Выбран паттерн: Прототип
    Test *test = [Test new];
    [test someClientCode];
    
    //Тест домашней работы по 04 - Interoperability
    Person *object = [Person new];
    NSLog(@"Client: Testing client code with the base factory type:");
    [object testBuyClothesWithFactory: [SewFabric new]];
          
    NSLog(@"Client: Testing the same client code with modern factory type:");
    [object testBuyClothesWithFactory: [ModernSewFabric new]];
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
