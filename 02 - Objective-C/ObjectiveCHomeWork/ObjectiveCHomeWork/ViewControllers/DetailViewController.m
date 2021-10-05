//
//  ListViewController.m
//  ObjectiveCHomeWork
//
//  Created by Arina Zimonina on 04.10.2021.
//

#import <Foundation/Foundation.h>
#import "DetailViewController.h"
#import "DetailPresenter.h"
#import "NSLayoutConstraint_Extension.h"
#import "ViewController_Protocol.h"

@interface DetailViewController () <ViewController_Protocol>

@property(nonatomic, retain) UILabel *nameLabel;
@property(nonatomic, retain) UILabel *ogLabel;
@property(nonatomic, retain) UILabel *otLabel;
@property(nonatomic, retain) UILabel *obLabel;
@property(nonatomic, retain) DetailPresenter *presenter;

@end

@implementation DetailViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        _presenter = [DetailPresenter new];
        _nameLabel = [UILabel new];
        _ogLabel = [UILabel new];
        _otLabel = [UILabel new];
        _obLabel = [UILabel new];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [_nameLabel setTextColor: UIColor.blackColor];
    [_ogLabel setTextColor: UIColor.blackColor];
    [_otLabel setTextColor: UIColor.blackColor];
    [_obLabel setTextColor: UIColor.blackColor];
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self setupConstraints];
}

- (void) setupConstraints {
    [self.view addSubview: _nameLabel];
    [self.view addSubview: _ogLabel];
    [self.view addSubview: _otLabel];
    [self.view addSubview: _obLabel];
    
    _nameLabel.translatesAutoresizingMaskIntoConstraints = false;
    _ogLabel.translatesAutoresizingMaskIntoConstraints = false;
    _otLabel.translatesAutoresizingMaskIntoConstraints = false;
    _obLabel.translatesAutoresizingMaskIntoConstraints = false;
    self.view.translatesAutoresizingMaskIntoConstraints = false;
    
    CGFloat height = 30.0f;
    CGFloat left = 20.0f;
    CGFloat right = -20.0f;
    
    NSArray *constrainsts = @[
        [NSLayoutConstraint createEqualLeading: _nameLabel parrent: self.view  distance: left],
        [NSLayoutConstraint createEqualTrailing: _nameLabel parent: self.view distance: right],
        [NSLayoutConstraint createEqualTop: _nameLabel parent: self.view distance: 20],
        [NSLayoutConstraint createItem: _nameLabel height: height],
        
        [NSLayoutConstraint createEqualTop: _ogLabel bottom: _nameLabel distance: 10],
        [NSLayoutConstraint createEqualLeading: _ogLabel parrent: self.view  distance: left],
        [NSLayoutConstraint createEqualTrailing: _ogLabel parent: self.view distance: right],
        [NSLayoutConstraint createItem: _ogLabel height: height],
        
        [NSLayoutConstraint createEqualTop: _otLabel bottom: _ogLabel distance: 10],
        [NSLayoutConstraint createEqualLeading: _otLabel parrent: self.view  distance: left],
        [NSLayoutConstraint createEqualTrailing: _otLabel parent: self.view distance: right],
        [NSLayoutConstraint createItem: _otLabel height: height],
        
        [NSLayoutConstraint createEqualTop: _obLabel bottom: _otLabel distance: 10],
        [NSLayoutConstraint createEqualLeading: _obLabel parrent: self.view  distance: left],
        [NSLayoutConstraint createEqualTrailing: _obLabel parent: self.view distance: right],
        [NSLayoutConstraint createItem: _obLabel height: height],
        [NSLayoutConstraint createLessOrEqualBottom: _obLabel parent: self.view distance:20],
    ];
    [self.view addConstraints: constrainsts];
    [NSLayoutConstraint activateConstraints: constrainsts];
}

- (void) update: (UserParams *) user {
    _presenter.user = user;
    
    _nameLabel.text = [[NSString alloc] initWithFormat: @"Имя: %@", user.name];
    _ogLabel.text = [[NSString alloc] initWithFormat: @"Обхват груди: %@", user.og.stringValue];
    _otLabel.text = [[NSString alloc] initWithFormat: @"Обхват талии: %@", user.ot.stringValue];
    _obLabel.text = [[NSString alloc] initWithFormat: @"Обхват бёдер: %@", user.ob.stringValue];
}

@end
