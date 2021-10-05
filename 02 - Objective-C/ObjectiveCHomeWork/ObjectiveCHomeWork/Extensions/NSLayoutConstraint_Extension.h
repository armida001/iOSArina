//
//  NSLayoutConstraint+NSLayoutConstraint_Extension.h
//  ObjectiveCHomeWork
//
//  Created by Arina Zimonina on 05.10.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSLayoutConstraint (Creation)

+ (NSLayoutConstraint*) createEqualTop: (UIView*) topItem bottom: (UIView*) bottomItem distance: (CGFloat) distance;
+ (NSLayoutConstraint*) createEqualLeading: (UIView*) item parrent: (UIView*) parentItem distance: (CGFloat) distance;
+ (NSLayoutConstraint*) createEqualTrailing: (UIView*) item parent: (UIView*) parentItem distance: (CGFloat) distance;
+ (NSLayoutConstraint*) createLessOrEqualBottom: (UIView*) item parent: (UIView*) parentItem distance: (CGFloat) distance;
+ (NSLayoutConstraint*) createEqualTop: (UIView*) item parent: (UIView*) parentItem distance: (CGFloat) distance;
+ (NSLayoutConstraint*) createItem: (UIView*) item height: (CGFloat) height;

@end

NS_ASSUME_NONNULL_END
