//
//  MasterGameController.m
//  CosmicCowboy
//
//  Created by Jonathan Johnson on 11/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MasterGameController.h"

@implementation MasterGameController

@synthesize playerLayer;
@synthesize backgroundLayer;
@synthesize hudLayer;

static MasterGameController *gInstance = NULL;

+ (MasterGameController *) sharedController
{
	@synchronized(self)
    {
		if (gInstance == NULL) {
			gInstance = [[self alloc] init];
		}
    }
	return(gInstance);
}

- (id) init {
	if((self = [super init]))
	{
		//Initialize and keep track of our game layers
		//The MasterGameScene will add these to the scene as childs
		//in a very specific order.
		HUDLayer *newHud = [[HUDLayer alloc] init];
		[self setHudLayer:newHud];
		
		BackgroundLayer *newBackground = [[BackgroundLayer alloc] init];
		[self setBackgroundLayer:newBackground];
		
		PlayerLayer *newPlayer = [[PlayerLayer alloc] init];
		[self setPlayerLayer:newPlayer];
		
		[self schedule:@selector(tick:)];
	}
	return self;
}

- (void)tick:(float)delta {
	[self applyJoystick:self.hudLayer.joy.joystick toNode:nil forTimeDelta:delta];
}

static CGPoint applyVelocity(CGPoint velocity, CGPoint position, float delta){
	return CGPointMake(position.x - velocity.x * delta, position.y - velocity.y * delta);
}

-(void)applyJoystick:(SneakyJoystick *)aJoystick toNode:(CCNode *)aNode forTimeDelta:(float)dt
{	
	CGPoint scaledVelocity = ccpMult(aJoystick.velocity, 150.0f); 
	CGPoint position = applyVelocity(scaledVelocity, self.backgroundLayer.position, dt);
	
	/*
	Get the tile coordinates. This is not the pixel X Y cords this is the X Y of the tile on the map.
	the tile map cord system counts the columns and rows of the tiles.
	the 'corrdinatesAtPosition' method of the tileMap will get those cords based on the actual pixel X Y cords
	This method is the main reason we have subclassed the CCTMXTileMap class
	 */
	CGPoint tileCoord = [self.backgroundLayer.tileMap coordinatesAtPosition:position];
	
	//We need to use the tile cords to get the meta layer's tile using its unique GID.
	//Once we have the tile from the meta layer we check to see if there is a Collidable property set.
	//If it is set we will return this update method before updating the background position.
	int tileGid = [self.backgroundLayer.meta tileGIDAt:tileCoord];
	if (tileGid) {
		NSDictionary *properties = [self.backgroundLayer.tileMap propertiesForGID:tileGid];
		if (properties) {
			NSString *collision = [properties valueForKey:@"Collidable"];
			if (collision && [collision compare:@"True"] == NSOrderedSame) {
				return;
			}
		}
	}
	
	//Update the tile map position
	//We are casting the positions here because of some cocos2d artifacting
	//issues I have had. When I cast them to an int the black lines go away.
	//I believe this is because without the cast some tiles end up trying to
	//be rendered between pixels and this creates anomolies.
	position = ccp((int)position.x, (int)position.y);
	self.backgroundLayer.position = position;
	
}

- (void) dealloc {
	self.backgroundLayer = nil;
	self.playerLayer = nil;
	self.hudLayer = nil;
	
	[super dealloc];
}

@end
