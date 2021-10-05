//
//  ViewController.m
//  ObjectiveCHomeWork
//
//  Created by Arina Zimonina on 04.10.2021.
//

#import "AddViewController.h"
#import "AddPresenter.h"
#import "NSLayoutConstraint_Extension.h"
#import "ViewController_Protocol.h"

@interface AddViewController () <ViewController_Protocol>

@property(strong, nonatomic) UITextField *nameTextField;
@property(strong, nonatomic) UITextField *ogTextField;
@property(strong, nonatomic) UITextField *otTextField;
@property(strong, nonatomic) UITextField *obTextField;
@property(strong, nonatomic) UIButton *okButton;
@property(strong, nonatomic) AddPresenter *presenter;

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _presenter = [AddPresenter new];
    _nameTextField = [UITextField new];
    _ogTextField = [UITextField new];
    _otTextField = [UITextField new];
    _obTextField = [UITextField new];
    
    [_nameTextField setTextColor: UIColor.blackColor];
    _nameTextField.placeholder = @"Имя";
    _nameTextField.delegate = self;
    _nameTextField.keyboardType = UIKeyboardTypeDefault;
    
    [_ogTextField setTextColor: UIColor.blackColor];
    _ogTextField.placeholder = @"Обхват груди";
    _ogTextField.delegate = self;
    _ogTextField.keyboardType = UIKeyboardTypeNumberPad;
    
    [_otTextField setTextColor: UIColor.blackColor];
    _otTextField.placeholder = @"Обхват талии";
    _otTextField.delegate = self;
    _otTextField.keyboardType = UIKeyboardTypeNumberPad;
    
    [_obTextField setTextColor: UIColor.blackColor];
    _obTextField.placeholder = @"Обхват бёдер";
    _obTextField.delegate = self;
    _obTextField.keyboardType = UIKeyboardTypeNumberPad;
    
    _okButton = [UIButton new];
    [_okButton setTitle: @"Сохранить" forState: UIControlStateNormal];
    [_okButton setTitle: @"Сохранить" forState: UIControlStateSelected];
    [_okButton setTitleColor: UIColor.blackColor forState: UIControlStateNormal];
    [_okButton setTitleColor: UIColor.blackColor forState: UIControlStateSelected];
    [_okButton addTarget: self action: @selector(buttonClick) forControlEvents: UIControlEventTouchUpInside];
    
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self setupConstraints];
}

- (void) setupConstraints {
    [self.view addSubview: _nameTextField];
    [self.view addSubview: _ogTextField];
    [self.view addSubview: _otTextField];
    [self.view addSubview: _obTextField];
    [self.view addSubview: _okButton];
    
    _nameTextField.translatesAutoresizingMaskIntoConstraints = NO;
    _ogTextField.translatesAutoresizingMaskIntoConstraints = NO;
    _otTextField.translatesAutoresizingMaskIntoConstraints = NO;
    _obTextField.translatesAutoresizingMaskIntoConstraints = NO;
    _okButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.view.translatesAutoresizingMaskIntoConstraints = NO;
    
    CGFloat left = 20.0f;
    CGFloat right = -20.0f;
    CGFloat height = 40.0f;
    
    NSArray *constrainsts = @[
        [NSLayoutConstraint createEqualLeading: _nameTextField parrent: self.view distance: left],
        [NSLayoutConstraint createEqualTrailing: _nameTextField parent: self.view distance: right],
        [NSLayoutConstraint createEqualTop: _nameTextField parent: self.view distance: 20],
        [NSLayoutConstraint createItem: _nameTextField height: height],
        
        [NSLayoutConstraint createEqualTop: _ogTextField bottom: _nameTextField distance: 20],
        [NSLayoutConstraint createEqualLeading: _ogTextField parrent: self.view distance: left],
        [NSLayoutConstraint createEqualTrailing: _ogTextField parent: self.view distance: right],
        [NSLayoutConstraint createItem: _ogTextField height: height],
        
        [NSLayoutConstraint createEqualTop: _otTextField bottom: _ogTextField distance: 20],
        [NSLayoutConstraint createEqualLeading: _otTextField parrent: self.view distance: left],
        [NSLayoutConstraint createEqualTrailing: _otTextField parent: self.view distance: right],
        [NSLayoutConstraint createItem: _otTextField height: height],
        
        [NSLayoutConstraint createEqualTop: _obTextField bottom: _otTextField distance: 20],
        [NSLayoutConstraint createEqualLeading: _obTextField parrent: self.view distance: left],
        [NSLayoutConstraint createEqualTrailing: _obTextField parent: self.view distance: right],
        [NSLayoutConstraint createItem: _obTextField height: height],
        
        [NSLayoutConstraint createEqualTop: _okButton bottom: _obTextField distance: 20],
        [NSLayoutConstraint createEqualLeading: _okButton parrent: self.view distance: 60.0],
        [NSLayoutConstraint createEqualTrailing: _okButton parent: self.view distance: -60.0],
        [NSLayoutConstraint createItem: _okButton height: 60.0],
        [NSLayoutConstraint createLessOrEqualBottom: _okButton parent: self.view distance: 0.0]
    ];
    [self.view addConstraints: constrainsts];
    [NSLayoutConstraint activateConstraints: constrainsts];
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    [textField becomeFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return  true;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    return true;
}

- (void) buttonClick {
    self.presenter.user.name = _nameTextField.text;
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    
    self.presenter.user.og = [f numberFromString: _ogTextField.text];
    self.presenter.user.ot = [f numberFromString: _otTextField.text];
    self.presenter.user.ob = [f numberFromString: _obTextField.text];
    
    self.completion(self.presenter.user);
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
