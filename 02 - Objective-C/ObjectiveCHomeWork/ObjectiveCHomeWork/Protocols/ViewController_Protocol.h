//
//  ViewController.h
//  ObjectiveCHomeWork
//
//  Created by Arina Zimonina on 05.10.2021.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol ViewController_Protocol <NSObject>

- (void) setupConstraints;

@optional
- (void) buttonClick;

@end

NS_ASSUME_NONNULL_END
