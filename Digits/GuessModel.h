//
//  GuessModel.h
//  Digits
//
//  Created by Eric Larson on 8/30/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    GuessValueLower,
    GuessValueHigher,
    GuessValueCorrect,
} GuessValue;

@interface GuessModel : NSObject

-(GuessValue) makeAGuess:(NSInteger) guess;
-(NSInteger) getLowerRange;
-(NSInteger) getHigherRange;

@end

NS_ASSUME_NONNULL_END
