//
//  ListViewController.m
//  ObjectiveCHomeWork
//
//  Created by Arina Zimonina on 04.10.2021.
//

#import "ListPresenter.h"

@interface ListPresenter ()
@end


@implementation ListPresenter : NSObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        _tableAdapter = [ListTableViewAdapter new];
    }
    return self;
}

- (NSArray*) users {
    return _tableAdapter.userArray;
}

- (void) addUser: (Person *) newUser {
    _tableAdapter.userArray = [_tableAdapter.userArray arrayByAddingObject: newUser];
}

- (void) setUsers: (NSArray<Person*> *) newUsers {
    _tableAdapter.userArray = newUsers;
}

@end
