//
//  TempConvertViewController.m
//  tempconvert
//
//  Created by Michael Rizkalla on 1/10/14.
//  Copyright (c) 2014 yahoo. All rights reserved.
//

#import "TempConvertViewController.h"

@interface TempConvertViewController ()
@property (weak, nonatomic) IBOutlet UITextField *fTextField;
@property (weak, nonatomic) IBOutlet UITextField *cTextField;
- (IBAction)convertTemperature:(id)sender;

@end

@implementation TempConvertViewController 

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.fTextField.delegate = self;
    self.cTextField.delegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)convertTemperature:(id)sender {
    // dismiss the keypad
    [self.view endEditing:YES];
    
    if (self.fTextField.hasText) {
        // convert from f to c
        self.cTextField.text = [NSString stringWithFormat:@"%0.1f", ([self.fTextField.text floatValue]-32)*(5.0f/9.0f)];
    } else if (self.cTextField.hasText) {
        // convert from c to f
        self.fTextField.text = [NSString stringWithFormat:@"%0.1f", [self.cTextField.text floatValue]*(9.0f/5.0f) + 32];
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == self.fTextField) {
        self.cTextField.text = @"";
    } else if (textField == self.cTextField) {
        self.fTextField.text = @"";
    }
}

@end
