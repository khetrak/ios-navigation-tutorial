//
//  LetraCViewController.m
//  Navigation
//
//  Created by Lucas Mendanha Filardi on 2/25/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "LetraCViewController.h"

@interface LetraCViewController ()

@end

@implementation LetraCViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
	self.title = @"C";
    UIBarButtonItem *next = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(proximaLetra:)];
    self.navigationItem.rightBarButtonItem=next;
    
    UIButton *botao = [UIButton buttonWithType:UIButtonTypeSystem];
    [botao setTitle:@"aperta para mostrar uma palavra" forState:UIControlStateNormal];
    [botao sizeToFit];
    [botao addTarget:self action:@selector(palavra:) forControlEvents:UIControlEventTouchUpInside];
    botao.center = self.view.center;
    
    [self.view addSubview:botao];
}

-(void)proximaLetra:(id)sender
{
    LetraCViewController *proximo = [[LetraCViewController alloc]initWithNibName:nil bundle:NULL];
    [self.navigationController pushViewController:proximo animated:YES];
    
}

-(void)palavra:(id)sender
{
    [sender setTitleColor: [UIColor redColor] forState: UIControlStateNormal];
    [sender setTitle:@"C" forState:UIControlStateNormal];
}

@end
