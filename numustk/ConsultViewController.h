//
//  ConsultViewController.h
//  numustk
//
//  Created by azarateo on 8/02/14.
//  Copyright (c) 2014 azarateo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConsultViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>   {

    UIImagePickerController *picker;
    UIImagePickerController *picker2;
    UIImage *image;
    IBOutlet UIImageView *imageView;

}
@property (weak, nonatomic) IBOutlet UIScrollView *scroller;
@property (weak, nonatomic) IBOutlet UITextField *inputDenomination;
@property (weak, nonatomic) IBOutlet UITextField *inputMonth;
@property (weak, nonatomic) IBOutlet UITextField *inputYear;
@property (weak, nonatomic) IBOutlet UILabel *denominationLabel;
- (IBAction)pictureWithCamera:(id)sender;
- (IBAction)pictureFromLibrary:(id)sender;

@end
