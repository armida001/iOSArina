//
//  ListViewController.m
//  ObjectiveCHomeWork
//
//  Created by Arina Zimonina on 04.10.2021.
//

#import <Foundation/Foundation.h>
#import "ListViewController.h"
#import "ListPresenter.h"
#import "ListTableViewAdapter.h"
#import "ListTableViewCell.h"
#import "DetailViewController.h"
#import "AddViewController.h"
#import "NSLayoutConstraint_Extension.h"
#import "ViewController_Protocol.h"

@interface ListViewController() <ViewController_Protocol>

@property(nonatomic, retain) UITableView *tableView;
@property(nonatomic, retain) UIButton *addButton;
@property(nonatomic, retain) ListPresenter *presenter;

@end

@implementation ListViewController

- (void) initTestData {
    UserParams *item = [UserParams new];
    item.name = @"User 1";
    item.og = @90;
    item.ot = @60;
    item.ob = @90;
    
    UserParams *item1 = [UserParams new];
    item1.name = @"User 2";
    item1.og = @100;
    item1.ot = @90;
    item1.ob = @90;
    
    UserParams *item2 = [UserParams new];
    item2.name = @"User 3";
    item2.og = @90;
    item2.ot = @80;
    item2.ob = @104;
    
    [_presenter setUsers: @[item, item1, item2]];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _presenter = [ListPresenter new];
    [self initTestData];
    [self initAddButton];
    [self initTableView];
    
    DetailUserBlock block = ^(UserParams *nUser) {
        DetailViewController *viewController = [[DetailViewController alloc] init];
        [viewController update: nUser];
        [self presentViewController: viewController animated: YES completion: nil];
    };
    [_presenter.tableAdapter setShowDetail: block];
    
    [self setupConstraints];
}

- (void) initAddButton {
    _addButton = [UIButton new];
    [_addButton setTitle: @"Добавить" forState: UIControlStateNormal];
    [_addButton setTitle: @"Добавить" forState: UIControlStateSelected];
    [_addButton setTitleColor: UIColor.blackColor forState: UIControlStateNormal];
    [_addButton setTitleColor: UIColor.blackColor forState: UIControlStateSelected];
    [_addButton addTarget: self action: @selector(buttonClick) forControlEvents: UIControlEventTouchUpInside];
}

- (void) initTableView {
    _tableView = [UITableView new];
    [_tableView registerClass: ListTableViewCell.class forCellReuseIdentifier: ListTableViewCell.cellId];
    _tableView.delegate = _presenter.tableAdapter;
    _tableView.dataSource = _presenter.tableAdapter;
}

- (void) setupConstraints {
    [self.view addSubview: _addButton];
    [self.view addSubview: _tableView];
    
    _addButton.translatesAutoresizingMaskIntoConstraints = NO;
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    NSArray *constrainsts = @[
        [NSLayoutConstraint createEqualLeading: _addButton parrent: self.view distance: 0.0],
        [NSLayoutConstraint createEqualTrailing: _addButton parent: self.view distance: 0.0],
        [NSLayoutConstraint createEqualTop: _addButton parent: self.view distance: 20],
        [NSLayoutConstraint createItem: _addButton height: 60.0],
        
        [NSLayoutConstraint createEqualTop: _tableView bottom: _addButton distance: 0],
        [NSLayoutConstraint createEqualLeading: _tableView parrent: self.view distance: 0.0],
        [NSLayoutConstraint createEqualTrailing: _tableView parent: self.view distance: 0.0],
        [NSLayoutConstraint constraintWithItem:_tableView
                                     attribute: NSLayoutAttributeBottom
                                     relatedBy: NSLayoutRelationEqual
                                        toItem: self.view
                                     attribute: NSLayoutAttributeBottom
                                    multiplier: 1.0
                                      constant: 0.0]];
    [self.view addConstraints: constrainsts];
    [NSLayoutConstraint activateConstraints: constrainsts];
}

- (void) buttonClick {
    AddViewController *viewController = [[AddViewController alloc] init];
    AddUserBlock blockName = ^(UserParams *nUser) {
        [self.presenter addUser: nUser];
        [self.tableView reloadData];
        [viewController dismissViewControllerAnimated: YES completion: nil];
    };
    [viewController setCompletion: blockName];
    [self presentViewController: viewController animated: YES completion: nil];
}
@end
