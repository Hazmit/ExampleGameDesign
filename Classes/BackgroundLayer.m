//
//  BackgroundLayer.m
//  CosmicCowboy
//
//  Created by Jonathan Johnson on 11/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "BackgroundLayer.h"

@implementation BackgroundLayer

@synthesize label;
@synthesize tileMap;
@synthesize background;
@synthesize meta;

- (id) init {
	if((self = [super init]))
	{
		self.tileMap = [TileMap tiledMapWithTMXFile:@"TileMap.tmx"];
        self.background = [tileMap layerNamed:@"Background"];
		self.meta = [tileMap layerNamed:@"Meta"];
		[self.meta setVisible:NO];
		
        [self addChild:tileMap z:-1];
	}
	return self;
}

- (void) dealloc {
	
	[super dealloc];
}

@end
