//
//  LetraAViewController.m
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "LetraAViewController.h"
#import "LetraBViewController.h"

@implementation LetraAViewController



-(void) viewDidLoad {
    [super viewDidLoad];
    self.title = @"A";
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(nextAcao:)];
    self.navigationItem.rightBarButtonItem=next;
    
    UIButton *botao = [UIButton buttonWithType:UIButtonTypeSystem];
    [botao setTitle:@"aperta para mostrar uma palavra" forState:UIControlStateNormal];
    [botao sizeToFit];
    [botao addTarget:self action:@selector(palavra:) forControlEvents:UIControlEventTouchUpInside];
    botao.center = self.view.center;
    
    [self.view addSubview:botao];
    
 
}

-(void)nextAcao:(id)sender {
    LetraBViewController *proximo = [[LetraBViewController alloc]
                                              initWithNibName:nil
                                            bundle:NULL];
    [self.navigationController pushViewController:proximo
                                         animated:YES];
    
}

-(void)palavra:(id)sender
{
    [sender setTitleColor: [UIColor redColor] forState: UIControlStateNormal];
    [sender setTitle:@"A" forState:UIControlStateNormal];
}




@end
