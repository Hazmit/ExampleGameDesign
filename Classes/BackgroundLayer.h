//
//  BackgroundLayer.h
//  TestGame
//
//  Created by jon on 11/19/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "cocos2d.h"

@interface BackgroundLayer : CCLayer {
	CCLabel *label;
}

@property(nonatomic, retain) CCLabel *label;

+(id)sharedLayer;

@end
