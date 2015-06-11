//
//  ViewController.m
//  StoryBoard
//
//  Created by Zeshan Hayder on 11/06/2015.
//  Copyright (c) 2015 Putitout. All rights reserved.
//

#import "ViewController.h"
#import "RegistrationTableViewCell.h"

@interface ViewController ()
@property (nonatomic, strong) NSArray *tableFields;
@property (nonatomic, strong) NSString *firstName;
@property (nonatomic, strong) NSString *surname;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *password;

@property (weak, nonatomic) IBOutlet UITableView *registrationTable;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.tableFields = @[NSLocalizedString(@"First name", @"First name"),NSLocalizedString(@"Surname", @"Surname"),NSLocalizedString(@"Email", @"Email"),NSLocalizedString(@"Pick a password", @"Pick a password")];
    
    [self.registrationTable registerClass:[RegistrationTableViewCell class] forCellReuseIdentifier:@"RegistrationCell"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UITableview Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 58;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tableFields.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"RegistrationCell";
    
    RegistrationTableViewCell *cell = (RegistrationTableViewCell *)[tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    
    UITextField *genericTextField = (UITextField *)[cell viewWithTag:1111];
    
    switch (indexPath.row) {
        case PIOTextBoxTypeEmail:
            genericTextField.keyboardType = UIKeyboardTypeEmailAddress;
            genericTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
            break;
        case PIOTextBoxTypePassword:
            genericTextField.secureTextEntry = YES;
            break;
    }
//    NSLog(@"%@",self.tableFields[indexPath.row]);
    genericTextField.delegate = self;
    genericTextField.tag = indexPath.row;
    genericTextField.placeholder = self.tableFields[indexPath.row];
    
    return cell;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSInteger textTag = textField.tag;
    NSString *userText = textField.text;
    switch (textTag) {
        case PIOTextBoxTypeFirstName:
            //First name
            self.firstName=userText;
            break;
        case PIOTextBoxTypeSurname:
            //Sur name
            self.surname=userText;
            break;
        case PIOTextBoxTypeEmail:
            //Email
            self.email=userText;
            break;
        case PIOTextBoxTypePassword:
            //Pick a password
            self.password=userText;
            break;
    }
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    NSInteger textTag = textField.tag;
    NSString *userText = textField.text;
    switch (textTag) {
        case PIOTextBoxTypeFirstName:
            //First name
            self.firstName=userText;
            break;
        case PIOTextBoxTypeSurname:
            //Sur name
            self.surname=userText;
            break;
        case PIOTextBoxTypeEmail:
            //Email
            self.email=userText;
            break;
        case PIOTextBoxTypePassword:
            //Pick a password
            self.password=userText;
            break;
    }
    [textField resignFirstResponder];
    return YES;
}

@end
