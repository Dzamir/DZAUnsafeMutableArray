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
        _length = 0;
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
    if (_length >= _capacity)
    {
        [self growArray];
    }
    _intUnsafePointer[_length] = element;
    _length++;
}

-(int) intAtIndex:(int) index;
{
    assert(index < _length);
    return (_intUnsafePointer)[index];
}

-(void) removeLastObject;
{
    _intUnsafePointer[_length] = 0;
    if (_length > 0)
    {
        _length--;
    }
}

// new size should be smaller then length, otherwise the method does nothing
-(void) shrinkToSize:(NSUInteger) newSize;
{
    for (NSUInteger i = newSize; i < _length; i++)
    {
        _intUnsafePointer[i] = 0;
    }
    _length = newSize;
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
