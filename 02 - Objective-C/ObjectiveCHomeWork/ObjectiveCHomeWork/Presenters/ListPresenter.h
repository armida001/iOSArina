//
//  ListViewController.h
//  ObjectiveCHomeWork
//
//  Created by Arina Zimonina on 04.10.2021.
//

#ifndef ListPresenter_h
#define ListPresenter_h

#import <Foundation/Foundation.h>
#import "ObjectiveCHomeWork-Swift.h"
#import "ListTableViewAdapter.h"

@class Person;
@class PersonParameters;

@interface ListPresenter : NSObject

NS_ASSUME_NONNULL_BEGIN
- (NSArray*) users;
- (void) addUser: (Person *) newUser;
- (void) setUsers: (NSArray<Person*> *) newUsers;
@property(nonatomic, retain, readwrite) ListTableViewAdapter *tableAdapter;
NS_ASSUME_NONNULL_END

@end

#endif
