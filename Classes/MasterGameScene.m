//
//  HelloWorldLayer.m
//  CosmicCowboy
//
//  Created by Jonathan Johnson on 11/20/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

// Import the interfaces
#import "MasterGameScene.h"

// HelloWorld implementation
@implementation MasterGameScene

// on "init" you need to initialize your instance
-(id) init
{
	if( (self=[super init] )) {
		//Setting up our layers in a specific order so the are layered correctly
		MasterGameController *gameController = [MasterGameController sharedController];
		
		[self addChild:[gameController backgroundLayer] z:-1];
		[self addChild:[gameController playerLayer] z:50];
		[self addChild:[gameController hudLayer] z:100];
		
		//Schedule a tick method. This called our game controller's
		//main loop tick method
		[self schedule:@selector(tick:)];
	}
	return self;
}

-(void)tick:(float)delta {
	[[MasterGameController sharedController] tick:(float)delta];
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
