//
//  DZAUnsafeMutableArray.m
//  DZAUnsafeMutableArray
//
//  Created by Davide Di Stefano on 20/06/17.
//

#import "DZAUnsafeMutableArray.h"

@implementation DZAUnsafeMutableArray

-(instancetype) initWithCapacity:(NSUInteger) initialCapacity
{
    if (self = [super init])
    {
        _capacity = initialCapacity;
        _count = 0;
        _elementSize = sizeof(int);
        _unsafePointer = malloc(_elementSize * _capacity);
        [self reassignPointers];
    }
    return self;
}

-(void) dealloc
{
    free(_unsafePointer);
}

-(void) addInt:(int) element
{
    if (_count >= _capacity)
    {
        [self growArray];
    }
    _intUnsafePointer[_count] = element;
    _count++;
}

-(int) intAtIndex:(int) index;
{
    assert(index < _count);
    return (_intUnsafePointer)[index];
}

-(void) removeLastObject;
{
    _intUnsafePointer[_count] = 0;
    if (_count > 0)
    {
        _count--;
    }
}

// new size should be smaller then length, otherwise the method does nothing
-(void) shrinkToSize:(NSUInteger) newSize;
{
    for (NSUInteger i = newSize; i < _count; i++)
    {
        _intUnsafePointer[i] = 0;
    }
    _count = newSize;
}

-(void) growArray
{
    _capacity = _capacity * 2;
    _unsafePointer = realloc(_unsafePointer, _elementSize * _capacity);
    [self reassignPointers];
}

-(void) reassignPointers
{
    _intUnsafePointer = _unsafePointer;
}

@end
