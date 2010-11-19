//
//  HelloWorldLayer.m
//  TestGame
//
//  Created by jon on 11/19/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

// Import the interfaces
#import "GameDirectorScene.h"
#import "BackgroundLayer.h"
#import "CharacterLayer.h"
#import "HUDLayer.h"

// HelloWorld implementation
@implementation GameDirectorScene

@synthesize background;
@synthesize character;
@synthesize hud;

+(id) scene {
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	GameDirectorScene *layer = [GameDirectorScene node];
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init {
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
		character = [CharacterLayer node];
		hud = [HUDLayer node];
		background = [BackgroundLayer sharedLayer];
		
		[self addChild: background z: -1];
		[self addChild: character z: 1];
		[self addChild: hud z: 2];
	}
	return self;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc {
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
