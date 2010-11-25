//
//  PlayerLayer.h
//  CosmicCowboy
//
//  Created by Jonathan Johnson on 11/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

@interface PlayerLayer : CCLayer {
	CCSprite *player;
}

@property(nonatomic, retain) CCSprite *player;

@end
