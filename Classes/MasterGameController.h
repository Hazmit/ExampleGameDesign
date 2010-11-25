//
//  MasterGameController.h
//  CosmicCowboy
//
//  Created by Jonathan Johnson on 11/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "BackgroundLayer.h"
#import "PlayerLayer.h"
#import "HUDLayer.h"
#import "TileMap.h"

@interface MasterGameController : CCNode {
	CGPoint viewPoint;
	BackgroundLayer *backgroundLayer;
	HUDLayer *hudLayer;
	PlayerLayer *playerLayer;
}

@property(nonatomic, retain) BackgroundLayer *backgroundLayer;
@property(nonatomic, retain) PlayerLayer *playerLayer;
@property(nonatomic, retain) HUDLayer *hudLayer;

+ (id) sharedController;
- (void)applyJoystick:(SneakyJoystick *)aJoystick toNode:(CCNode *)aNode forTimeDelta:(float)dt;
- (void)tick:(float)delta;

@end