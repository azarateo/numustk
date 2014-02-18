//
//  TableViewController.h
//  numustk
//
//  Created by azarateo on 10/02/14.
//  Copyright (c) 2014 azarateo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>
{
    NSArray *rows;
}

@end
