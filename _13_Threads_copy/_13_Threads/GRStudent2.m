//
//  GRStudent2.m
//  _13_Threads
//
//  Created by Exo-terminal on 3/25/14.
//  Copyright (c) 2014 Evgenia. All rights reserved.
//

#import "GRStudent2.h"

@interface GRStudent2()
@end

@implementation GRStudent2

- (instancetype)initWithName:(NSString*)name
{
    self = [super init];
    if (self) {
        self.name = name;
    }
    return self;
}


-(void)proseed:(NSDictionary*) dictionary{
    
    NSInteger trueNumber = [[dictionary objectForKey:@"trueNumber"]intValue];
    NSInteger startNumber = [[dictionary objectForKey:@"startnumber"] intValue];
    NSInteger finishNumber = [[dictionary objectForKey:@"finishNumber"]intValue];
    
        double timeStart = CACurrentMediaTime();
        NSInteger i = 0;
        while (i != trueNumber) {
            i = arc4random()%(finishNumber-startNumber+1)+startNumber;
        }
    self.blockResult(CACurrentMediaTime()-timeStart);
 }

-(void)guessQuestion1:(NSDictionary*) parametersDictionary block:(void(^)(CGFloat time)) blockResult {
    
   self.blockResult = blockResult;
    
   static NSOperationQueue *queue;
   if (!queue) {
        queue = [NSOperationQueue new];
    }
   queue.maxConcurrentOperationCount = 5;
    
   NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self
																			selector:@selector(proseed:)
																			  object:parametersDictionary];
  [queue addOperation:operation];
  }
 @end
