//
//  ViewController.h
//  ObjectiveCHomeWork
//
//  Created by Arina Zimonina on 04.10.2021.
//

#import <UIKit/UIKit.h>
#import "ObjectiveCHomeWork-Swift.h"

@class Person;
@class PersonParameters;

typedef void (^AddUserBlock)(Person*_Nullable);

@interface AddViewController: UIViewController<UITextFieldDelegate> 

@property(nonatomic, copy, nullable, readwrite) AddUserBlock completion;


@end

