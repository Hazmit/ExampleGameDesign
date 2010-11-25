//
//  BackgroundLayer.h
//  CosmicCowboy
//
//  Created by Jonathan Johnson on 11/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "TileMap.h"

@interface BackgroundLayer : CCLayer {
	CCLabel	*label;
	TileMap *tileMap;
	CCTMXLayer *background;
	CCTMXLayer *meta;
}

@property(nonatomic, retain) CCLabel *label;
@property(nonatomic, retain) TileMap *tileMap;
@property(nonatomic, retain) CCTMXLayer *background;
@property(nonatomic, retain) CCTMXLayer *meta;

@end
