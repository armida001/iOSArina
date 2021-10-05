//
//  ListViewController.m
//  ObjectiveCHomeWork
//
//  Created by Arina Zimonina on 04.10.2021.
//

#import <Foundation/Foundation.h>
#import "ListTableViewCell.h"

@interface ListTableViewCell ()
@end

@implementation ListTableViewCell
static NSString *_cellId = @"ListTableViewCell";

+ (NSString *)cellId {
  return _cellId;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:(UITableViewCellStyleSubtitle) reuseIdentifier: ListTableViewCell.cellId];
    if (self) {
        
    }
    return self;
}

@end
