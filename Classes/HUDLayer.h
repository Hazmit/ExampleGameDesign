//
//  HUDLayer.h
//  CosmicCowboy
//
//  Created by Jonathan Johnson on 11/20/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "cocos2d.h"
#import "SneakyJoystick.h"
#import "SneakyJoystickSkinnedBase.h"

@interface HUDLayer : CCLayer {
	SneakyJoystickSkinnedBase *joy;
}

@property(nonatomic, retain) SneakyJoystickSkinnedBase *joy;

@end
