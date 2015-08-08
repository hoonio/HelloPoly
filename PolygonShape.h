//
//  PolygonShape.h
//  HelloPoly
//
//  Created by Hoonio on 2/27/10.
//  Copyright 2010 Hoonio.com. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface PolygonShape : NSObject {
	int numberOfSides;
	int minimumNumberOfSides;
	int maximumNumberOfSides;
	float angleInDegrees;
	float angleInRadians;
	NSString *name;
}

@property (setter=setMinimumNumberOfSides) int minimumNumberOfSides;
@property (setter=setMaximukmNumberOfSides) int maximumNumberOfSides;
@property (setter=setNumberOfSides) int numberOfSides;

@property (readonly) float angleInDegrees;
@property (readonly) float angleInRadians;
@property (readonly) NSString *name;

// method declarations
- (void)setMinimumNumberOfSides:(int)numberOfSidesSet;
- (void)setMaximumNumberOfSides:(int)numberOfSidesSet;
- (void)setNumberOfSides:(int)numberOfSidesSet;

- (id)initWithNumberOfSides:(int)sides minimumNumberOfSides:(int)min maximumNumberOfSides:(int)max;
- (id)init;

- (float)angleInDegrees;
- (float)angleInRadians;

- (NSString *)name;

- (void)printOutput;
- (void)dealloc;

@end
