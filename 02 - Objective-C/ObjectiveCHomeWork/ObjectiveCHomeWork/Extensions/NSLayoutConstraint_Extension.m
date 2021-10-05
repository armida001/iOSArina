//
//  NSLayoutConstraint_Extension.m
//  ObjectiveCHomeWork
//
//  Created by Arina Zimonina on 05.10.2021.
//

#import <Foundation/Foundation.h>
#import "NSLayoutConstraint_Extension.h"

@implementation NSLayoutConstraint (Creation)

+ (NSLayoutConstraint*) createEqualTop: (UIView*) topItem bottom: (UIView*) bottomItem distance: (CGFloat) distance {
    return [NSLayoutConstraint constraintWithItem: topItem
                                        attribute: NSLayoutAttributeTop
                                        relatedBy: NSLayoutRelationEqual
                                           toItem: bottomItem
                                        attribute: NSLayoutAttributeBottom
                                       multiplier: 1.0
                                         constant: distance];
}

+ (NSLayoutConstraint*) createEqualLeading: (UIView*) item parrent: (UIView*) parentItem distance: (CGFloat) distance {
    return [NSLayoutConstraint constraintWithItem: item
                                        attribute: NSLayoutAttributeLeading
                                        relatedBy: NSLayoutRelationEqual
                                           toItem: parentItem
                                        attribute: NSLayoutAttributeLeading
                                       multiplier: 1.0
                                         constant: distance];
}

+ (NSLayoutConstraint*) createEqualTrailing: (UIView*) item parent: (UIView*) parentItem distance: (CGFloat) distance {
    return [NSLayoutConstraint constraintWithItem: item
                                        attribute: NSLayoutAttributeTrailing
                                        relatedBy: NSLayoutRelationEqual
                                           toItem: parentItem
                                        attribute: NSLayoutAttributeTrailing
                                       multiplier: 1.0
                                         constant: distance];
}

+ (NSLayoutConstraint*) createLessOrEqualBottom: (UIView*) item parent: (UIView*) parentItem distance: (CGFloat) distance {
    return [NSLayoutConstraint constraintWithItem: item
                                        attribute: NSLayoutAttributeBottom
                                        relatedBy: NSLayoutRelationLessThanOrEqual
                                           toItem: parentItem
                                        attribute: NSLayoutAttributeBottom
                                       multiplier: 1.0
                                         constant: distance];
}

+ (NSLayoutConstraint*) createItem: (UIView*) item height: (CGFloat) height {
    return [NSLayoutConstraint constraintWithItem: item
                                        attribute: NSLayoutAttributeHeight
                                        relatedBy: NSLayoutRelationEqual
                                           toItem: nil
                                        attribute: NSLayoutAttributeNotAnAttribute
                                       multiplier: 0.0
                                         constant: height];
}

+ (NSLayoutConstraint*) createEqualTop: (UIView*) item parent: (UIView*) parentItem distance: (CGFloat) distance {
    return [NSLayoutConstraint constraintWithItem: item
                                        attribute: NSLayoutAttributeTop
                                        relatedBy: NSLayoutRelationLessThanOrEqual
                                           toItem: parentItem
                                        attribute: NSLayoutAttributeTop
                                       multiplier: 1.0
                                         constant: distance];
}

@end
