//
//  PlayerLayer.m
//  CosmicCowboy
//
//  Created by Jonathan Johnson on 11/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "PlayerLayer.h"

@implementation PlayerLayer

@synthesize player;

- (id) init {
	if((self = [super init]))
	{
		self.player = [CCSprite spriteWithFile:@"player.png"];
		self.player.position = ccp(0, 0);
		[self addChild:self.player];
		
		//We set the layer position to the center of the screen
		//This will also move our player sprite to the center
		self.position = ccp(240, 160);
	}
	return self;
}

- (void) dealloc {
	self.player = nil;
	
	[super dealloc];
}

@end
