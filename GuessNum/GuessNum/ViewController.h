//
//  ViewController.h
//  GuessNum
//
//  Created by Jiwei Xia on 1/7/13.
//  Copyright (c) 2013 Jiwei Xia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    NSMutableArray *trArray;
    UIButton* mybutton ;
    id oldPosition;
    NSMutableArray *HiddenNum;
    NSMutableArray *PositionNum;
    NSMutableArray *NumButton;
    NSNumber* reselected;
    UIButton * templast ;
    int tryLeft;
}
- (IBAction)Start:(id)sender;
- (IBAction)P1:(id)sender;
- (IBAction)Number:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *P1;
@property (weak, nonatomic) IBOutlet UIButton *P2;
@property (weak, nonatomic) IBOutlet UIButton *P3;
@property (weak, nonatomic) IBOutlet UIButton *P4;
- (IBAction)Check:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *Testbox;
@property (weak, nonatomic) IBOutlet UILabel *TryLeft;
@property (weak, nonatomic) IBOutlet UIButton *Check;
@property (weak, nonatomic) IBOutlet UIButton *Start;




@end
