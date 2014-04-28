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
    
    
    NSString *ruta = [[NSString alloc] init];
    NSArray *arregloUbicaciones = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    ruta = [[arregloUbicaciones objectAtIndex:0] stringByAppendingPathComponent:@"bp.sql"];
    
    if(sqlite3_open([ruta UTF8String], &db)){
        sqlite3_close(db);
        NSLog(@"No se pudo abrir la base de datos");
    }
    else{
        NSLog(@"Abrió la base de datos");
    }
    
    NSString *consulta = [NSString stringWithFormat:@"CREATE TABLE IF NOT EXISTS billete(objectId varchar(20), denominacion varchar(10), year text(10), month text(10), day text(10), f8_10 varchar(20), f5_7 varchar(20), f1_4 varchar(20), descripcion text);"];
    char *error;
    
    if(sqlite3_exec(db, [consulta UTF8String], NULL, NULL, &error) != SQLITE_OK){
        sqlite3_close(db);
        NSLog(@"No se creó la tabla");
    }
    else{
        NSLog(@"Se creó la tabla");
        
    }

    
    NSString *consultaInsert = [NSString stringWithFormat:@"INSERT INTO billete(objectId,denominacion,year,month,day,f8_10,f5_7,f1_4,descripcion) VALUES('123','100','1987','enero','21','1000','2000','454','El billete es la locura');"];
    char *error2;
    
    if(sqlite3_exec(db, [consultaInsert UTF8String], NULL, NULL, &error2) != SQLITE_OK){
        sqlite3_close(db);
        NSLog(@"No se insertó la fila");
    }
    else{
        NSLog(@"Se insertó la fila");
    }

    
    
    PFQuery *query = [PFQuery queryWithClassName:@"billeteca2014"];
    [query whereKey:@"denominacion" equalTo:@"1/2"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            // The find succeeded.
            NSLog(@"Billetes encontrados %lu", (unsigned long)objects.count);
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
    NSString *denominacion = [eldato objectForKey:@"denominacion"];
    NSString *valor = [eldato objectForKey:@"f8_10"];

   
    
    
    [[celda textLabel] setText:denominacion];
    celda.detailTextLabel.text = valor;
    return celda;

}



@end
