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
/*        switch (type)
        {
            case TypeBool:
                _elementSize = sizeof(BOOL);
                break;
            case TypeChar:
                _elementSize = sizeof(char);
                break;
            case TypeUnsignedChar:
                _elementSize = sizeof(unsigned char);
                break;
            case TypeInt:
                _elementSize = sizeof(int);
                break;
            case TypeUnsignedInt:
                _elementSize = sizeof(unsigned int);
                break;
            case TypeShort:
                _elementSize = sizeof(short);
                break;
            case TypeUnsignedShort:
                _elementSize = sizeof(unsigned short);
                break;
            case TypeLong:
                _elementSize = sizeof(long);
                break;
            case TypeUnsignedLong:
                _elementSize = sizeof(unsigned long);
                break;
            case TypeDouble:
                _elementSize = sizeof(double);
                break;
            case TypeFloat:
                _elementSize = sizeof(float);
                break;
            default:
                _elementSize = sizeof(int);
                break;
        }*/
        _unsafePointer = malloc(_elementSize * _capacity);
        [self reassignPointers];
    }
    return self;
}

-(void) dealloc
{
    free(_unsafePointer);
}

-(void) addElement:(void *) element;
{
    if (_length >= _capacity)
    {
        [self growArray];
    }
    ((int*)_unsafePointer)[_length] =  *((int *)element);
    _length++;
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

-(void *) elementAtIndex:(int) index;
{
    assert(index < _length);
    return &(_unsafePointer[index]);
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
