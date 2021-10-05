//
//  Prototype.h
//  ObjectiveCHomeWork
//
//  Created by Arina Zimonina on 05.10.2021.
//
#import <Foundation/Foundation.h>

//Домашняя работа по GoF паттернам. Выбран паттерн: Прототип

@interface BaseClass: NSObject <NSCopying>
    
@property(nonatomic, assign, readwrite) NSNumber *intValue;
@property(nonatomic, assign, readwrite) NSString *stringValue;

@end

@interface SubClass: BaseClass

@end

@interface Test: NSObject
- (void) someClientCode;
@end
