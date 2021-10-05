//
//  Prototype.m
//  ObjectiveCHomeWork
//
//  Created by Arina Zimonina on 05.10.2021.
//

#import <Foundation/Foundation.h>
#import "Prototype.h"

//Домашняя работа по GoF паттернам. Выбран паттерн: Прототип

@implementation BaseClass: NSObject

- (instancetype)init: (NSNumber*) intValue stringValue: (NSString*) stringValue
{
    self = [super init];
    if (self) {
        self.intValue = intValue;
        self.stringValue = stringValue;
    }
    return self;
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    BaseClass *prototype = [[self class] allocWithZone:zone];
    
    prototype.intValue = _intValue;
    prototype.stringValue = _stringValue;
    NSLog(@"Values defined in BaseClass have been cloned!");
    return prototype;
}

- (BOOL)isEqual:(BaseClass*)other
{
    if (other.intValue.intValue == self.intValue.intValue && other.stringValue == self.stringValue) {
        return YES;
    } else if (![super isEqual:other]) {
        return NO;
    } else {
        return NO;
    }
}

- (NSUInteger)hash
{
    return [self.intValue hash] ^ [self.stringValue hash];
}
@end

@interface SubClass()
@property(nonatomic,assign) BOOL boolValue;

@end

@implementation SubClass: BaseClass
-(nonnull id)copy {
    return [self copyWithZone: nil];
}

- (nonnull id)copyWithZone:(nullable NSZone *)zone {
    BaseClass *prototype = [super copyWithZone: zone];
    SubClass *storage = (SubClass*)prototype;
    storage.boolValue = _boolValue;
    NSLog(@"Values defined in SubClass have been cloned!");
    return storage;
}
@end

@implementation Test: NSObject
- (void) someClientCode {
    SubClass *original = [[SubClass alloc] init: @2 stringValue: @"Value2"];
    id copied = [original copy];
    if(![copied isKindOfClass: SubClass.class]) {
        return;
    }

    if(![copied isEqual: original]) {
        return;
    }

    NSLog(@"The original object is equal to the copied object!");
}
@end

