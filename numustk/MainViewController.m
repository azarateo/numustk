//
//  ViewController.m
//  numustk
//
//  Created by azarateo on 8/02/14.
//  Copyright (c) 2014 azarateo. All rights reserved.
//

#import "MainViewController.h"
#import <Parse/Parse.h>

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad
{
    
    
    PFObject *testObject = [PFObject objectWithClassName:@"TestObject"];
    testObject[@"foo"] = @"bar";
    [testObject saveInBackground];
    
    
    PFObject *gameScore = [PFObject objectWithClassName:@"GameScore"];
    gameScore[@"score"] = @1337;
    gameScore[@"playerName"] = @"Sean Plott";
    gameScore[@"cheatMode"] = @NO;
    [gameScore saveInBackground];
    
    
    PFObject *gameScore2 = [PFObject objectWithClassName:@"GameScore"];
    gameScore2[@"score"] = @1338;
    gameScore2[@"playerName"] = @"Alejandro Zárate";
    gameScore2[@"cheatMode"] = @NO;
    [gameScore2 saveInBackground];
    
    
    
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
