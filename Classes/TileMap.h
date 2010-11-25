//
//  TileMap.h
//  CosmicCowboy
//
//  Created by Jonathan Johnson on 11/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"

@interface TileMap : CCTMXTiledMap {
	CCTMXLayer *layer;
}

@property(nonatomic, retain) CCTMXLayer *layer;

- (CGPoint)coordinatesAtPosition:(CGPoint)point;
- (unsigned int)getGIDAtPosition:(CGPoint)point;

@end
