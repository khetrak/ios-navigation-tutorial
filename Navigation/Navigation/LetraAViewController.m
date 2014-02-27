//
//  LetraAViewController.m
//  Navigation
//
//  Created by Vinicius Miana on 2/23/14.
//  Copyright (c) 2014 Vinicius Miana. All rights reserved.
//

#import "LetraAViewController.h"
#import <AVFoundation/AVFoundation.h>

@implementation LetraAViewController
@synthesize index;



-(void) viewDidLoad {
    [super viewDidLoad];
    
    _ListaTela = [[NSMutableArray alloc]init];
    _letra= [@"A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z" componentsSeparatedByString:@","];
    _palavra= [@"aa,bb,cc,dd,ee,ff,gg,hh,ii,jj,kk,ll,mm,nn,oo,pp,qq,rr,ss,tt,uu,vv,ww,xx,yy,zz" componentsSeparatedByString:@","];//troca a letra dupla pela palavra correta
    _imagem = [NSArray arrayWithObjects:
               [UIImage imageNamed:@"a1.jpg"],
               [UIImage imageNamed:@"a2.jpg"], nil];
    
    [self criarTelas];

    self.title = @"A";
    
    UIBarButtonItem *next = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFastForward target:self action:@selector(next:)];
    self.navigationItem.rightBarButtonItem=next;
    
    UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemRewind target:self action:@selector(back:)];
    self.navigationItem.leftBarButtonItem=back;
    
    _telaImagem = [[UIImageView alloc]init];
    _telaImagem.frame = CGRectMake(90,170,150,200);

    _botao = [UIButton buttonWithType:UIButtonTypeSystem];
    [_botao addTarget:self action:@selector(botao:) forControlEvents:UIControlEventTouchUpInside];
    _botao.center = self.view.center;
    CGRect frame = _botao.frame;
    frame.origin.x=48.27;
    frame.origin.y=450;
    _botao.frame=frame;
    [self criadorDeBoatao];
 
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


-(void)criadorDeBoatao
{
    [_botao setTitle:@"aperta para mostrar uma palavra" forState:UIControlStateNormal];
    [_botao sizeToFit];
    [self.view addSubview:_botao];
}
-(void)botao:(id)sender
{
    [_telaImagem setImage:[_imagem objectAtIndex:index]];
    [self.view addSubview:_telaImagem];
    
    [sender setTitle:_palavra[index] forState:UIControlStateNormal];
    AVSpeechSynthesisVoice *voz = [AVSpeechSynthesisVoice voiceWithLanguage:@"en-US"];
    AVSpeechUtterance *frase = [[AVSpeechUtterance alloc]initWithString:[_palavra objectAtIndex:index]];
    frase.rate = AVSpeechUtteranceMinimumSpeechRate;
    AVSpeechSynthesizer *speechsynt = [[AVSpeechSynthesizer alloc]init];
    [frase setVoice:voz];
    [speechsynt speakUtterance:frase];

}

-(void)next:(id)sender
{
    
    index++;
    if(index > 25)
    {
        index = 0;
    }
    self.view = (UIView *)[_ListaTela objectAtIndex:index];
    self.title = _letra[index];
    [self criadorDeBoatao];
}
-(void)back:(id)sender
{
    index--;
    if(index < 0)
    {
        index = 25;
    }
    self.view = (UIView *)[_ListaTela objectAtIndex:index];
    self.title = _letra[index];
    [self criadorDeBoatao];
}
@end
