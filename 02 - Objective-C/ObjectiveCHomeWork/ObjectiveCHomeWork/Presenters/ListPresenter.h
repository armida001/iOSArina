//
//  ListViewController.h
//  ObjectiveCHomeWork
//
//  Created by Arina Zimonina on 04.10.2021.
//

#ifndef ListPresenter_h
#define ListPresenter_h

#import <Foundation/Foundation.h>
#import "UserParams.h"
#import "ListTableViewAdapter.h"

@interface ListPresenter : NSObject

NS_ASSUME_NONNULL_BEGIN
- (NSArray*) users;
- (void) addUser: (UserParams *) newUser;
- (void) setUsers: (NSArray<UserParams*> *) newUsers;
@property(nonatomic, retain, readwrite) ListTableViewAdapter *tableAdapter;
NS_ASSUME_NONNULL_END

@end

#endif
