//
//  Controller.m
//
//  Created by Hoonio on 3/6/10.
//  Copyright 2010 Hoonio.com. All rights reserved.
//

#import "Controller.h"


@implementation Controller
- (IBAction)decrease:(id)sender {
	if ([polygon numberOfSides] > [polygon minimumNumberOfSides])
		[polygon setNumberOfSides:([polygon numberOfSides]-1)];
	[self updateInterface];
	NSLog(@"Polygon dimension decrease: %d", [polygon numberOfSides]);
}

- (IBAction)increase:(id)sender {
	if ([polygon numberOfSides] < [polygon maximumNumberOfSides])
		[polygon setNumberOfSides:([polygon numberOfSides]+1)];
	[self updateInterface];
	NSLog(@"Polygon dimension increase: %d", [polygon numberOfSides]);
}

- (void)awakeFromNib {
	if ([[NSUserDefaults standardUserDefaults] integerForKey:@"PolygonKind"]) {
		numberOfSidesLabel.text = [NSString stringWithFormat:@"%d", [[NSUserDefaults standardUserDefaults] integerForKey:@"PolygonKind"]];
	}
	[polygon setMinimumNumberOfSides:3]; 
	[polygon setMaximumNumberOfSides:12];
	[polygon setNumberOfSides:numberOfSidesLabel.text.integerValue];

	[polygonView setPolygon:polygon];
	polygonName.text = polygon.name;
	NSLog(@"My polygon: %@", polygon.name);
	
}

- (void)updateInterface {
	// set interface state here
	NSLog(@"Entering updateInterface");
	if ([polygon numberOfSides] == [polygon minimumNumberOfSides])
		decreaseButton.enabled = NO;
	else
		decreaseButton.enabled = YES;

	if ([polygon numberOfSides] == [polygon maximumNumberOfSides])
		increaseButton.enabled = NO;
	else
		increaseButton.enabled = YES;
	
	numberOfSidesLabel.text = [NSString stringWithFormat:@"%d", [polygon numberOfSides]];
	[polygonView setPolygon:polygon];
	[[NSUserDefaults standardUserDefaults] setInteger:[polygon numberOfSides] forKey:@"PolygonKind"];
	
	polygonName.text = polygon.name;
	
}
	
@end
