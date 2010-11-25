//
//  TileMap.m
//  CosmicCowboy
//
//  Created by Jonathan Johnson on 11/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TileMap.h"


@implementation TileMap

@synthesize layer;

- (id)initWithTMXFile:(NSString *)tmxFile {
	if((self = [super initWithTMXFile:tmxFile])) {
		layer = [self layerNamed:@"Background"];
	}
	return self;
}

- (CGPoint)coordinatesAtPosition:(CGPoint)point {
	//Adjust the coordinates for our player's center location
	CGPoint adjustedStart = ccp(point.x-273, point.y - 225); //This needs to be adjusted slightly for our players sprite size
	
	//Figure out our tile maps actual height and width
	//we subtract 1 from the tile size because that is the tile margin in the map file
	int maxWidth = self.mapSize.width * (self.tileSize.width - 1);
	int maxHeight = self.mapSize.height * (self.tileSize.height - 1);
	
	//Figure out what out coordinates would be on the other cord system
	CGPoint convertedPoint = ccp(maxWidth - adjustedStart.x, maxHeight - adjustedStart.y);
	
	//Discover what tile number we are on by dividing the tile sizes
	CGPoint tileLocation = ccp((int)(convertedPoint.x / self.tileSize.width), (int)(self.mapSize.height - (convertedPoint.y / self.tileSize.height)));
	
	return ccp(tileLocation.x - self.mapSize.width, (tileLocation.y + self.mapSize.height));
}

- (unsigned int)getGIDAtPosition:(CGPoint)point {
	return [layer tileGIDAt:[self coordinatesAtPosition:point]];
}

- (void) dealloc {
	[super dealloc];
}

@end
