//
//  CharacterLayer.m
//  TestGame
//
//  Created by jon on 11/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CharacterLayer.h"

static CharacterLayer *gInstance = NULL;

@implementation CharacterLayer

@synthesize label;

+(id)sharedLayer {
	@synchronized(self)
    {
		if (gInstance == NULL)
			gInstance = [[self alloc] init];
    }
	return(gInstance);
}

// on "init" you need to initialize your instance
-(id) init {
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init] )) {
		label = [CCLabel labelWithString:@"Character" fontName:@"Marker Felt" fontSize:24];
		label.position = ccp(240, 160);
		[self addChild:label];
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
