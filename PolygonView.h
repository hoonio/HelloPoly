//
//  PolygonView.h
//
//  Created by Hoonio on 3/8/10.
//  Copyright 2010 Hoonio.com. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "PolygonShape.h"

@interface PolygonView : UIView {
	IBOutlet PolygonShape *polygon;
}

@property (readwrite, assign) PolygonShape *polygon;

- (void)setPolygon:(PolygonShape *)polygonInput;
- (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides;
- (void)drawRect:(CGRect)rect;

@end
