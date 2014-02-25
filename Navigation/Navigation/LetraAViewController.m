//
//  LetraAViewController.m
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "LetraAViewController.h"

@implementation LetraAViewController
@synthesize index;



-(void) viewDidLoad {
    [super viewDidLoad];
    
    _ListaTela = [[NSMutableArray alloc]init];
    _letra= [@"A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z" componentsSeparatedByString:@","];
    
    [self criarTelas];
    
    self.title = @"A";
    
    UIBarButtonItem *next = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc]
                             initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem=back;
    
    
    
    _botao = [UIButton buttonWithType:UIButtonTypeSystem];
    [_botao setTitle:@"aperta para mostrar uma palavra" forState:UIControlStateNormal];
    [_botao sizeToFit];
    [_botao addTarget:self action:@selector(palavra:) forControlEvents:UIControlEventTouchUpInside];
    _botao.center = self.view.center;
    
    [self.view addSubview:_botao];
    
 
}
-(void)criarTelas
{
    index = 0;
    int aux = 0;
    UIView *tela = [[UIView alloc]init];
    while ([_ListaTela count]< 27)
    {
        [_ListaTela insertObject:tela atIndex:aux];
        aux++;
    }
 
}

-(void)palavra:(id)sender
{
    [sender setTitleColor: [UIColor redColor] forState: UIControlStateNormal];
    [sender setTitle:_letra[index] forState:UIControlStateNormal];
}

-(void)next:(id)sender
{
    
    index++;
    self.view = (UIView *)[_ListaTela objectAtIndex:index];
    self.title = _letra[index];
    [self.view addSubview:_botao];
}
-(void)back:(id)sender
{
    index--;
    self.view = (UIView *)[_ListaTela objectAtIndex:index];
    self.title = _letra[index];
    [self.view addSubview:_botao];
}
@end
