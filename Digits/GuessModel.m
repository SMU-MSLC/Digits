//
//  GuessModel.m
//  Digits
//
//  Created by Eric Larson on 8/30/22.
//

#import "GuessModel.h"

@interface GuessModel ()

@property (strong, nonatomic) NSNumber* correctNum;

@end


@implementation GuessModel

-(NSNumber*) correctNum{
    if(!_correctNum)
        _correctNum = @(arc4random_uniform(100)+1);
    return _correctNum;
}

-(GuessValue) makeAGuess:(NSInteger) guess{
    NSInteger currentValue = [self.correctNum intValue];
    if( currentValue == guess)
        return GuessValueCorrect;
    else if( currentValue < guess)
        return GuessValueLower;
    else
        return GuessValueHigher;
    
}

@end
