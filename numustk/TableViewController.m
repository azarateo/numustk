//
//  TableViewController.m
//  numustk
//
//  Created by azarateo on 10/02/14.
//  Copyright (c) 2014 azarateo. All rights reserved.
//

#import "TableViewController.h"
#import <Parse/Parse.h>

@interface TableViewController ()

@end

@implementation TableViewController

@synthesize tabla;

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    rows = [[NSMutableArray alloc] init];
    rows = @[@"Item1",@"Item2",@"Item3",];
    
    PFQuery *query = [PFQuery queryWithClassName:@"GameScore"];
    [query whereKey:@"playerName" equalTo:@"Alejandro Zárate"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Successfully retrieved %lu scores.", (unsigned long)objects.count);
            // Do something with the found objects
            for (PFObject *object in objects) {
                NSLog(@"%@", object.objectId);
            }
            objetos = [NSMutableArray arrayWithArray:objects];
            NSLog(@"Número de objetos en arreglo objetos: %lu", (unsigned long)objetos.count);
            
            for (int i = 0; i < objetos.count; i++){
                NSLog(@"Resultados: %@", [objetos objectAtIndex:i]);
            }
            
            [tabla reloadData];
            
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
    
   
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return objetos.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{


    UITableViewCell *celda = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"UITableViewCell"];
    PFObject *eldato = [objetos objectAtIndex:indexPath.row];
    NSString *elnombre = [eldato objectForKey:@"playerName"];
   // NSString *elmodo = [eldato objectForKey:@"cheatMode"];

   
    
    
    [[celda textLabel] setText:elnombre];
    return celda;

}



@end
