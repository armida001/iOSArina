//
//  ListViewController.h
//  ObjectiveCHomeWork
//
//  Created by Arina Zimonina on 04.10.2021.
//

#import "ObjectiveCHomeWork-Swift.h"

@class Person;

@interface AddPresenter : NSObject

@property (nonatomic, retain) Person *user;

- (void) sendUser;

@end

