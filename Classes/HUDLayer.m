//
//  HUDLayer.m
//  CosmicCowboy
//
//  Created by Jonathan Johnson on 11/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "HUDLayer.h"

@implementation HUDLayer

@synthesize joy;

- (id) init {
	if((self = [super init]))
	{
				
		SneakyJoystickSkinnedBase *leftJoy = [[[SneakyJoystickSkinnedBase alloc] init] autorelease];
		leftJoy.position = ccp(64,64);
		leftJoy.backgroundSprite = [CCSprite spriteWithFile:@"joystick.png"];
		leftJoy.thumbSprite = [CCSprite spriteWithFile:@"cap.png"];
		leftJoy.joystick = [[SneakyJoystick alloc] initWithRect:CGRectMake(0,0,128,128)];
		leftJoy.joystick.isDPad = YES;
		[self addChild:leftJoy];
		
		self.joy = leftJoy;
	}
	return self;
}

- (void) dealloc {
	
	[super dealloc];
}

@end
