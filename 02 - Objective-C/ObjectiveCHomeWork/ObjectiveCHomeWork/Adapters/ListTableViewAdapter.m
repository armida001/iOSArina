//
//  ListTableViewAdapter.m
//  ObjectiveCHomeWork
//
//  Created by Arina Zimonina on 04.10.2021.
//

#import <Foundation/Foundation.h>
#import "ListTableViewAdapter.h"
#import "ListTableViewCell.h"

@implementation ListTableViewAdapter

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *nCell = [tableView dequeueReusableCellWithIdentifier: ListTableViewCell.cellId forIndexPath: indexPath];
    if(nCell == nil) {
        nCell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle reuseIdentifier: ListTableViewCell.cellId];
    }
        
    Person *user = self.userArray[indexPath.row];
    nCell.textLabel.text = user.name;
    PersonParameters *params = user.parameters;
    nCell.detailTextLabel.text = [[NSString alloc] initWithFormat: @"%@ - %@ - %@", params.og.stringValue, params.ot.stringValue, params.ob.stringValue];
    return nCell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.userArray.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return  1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    Person *user = self.userArray[indexPath.row];
    self.showDetail(user);
}

@end
