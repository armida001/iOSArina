//
//  ListViewController.h
//  ObjectiveCHomeWork
//
//  Created by Arina Zimonina on 04.10.2021.
//

#import "UserParams.h"

@interface AddPresenter : NSObject

@property (nonatomic, retain) UserParams *user;

- (void) sendUser;

@end

