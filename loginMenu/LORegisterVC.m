//
//  LORegisterVC.m
//  loginMenu
//
//  Created by Olivier Delecueillerie on 06/11/2013.
//  Copyright (c) 2013 Olivier Delecueillerie. All rights reserved.
//

#import "LORegisterVC.h"
#import <Parse/Parse.h>
@interface LORegisterVC ()

@end

@implementation LORegisterVC

@synthesize userRegisterTextField = _userRegisterTextField, passwordRegisterTextField = _passwordRegisterTextField;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    self.userRegisterTextField = nil;
    self.passwordRegisterTextField = nil;
}


#pragma mark IB Actions

////Sign Up Button pressed
-(IBAction)signUpUserPressed:(id)sender
{
    PFUser *user = [PFUser user];
    user.username = self.userRegisterTextField.text;
    user.password = self.passwordRegisterTextField.text;
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {

            //The registration was succesful, go to the wall
            //[self performSegueWithIdentifier:@"SignupSuccesful" sender:self];
#warning complete the method below
            //[self openTheNextVC:<#(UIViewController *)#> withIPadStoryboard:<#(NSString *)#> withIPhoneStoryboard:<#(NSString *)#> inBundle:<#(NSBundle *)#> witViewIdentifier:<#(NSString *)#>]
            
        } else {
            //Something bad has ocurred
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            UIAlertView *errorAlertView = [[UIAlertView alloc] initWithTitle:@"Error" message:errorString delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
            [errorAlertView show];
        }
    }];
    
    
}

- (void) openTheNextVC:(UIViewController*)VC withIPadStoryboard:(NSString*)ipadStory withIPhoneStoryboard:(NSString*)iphoneStory inBundle:(NSBundle*)bundle witViewIdentifier:(NSString *)id {
#define IPAD UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad
    if (IPAD) {
        VC = [[UIStoryboard storyboardWithName:ipadStory bundle:bundle] instantiateViewControllerWithIdentifier:id];
    } else {
        VC = [[UIStoryboard storyboardWithName:iphoneStory bundle:bundle] instantiateViewControllerWithIdentifier:id];
    }
    [self presentViewController:VC animated:YES completion:nil];
    
}
@end
