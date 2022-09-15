//
//  GuessModel.m
//  Digits
//
//  Created by Eric Larson on 8/30/22.
//

#import "GuessModel.h"

@interface GuessModel ()

@property (strong, nonatomic) NSNumber* correctNum;
@property (strong, nonatomic) NSMutableArray* range;


@end


@implementation GuessModel

-(NSNumber*) correctNum{
    if(!_correctNum)
        _correctNum = @(arc4random_uniform(100)+1);
    return _correctNum;
}

-(NSArray*) range{
    if(!_range)
        _range = [@[@1,@100] mutableCopy];
    return _range;
}

-(GuessValue) makeAGuess:(NSInteger) guess{
    NSInteger currentValue = [self.correctNum intValue];
    if( currentValue == guess){
        self.range[0] = @(guess);
        self.range[1] = @(guess);
        return GuessValueCorrect;
    }
    else if( currentValue < guess){
        if(guess < [self.range[1] intValue])
            self.range[1] = @(guess);
        return GuessValueLower;
    }
    else{
        if(guess > [self.range[0] intValue])
            self.range[0] = @(guess);
    
        return GuessValueHigher;
    }
    
}

-(NSInteger) getLowerRange{
    return [self.range[0] intValue];
}

-(NSInteger) getHigherRange{
    return [self.range[1] intValue];
}

@end
