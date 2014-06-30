//
//  CubeNavigationAnimator.h
//  MovieQuiz
//
//  Created by Andrés Brun on 27/10/13.
//  Copyright (c) 2013 Andrés Brun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CEBaseAnimationController.h"

typedef enum {CubeAnimationWayHorizontal, CubeAnimationWayVertical} CubeAnimationWay;
typedef enum {CubeAnimationTypeInverse, CubeAnimationTypeNormal} CubeAnimationType;

@interface CECubeAnimationController : CEBaseAnimationController

@property (nonatomic, assign) CubeAnimationWay cubeAnimationWay;
@property (nonatomic, assign) CubeAnimationType cubeAnimationType;

@end
