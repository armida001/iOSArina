//
//  ListTableViewAdapter.h
//  ObjectiveCHomeWork
//
//  Created by Arina Zimonina on 04.10.2021.
//

#ifndef ListTableViewAdapter_h
#define ListTableViewAdapter_h
#import <UIKit/UIKit.h>
#import "ObjectiveCHomeWork-Swift.h"

@class Person;
@class PersonParameters;

typedef void (^DetailUserBlock)(Person*_Nullable);

@interface ListTableViewAdapter : NSObject <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, nonnull, retain, readwrite) NSArray<Person*> *userArray;
@property(nonatomic, copy, nullable, readwrite) DetailUserBlock showDetail;

@end
#endif /* ListTableViewAdapter_h */
