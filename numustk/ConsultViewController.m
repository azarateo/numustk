//
//  ConsultViewController.m
//  numustk
//
//  Created by azarateo on 8/02/14.
//  Copyright (c) 2014 azarateo. All rights reserved.
//

#import "ConsultViewController.h"

@interface ConsultViewController ()


@end

@implementation ConsultViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.scroller setScrollEnabled:TRUE];
    [self.scroller setContentSize:CGSizeMake(320, 478)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pictureWithCamera:(id)sender {
    
    picker = [[UIImagePickerController alloc] init];
    picker.delegate = self;
    [picker setSourceType:UIImagePickerControllerSourceTypeCamera];
    [self presentViewController:picker animated:TRUE completion:NULL];
    
    
}

- (IBAction)pictureFromLibrary:(id)sender {
    
    picker2 = [[UIImagePickerController alloc] init];
    picker2.delegate = self;
    [picker2 setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    [self presentViewController:picker2 animated:TRUE completion:NULL];
    
}
@end
