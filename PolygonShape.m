//
//  PolygonShape.m
//  HelloPoly
//
//  Created by Hoonio on 2/27/10.
//  Copyright 2010 Hoonio.com. All rights reserved.
//

#import "PolygonShape.h"


@implementation PolygonShape

@synthesize minimumNumberOfSides, maximumNumberOfSides, numberOfSides;

- (void)setMinimumNumberOfSides:(int)numberOfSidesSet {
	if (numberOfSidesSet < 3)
		NSLog(@"Invalid number of sides: %u is less than the minimum of 3 allowed", numberOfSidesSet);
	minimumNumberOfSides = numberOfSidesSet;
	NSLog(@"Setting minimum boundary: %u", numberOfSidesSet);
}

- (void)setMaximumNumberOfSides:(int)numberOfSidesSet {
	if (numberOfSidesSet > 12)
		NSLog(@"Invalid number of sides: %u is greater than the maximum of 12 allowed", numberOfSidesSet);
	maximumNumberOfSides = numberOfSidesSet;
	NSLog(@"Setting maximum boundary: %u", numberOfSidesSet);
}

- (void)setNumberOfSides:(int)numberOfSidesSet {
	NSLog(@"Setting number of sides as %u over %u", numberOfSidesSet, numberOfSides);
	if (numberOfSidesSet < minimumNumberOfSides)
		NSLog(@"Invalid number of sides: %u is less than the minimum of %u allowed", numberOfSidesSet, minimumNumberOfSides);
	if (numberOfSidesSet > maximumNumberOfSides)
		NSLog(@"Invalid number of sides: %u is greater than the maximum of %u allowed", numberOfSidesSet, maximumNumberOfSides);
	numberOfSides = numberOfSidesSet;
}

- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max{
	// allow superclass to initialize its state first
	if (self = [super init]){
		// do polygon initialization
		if (min < 3)
			NSLog(@"Invalid number of sides: %u is less than the minimum of 3 allowed", min);
		minimumNumberOfSides = min;
		if (max > 12)
			NSLog(@"Invalid number of sides: %u is greater than the maximum of 12 allowed", max);
		maximumNumberOfSides = max;
		if (!(min < sides < max))
			NSLog(@"Invalid number of sides: %u is not within the defined range %u - %u", sides, min, max);
		numberOfSides = sides;
	}
		
	return self;
}

// overriding custom initializer with default values
- (id)init{
	// allow superclass to initialize its state first
	if (self = [super init]){
		// do polygon initialization
		numberOfSides = 5;
		minimumNumberOfSides = 3;
		maximumNumberOfSides = 10;
	}
	return self;
}

- (float)angleInDegrees{
	return (180 * (numberOfSides - 2) / numberOfSides);
}

- (float)angleInRadians{
	return (M_PI * (numberOfSides - 2) / numberOfSides);
}

- (NSString *)name{
	
	static NSString *polygonName[] = {nil, @"henagon", @"Digon", @"Triangle", @"Square", @"Pentagon", @"Hexagon", @"Heptagon", @"Octagon", @"Ennegon", @"Decagon", @"Hendecagon", @"Dodecagon", nil};
	return polygonName[numberOfSides];

}

- (void)printOutput{
	NSLog(@"Hello I am a %d-sided polygon (aka a %@) with angles of %f degrees (%f radians).", numberOfSides, [self name], [self angleInDegrees], [self angleInRadians]);
}

- (void)dealloc{
	// Do any cleanup that’s necessary
	NSLog(@"Termination: Polygon shape dealloc");
	[name release];
	// when we’re done, call super to clean us up
	[super dealloc];
}

@end
