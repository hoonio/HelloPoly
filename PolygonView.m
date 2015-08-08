//
//  PolygonView.m
//
//  Created by Hoonio on 3/8/10.
//  Copyright 2010 Hoonio.com. All rights reserved.
//

#import "PolygonView.h"

@implementation PolygonView

- (void)setPolygon:(PolygonShape *)polygonInput {
	polygon = polygonInput;
	[self setNeedsDisplay];
}


- (NSArray *)pointsForPolygonInRect:(CGRect)rect numberOfSides:(int)numberOfSides { 
	CGPoint center = CGPointMake(rect.size.width / 2.0, rect.size.height / 2.0); 
	float radius = 0.9 * center.x; 
	NSMutableArray *result = [NSMutableArray array];
	float angle = (2.0 * M_PI) / numberOfSides; 
	float exteriorAngle = M_PI - angle; 
	float rotationDelta = angle - (0.5 * exteriorAngle);
	
	for (int currentAngle = 0; currentAngle < numberOfSides; currentAngle++) { 
		float newAngle = (angle * currentAngle) - rotationDelta; 
		float curX = cos(newAngle) * radius; 
		float curY = sin(newAngle) * radius;
		[result addObject:[NSValue valueWithCGPoint:CGPointMake(center.x + curX, center.y + curY)]];
	} 
	return result;
}

/*- (void)setNeedsDisplay:(int)numberOfSidesSet {
	coordinates = [self pointsForPolygonInRect:[self bounds] numberOfSides:numberOfSidesSet];
	NSLog(@"Setting coordinates for a %d-sided polygon.", numberOfSidesSet);
}

- (void)setPolygonName:(NSString *)currentPolygon {
	polygonName.text = currentPolygon;
}
*/

- (void)drawRect:(CGRect)rect { 
	[[UIColor grayColor] set]; 
	UIRectFill ([self bounds]);
	
	NSArray *coordinates = [self pointsForPolygonInRect:[self bounds] numberOfSides:[polygon numberOfSides]];
	NSLog(@"Setting coordinates for a %d-sided polygon.", [polygon numberOfSides]);
	
	CGContextRef context = UIGraphicsGetCurrentContext();
	
	CGContextBeginPath(context);
	
	CGPoint initialPoint = [[coordinates objectAtIndex:0] CGPointValue];
	CGContextMoveToPoint(context, initialPoint.x, initialPoint.y);
	NSLog(@"Initial point at %d, %d", initialPoint.x, initialPoint.y);
	
	for (NSValue *coordinate in coordinates) {
//		if ([coordinate CGPointValue] == nil)
//			break;
//		else {
		CGPoint point = [coordinate CGPointValue];
			CGContextAddLineToPoint(context, point.x, point.y);
//		}
	}
	
	CGContextClosePath(context);
	
	[[UIColor blackColor] setStroke];
	[[UIColor redColor] setFill];
	CGContextDrawPath(context, kCGPathFillStroke);
}

@end
