//
//  ListTableViewAdapter.h
//  ObjectiveCHomeWork
//
//  Created by Arina Zimonina on 04.10.2021.
//

#ifndef ListTableViewAdapter_h
#define ListTableViewAdapter_h
#import <UIKit/UIKit.h>
#import "UserParams.h"

typedef void (^DetailUserBlock)(UserParams*_Nullable);

@interface ListTableViewAdapter : NSObject <UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, nonnull, retain, readwrite) NSArray<UserParams*> *userArray;
@property(nonatomic, copy, nullable, readwrite) DetailUserBlock showDetail;

@end
#endif /* ListTableViewAdapter_h */
