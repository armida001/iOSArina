//
//  ListViewController.h
//  ObjectiveCHomeWork
//
//  Created by Arina Zimonina on 04.10.2021.
//

#ifndef DetailViewController_h
#define DetailViewController_h
#import <UIKit/UIKit.h>
#import "ObjectiveCHomeWork-Swift.h"

@class Person;
@interface DetailViewController: UIViewController

- (void) update: (Person *) user;

@end


#endif
