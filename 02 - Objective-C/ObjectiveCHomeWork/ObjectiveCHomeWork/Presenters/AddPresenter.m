//
//  ListViewController.m
//  ObjectiveCHomeWork
//
//  Created by Arina Zimonina on 04.10.2021.
//

#import <Foundation/Foundation.h>
#import "AddPresenter.h"

@implementation AddPresenter : NSObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.user = [UserParams new];
    }
    return self;
}

- (void) sendUser {
    //send self.user to server
}

@end
