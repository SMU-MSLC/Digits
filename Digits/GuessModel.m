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

-(NSInteger) makeAGuess:(NSInteger) guess{
    NSInteger currentValue = [self.correctNum intValue];
    if( currentValue == guess)
        return 1;
    else if( currentValue < guess)
        return 0;
    else
        return 2;
    
}

@end
