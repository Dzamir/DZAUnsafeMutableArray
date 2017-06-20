//
//  DZAUnsafeMutableArray.m
//  DZAUnsafeMutableArray
//
//  Created by Davide Di Stefano on 20/06/17.
//

#import "DZAUnsafeMutableArray.h"

@implementation DZAUnsafeMutableArray

-(instancetype) initWithCapacity:(NSUInteger) initialCapacity elementSize:(size_t) elementSize;
{
    if (self = [super init])
    {
        _capacity = initialCapacity;
        _length = 0;
        _elementSize = elementSize;
        _unsafePointer = malloc(elementSize * _capacity);
    }
    return self;
}

-(void) addElement:(int) element;
{
    if (_length >= _capacity)
    {
        [self growArray];
    }
    _unsafePointer[_length] = element;
    _length++;
}

-(void) growArray
{
}
@end
