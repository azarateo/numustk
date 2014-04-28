//
//  TableViewController.h
//  numustk
//
//  Created by azarateo on 10/02/14.
//  Copyright (c) 2014 azarateo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "sqlite3.h"

@interface TableViewController : UITableViewController <UITableViewDataSource,UITableViewDelegate>
{
    NSArray *rows;
    NSMutableArray *objetos;
    sqlite3 *db;

}
@property (weak, nonatomic) IBOutlet UITableView *tabla;

@end
