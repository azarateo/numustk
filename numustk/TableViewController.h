//
//  TableViewController.h
//  numustk
//
//  Created by azarateo on 10/02/14.
//  Copyright (c) 2014 azarateo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewController : UITableViewController <UITableViewDataSource,UITableViewDelegate>
{
    NSArray *rows;
    NSMutableArray *objetos;
}
@property (weak, nonatomic) IBOutlet UITableView *tabla;

@end
