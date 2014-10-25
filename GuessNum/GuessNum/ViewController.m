//
//  ViewController.m
//  GuessNum
//
//  Created by Jiwei Xia on 1/7/13.
//  Copyright (c) 2013 Jiwei Xia. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad    //@@@Alfred: when the window loaded, run this method automatically
{
    [super viewDidLoad];
     HiddenNum =[[NSMutableArray alloc] init];
     PositionNum =[[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:10],[NSNumber numberWithInt:10],[NSNumber numberWithInt:10],[NSNumber numberWithInt:10], nil];
     NumButton =[[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:10],[NSNumber numberWithInt:10],[NSNumber numberWithInt:10],[NSNumber numberWithInt:10], nil];
     reselected =0;
    _Check.enabled =NO;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning //@@@ Nothing
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Start:(id)sender {  //@@@ Start button is pressed call this method.
    
    [sender setTitle:@"Restart" forState:UIControlStateNormal];
    
    [_P1 setTitle:nil forState:UIControlStateNormal];
    [_P2 setTitle:nil forState:UIControlStateNormal];
    [_P3 setTitle:nil forState:UIControlStateNormal];
    [_P4 setTitle:nil forState:UIControlStateNormal];
    
    
    
    for (int i=0; i< HiddenNum.count; i++) {
        UIButton * temp =[HiddenNum objectAtIndex:i];
        temp.hidden = NO;
    }
    HiddenNum =[[NSMutableArray alloc] init];
    PositionNum =[[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:10],[NSNumber numberWithInt:10],[NSNumber numberWithInt:10],[NSNumber numberWithInt:10], nil];
    NumButton =[[NSMutableArray alloc] initWithObjects:[NSNumber numberWithInt:10],[NSNumber numberWithInt:10],[NSNumber numberWithInt:10],[NSNumber numberWithInt:10], nil];
/////////////////////////////////////////////////////////
//generate 4 digit number
    
    trArray = [[NSMutableArray alloc] init];
    NSNumber * Position1= [[NSNumber alloc] initWithInteger:arc4random()%9];
    NSNumber * Position2= [[NSNumber alloc] initWithInteger:arc4random()%9];
    while (Position2==Position1) {
       Position2= [[NSNumber alloc] initWithInteger:arc4random()%9];
    };
    
    NSNumber * Position3= [[NSNumber alloc] initWithInteger:arc4random()%9];
    while (Position3==Position1 || Position3==Position2) {
        Position3= [[NSNumber alloc] initWithInteger:arc4random()%9];
    };
    
    NSNumber * Position4= [[NSNumber alloc] initWithInteger:arc4random()%9];
    while (Position4==Position1 || Position4==Position2 ||Position4==Position3) {
        Position4= [[NSNumber alloc] initWithInteger:arc4random()%9];
    };
    
    
    [trArray addObject: Position1];
    [trArray addObject: Position2];
    [trArray addObject: Position3];
    [trArray addObject: Position4];
    //////////////////////////////////////////////////////
    
    HiddenNum =[[NSMutableArray alloc] init];
    reselected =0;
    _P1.hidden =NO;
    _P2.hidden =NO;
    _P3.hidden =NO;
    _P4.hidden =NO;
    _Testbox.text = @"";
    tryLeft = 7;
    _TryLeft.text = [NSString stringWithFormat:@"%d TryLeft",tryLeft];
    _TryLeft.hidden =NO;
    _Check.enabled =NO;
    NSLog(@"%@",trArray);
}

- (IBAction)P1:(id)sender {
    if (oldPosition != sender) mybutton.highlighted = NO;
    [self performSelector:@selector(doHighlite) withObject:nil afterDelay:0.5];
    
    mybutton =sender;
    oldPosition =sender;
        
}

- (IBAction)Number:(id)sender {
   UIButton* Numbutton = sender;
   
    if (mybutton!= nil)
    {
        Numbutton.hidden = YES;
        [HiddenNum addObject:sender];
        [mybutton setTitle:[Numbutton currentTitle]forState:UIControlStateNormal];
        if (mybutton==_P1 ) {
            if ([PositionNum objectAtIndex:0]== [NSNumber numberWithInt:10]){
                [NumButton setObject:sender atIndexedSubscript:0];
                [PositionNum setObject:[NSNumber numberWithInt:1] atIndexedSubscript:0];
            }
            else
            {
                UIButton * temp =[NumButton objectAtIndex:0];
                temp.hidden =NO;
                [NumButton setObject:sender atIndexedSubscript:0];
                
            }
        }

        if (mybutton==_P2 ) {
            if ([PositionNum objectAtIndex:1]== [NSNumber numberWithInt:10]){
                [NumButton setObject:sender atIndexedSubscript:1];
                [PositionNum setObject:[NSNumber numberWithInt:1] atIndexedSubscript:1];
            }
            else
            {
                UIButton * temp =[NumButton objectAtIndex:1];
                temp.hidden =NO;
                [NumButton setObject:sender atIndexedSubscript:1];

            }
        }
        
        if (mybutton==_P3 ) {
            if ([PositionNum objectAtIndex:2]== [NSNumber numberWithInt:10]){
                [NumButton setObject:sender atIndexedSubscript:2];
                [PositionNum setObject:[NSNumber numberWithInt:1] atIndexedSubscript:2];
            }
            else
            {
                UIButton * temp =[NumButton objectAtIndex:2];
                temp.hidden =NO;
                [NumButton setObject:sender atIndexedSubscript:2];

            }
        }
        
        if (mybutton==_P4 ) {
            if ([PositionNum objectAtIndex:3]== [NSNumber numberWithInt:10]){
                [NumButton setObject:sender atIndexedSubscript:3];
                [PositionNum setObject:[NSNumber numberWithInt:1] atIndexedSubscript:3];
            }
            else
            {
                UIButton * temp =[NumButton objectAtIndex:3];
                temp.hidden =NO;
                [NumButton setObject:sender atIndexedSubscript:3];

            }
        }
        
    }
    if (_P1.currentTitle ==nil || _P2.currentTitle==nil ||_P3.currentTitle ==nil ||_P4.currentTitle ==nil)
    {
        _Check.enabled = NO ;
    }
    else if(_Start.currentTitle==@"Restart")
    {
        _Check.enabled = YES;
    }


}



    - (void)doHighlite {
        mybutton.highlighted = YES;
    }

- (IBAction)Check:(id)sender {
    int A = 0;
    int B = 0;
    for (int i =0; i<4; i++) {
        if (_P1.currentTitle.integerValue == [[trArray objectAtIndex:i] integerValue]) {
            if (i==0) {
                A++;
            }
            else
            {
                B++;
            }
            
        }
        
        if (_P2.currentTitle.integerValue == [[trArray objectAtIndex:i] integerValue]) {
            if (i==1) {
                A++;
            }
            else
            {
                B++;
            }
            
        }
        
        if (_P3.currentTitle.integerValue == [[trArray objectAtIndex:i] integerValue]) {
            if (i==2) {
                A++;
            }
            else
            {
                B++;
            }
            
        }
        
        if (_P4.currentTitle.integerValue == [[trArray objectAtIndex:i] integerValue]) {
            if (i==3) {
                A++;
            }
            else
            {
                B++;
            }
            
        }
    }
    NSString* ToAppend = [NSString stringWithFormat:@"%@%@%@%@  %dA%dB",_P1.currentTitle,_P2.currentTitle,_P3.currentTitle,_P4.currentTitle,A,B];
    _Testbox.text =[_Testbox.text stringByAppendingFormat:@"%@\n",ToAppend];
    
    NSLog(@"%dA%dB",A,B);
    if (A==4)
    {
        _P1.hidden =YES;
        _P2.hidden =YES;
        _P3.hidden =YES;
        _P4.hidden =YES;
        _Testbox.text = @"YOU WIN!";
        _Check.enabled =NO;
    }
    else
    {
        tryLeft--;
        if (tryLeft==0)
        {
            _P1.hidden =YES;
            _P2.hidden =YES;
            _P3.hidden =YES;
            _P4.hidden =YES;
            _Testbox.text = @"YOU LOSE!";
            _Check.enabled = NO;

        }
    }
    _TryLeft.text = [NSString stringWithFormat:@"%d TryLeft",tryLeft];

    A=0;
    B=0;
}

@end
