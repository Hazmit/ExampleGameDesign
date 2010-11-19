//
//  HelloWorldLayer.h
//  TestGame
//
//  Created by jon on 11/19/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorld Layer
@interface GameDirectorScene : CCLayer {
	CCLayer *background;
	CCLayer *character;
	CCLayer *hud;
}

@property(nonatomic, retain) CCLayer *background;
@property(nonatomic, retain) CCLayer *character;
@property(nonatomic, retain) CCLayer *hud;

// returns a Scene that contains the HelloWorld as the only child
+(id) scene;

@end
