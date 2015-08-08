//
//  Controller.h
//
//  Created by Hoonio on 3/6/10.
//  Copyright 2010 Hoonio.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"
#import "PolygonView.h"

@interface Controller : NSObject {
	IBOutlet PolygonView *polygonView;
    IBOutlet UIButton *decreaseButton;
    IBOutlet UIButton *increaseButton;
    IBOutlet UILabel *numberOfSidesLabel;

	IBOutlet UILabel *polygonName;
	IBOutlet PolygonShape *polygon;
}

- (IBAction)decrease:(id)sender;
- (IBAction)increase:(id)sender;
- (void)awakeFromNib;
- (void)updateInterface;

@end
