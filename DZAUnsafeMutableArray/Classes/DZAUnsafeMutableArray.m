//
//  DZAUnsafeMutableArray.m
//  DZAUnsafeMutableArray
//
//  Created by Davide Di Stefano on 20/06/17.
//

#import "DZAUnsafeMutableArray.h"

@implementation DZAUnsafeMutableArray

#pragma mark Life Cycle

-(instancetype) initWithCapacity:(NSUInteger) initialCapacity elementType:(Type) elementType;
{
    if (self = [super init])
    {
        _capacity = initialCapacity;
        _count = 0;
        _elementType = elementType;
        switch (_elementType)
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
        }
        _unsafePointer = malloc(_elementSize * _capacity);
        _boolUnsafePointer = nil;
        _charUnsafePointer = nil;
        _unsignedCharUnsafePointer = nil;
        _intUnsafePointer = nil;
        _unsignedIntUnsafePointer = nil;
        _shortUnsafePointer = nil;
        _unsignedShortUnsafePointer = nil;
        _longUnsafePointer = nil;
        _unsignedLongUnsafePointer = nil;
        _doubleUnsafePointer = nil;
        _floatUnsafePointer = nil;
        [self reassignPointers];
    }
    return self;
}

-(instancetype) initWithCapacity:(NSUInteger) initialCapacity;
{
    return [self initWithCapacity:initialCapacity elementType:TypeInt];
}

-(void) dealloc
{
    free(_unsafePointer);
}

#pragma mark Shrink and grow

-(void) removeLastElement;
{
    if (_count > 0)
    {
        _count--;
    }
    void * newPointer = _unsafePointer + (_count * _elementSize);
    memset(newPointer, 0, _elementSize);
}

// new size should be smaller then length, otherwise the method does nothing
-(void) shrinkToSize:(NSUInteger) newSize;
{
    if (newSize < _count)
    {
        // calculate the pointer to the first element to remove
        void * newPointer = _unsafePointer + (newSize * _elementSize);
        NSUInteger sizeToZero = (_count - newSize) * _elementSize;
        // zero all the elements
        memset(newPointer, 0, sizeToZero);
    }
    _count = newSize;
}

-(void) growArray
{
    _capacity = _capacity * 2;
    _unsafePointer = realloc(_unsafePointer, _elementSize * _capacity);
    [self reassignPointers];
}

#pragma mark utilities

-(void) reassignPointers
{
    switch (_elementType)
    {
        case TypeBool:
            _boolUnsafePointer = _unsafePointer;
            break;
        case TypeChar:
            _charUnsafePointer = _unsafePointer;
            break;
        case TypeUnsignedChar:
            _unsignedCharUnsafePointer = _unsafePointer;
            break;
        case TypeInt:
            _intUnsafePointer = _unsafePointer;
            break;
        case TypeUnsignedInt:
            _unsignedIntUnsafePointer = _unsafePointer;
            break;
        case TypeShort:
            _shortUnsafePointer = _unsafePointer;
            break;
        case TypeUnsignedShort:
            _unsignedShortUnsafePointer = _unsafePointer;
            break;
        case TypeLong:
            _longUnsafePointer = _unsafePointer;
            break;
        case TypeUnsignedLong:
            _unsignedLongUnsafePointer = _unsafePointer;
            break;
        case TypeDouble:
            _doubleUnsafePointer = _unsafePointer;
            break;
        case TypeFloat:
            _floatUnsafePointer = _unsafePointer;
            break;
        default:
            break;
    }
}

-(NSString *) elementName
{
    NSString * elementName = nil;
    switch (_elementType)
    {
        case TypeBool:
            elementName = @"bool";
            break;
        case TypeChar:
            elementName = @"char";
            break;
        case TypeUnsignedChar:
            elementName = @"unsigned char";
            break;
        case TypeInt:
            elementName = @"int";
            break;
        case TypeUnsignedInt:
            elementName = @"unsigned int";
            break;
        case TypeShort:
            elementName = @"short";
            break;
        case TypeUnsignedShort:
            elementName = @"unsigned short";
            break;
        case TypeLong:
            elementName = @"long";
            break;
        case TypeUnsignedLong:
            elementName = @"unsigned long";
            break;
        case TypeDouble:
            elementName = @"double";
            break;
        case TypeFloat:
            elementName = @"float";
            break;
        default:
            elementName = @"unknown type";
            break;
    }
    return elementName;
}

#pragma mark Int

-(void) addInt:(int) element
{
    if (_intUnsafePointer == nil)
    {
        [NSException raise:@"DZAUnsafeMutableArray wrong type" format:@"DZAUnsafeMutableArray can't call 'addInt' for a '%@' elemementType", [self elementName]];
    }
    if (_count >= _capacity)
    {
        [self growArray];
    }
    _intUnsafePointer[_count] = element;
    _count++;
}

-(int) intAtIndex:(int) index;
{
    if (_intUnsafePointer == nil)
    {
        [NSException raise:@"DZAUnsafeMutableArray wrong type" format:@"DZAUnsafeMutableArray can't call 'intAtIndex' for a '%@' elemementType", [self elementName]];
    }
    if (index >= _count)
    {
        [NSException raise:@"DZAUnsafeMutableArray out of bounds" format:@"DZAUnsafeMutableArray out of bounds element: %i element for %lu count", index, (unsigned long)_count];
    }
    return (_intUnsafePointer)[index];
}

#pragma mark Bool

-(void) addBool:(BOOL) element;
{
    if (_boolUnsafePointer == nil)
    {
        [NSException raise:@"DZAUnsafeMutableArray wrong type" format:@"DZAUnsafeMutableArray can't call 'addBool' for a '%@' elemementType", [self elementName]];
    }
    if (_count >= _capacity)
    {
        [self growArray];
    }
    _boolUnsafePointer[_count] = element;
    _count++;
}

-(BOOL) boolAtIndex:(int) index;
{
    if (_boolUnsafePointer == nil)
    {
        [NSException raise:@"DZAUnsafeMutableArray wrong type" format:@"DZAUnsafeMutableArray can't call 'boolAtIndex' for a '%@' elemementType", [self elementName]];
    }
    if (index >= _count)
    {
        [NSException raise:@"DZAUnsafeMutableArray out of bounds" format:@"DZAUnsafeMutableArray out of bounds element: %i element for %lu count", index, (unsigned long)_count];
    }
    return (_boolUnsafePointer)[index];
}

#pragma mark Char

-(void) addChar:(char) element;
{
    if (_charUnsafePointer == nil)
    {
        [NSException raise:@"DZAUnsafeMutableArray wrong type" format:@"DZAUnsafeMutableArray can't call 'addChar' for a '%@' elemementType", [self elementName]];
    }
    if (_count >= _capacity)
    {
        [self growArray];
    }
    _charUnsafePointer[_count] = element;
    _count++;
}

-(char) charAtIndex:(int) index;
{
    if (_charUnsafePointer == nil)
    {
        [NSException raise:@"DZAUnsafeMutableArray wrong type" format:@"DZAUnsafeMutableArray can't call 'charAtIndex' for a '%@' elemementType", [self elementName]];
    }
    if (index >= _count)
    {
        [NSException raise:@"DZAUnsafeMutableArray out of bounds" format:@"DZAUnsafeMutableArray out of bounds element: %i element for %lu count", index, (unsigned long)_count];
    }
    return (_charUnsafePointer)[index];
}

#pragma mark Unsigned Char

-(void) addUnsignedChar:(unsigned char) element;
{
    if (_unsignedCharUnsafePointer == nil)
    {
        [NSException raise:@"DZAUnsafeMutableArray wrong type" format:@"DZAUnsafeMutableArray can't call 'addUnsignedChar' for a '%@' elemementType", [self elementName]];
    }
    if (_count >= _capacity)
    {
        [self growArray];
    }
    _unsignedCharUnsafePointer[_count] = element;
    _count++;
}

-(unsigned char) unsignedCharAtIndex:(int) index;
{
    if (_unsignedCharUnsafePointer == nil)
    {
        [NSException raise:@"DZAUnsafeMutableArray wrong type" format:@"DZAUnsafeMutableArray can't call 'unsignedCharAtIndex' for a '%@' elemementType", [self elementName]];
    }
    if (index >= _count)
    {
        [NSException raise:@"DZAUnsafeMutableArray out of bounds" format:@"DZAUnsafeMutableArray out of bounds element: %i element for %lu count", index, (unsigned long)_count];
    }
    return (_unsignedCharUnsafePointer)[index];
}

#pragma mark Unsigned Int

-(void) addUnsignedInt:(unsigned int) element;
{
    if (_unsignedIntUnsafePointer == nil)
    {
        [NSException raise:@"DZAUnsafeMutableArray wrong type" format:@"DZAUnsafeMutableArray can't call 'addUnsignedInt' for a '%@' elemementType", [self elementName]];
    }
    if (_count >= _capacity)
    {
        [self growArray];
    }
    _unsignedIntUnsafePointer[_count] = element;
    _count++;
}

-(unsigned int) unsignedIntAtIndex:(int) index;
{
    if (_unsignedIntUnsafePointer == nil)
    {
        [NSException raise:@"DZAUnsafeMutableArray wrong type" format:@"DZAUnsafeMutableArray can't call 'unsignedIntAtIndex' for a '%@' elemementType", [self elementName]];
    }
    if (index >= _count)
    {
        [NSException raise:@"DZAUnsafeMutableArray out of bounds" format:@"DZAUnsafeMutableArray out of bounds element: %i element for %lu count", index, (unsigned long)_count];
    }
    return (_unsignedIntUnsafePointer)[index];
}

#pragma mark Short

-(void) addShort:(short) element;
{
    if (_shortUnsafePointer == nil)
    {
        [NSException raise:@"DZAUnsafeMutableArray wrong type" format:@"DZAUnsafeMutableArray can't call 'addShort' for a '%@' elemementType", [self elementName]];
    }
    if (_count >= _capacity)
    {
        [self growArray];
    }
    _shortUnsafePointer[_count] = element;
    _count++;
}

-(short) shortAtIndex:(int) index;
{
    if (_shortUnsafePointer == nil)
    {
        [NSException raise:@"DZAUnsafeMutableArray wrong type" format:@"DZAUnsafeMutableArray can't call 'shortAtIndex' for a '%@' elemementType", [self elementName]];
    }
    if (index >= _count)
    {
        [NSException raise:@"DZAUnsafeMutableArray out of bounds" format:@"DZAUnsafeMutableArray out of bounds element: %i element for %lu count", index, (unsigned long)_count];
    }
    return (_shortUnsafePointer)[index];
}

#pragma mark Unsigned Short

-(void) addUnsignedShort:(unsigned short) element;
{
    if (_unsignedShortUnsafePointer == nil)
    {
        [NSException raise:@"DZAUnsafeMutableArray wrong type" format:@"DZAUnsafeMutableArray can't call 'addUnsignedShort' for a '%@' elemementType", [self elementName]];
    }
    if (_count >= _capacity)
    {
        [self growArray];
    }
    _unsignedShortUnsafePointer[_count] = element;
    _count++;
}

-(unsigned short) unsignedShortAtIndex:(int) index;
{
    if (_unsignedShortUnsafePointer == nil)
    {
        [NSException raise:@"DZAUnsafeMutableArray wrong type" format:@"DZAUnsafeMutableArray can't call 'unsignedShortAtIndex' for a '%@' elemementType", [self elementName]];
    }
    if (index >= _count)
    {
        [NSException raise:@"DZAUnsafeMutableArray out of bounds" format:@"DZAUnsafeMutableArray out of bounds element: %i element for %lu count", index, (unsigned long)_count];
    }
    return (_unsignedShortUnsafePointer)[index];
}

#pragma mark Long

-(void) addLong:(long) element;
{
    if (_longUnsafePointer == nil)
    {
        [NSException raise:@"DZAUnsafeMutableArray wrong type" format:@"DZAUnsafeMutableArray can't call 'addLong' for a '%@' elemementType", [self elementName]];
    }
    if (_count >= _capacity)
    {
        [self growArray];
    }
    _longUnsafePointer[_count] = element;
    _count++;
}

-(long) longAtIndex:(int) index;
{
    if (_longUnsafePointer == nil)
    {
        [NSException raise:@"DZAUnsafeMutableArray wrong type" format:@"DZAUnsafeMutableArray can't call 'longAtIndex' for a '%@' elemementType", [self elementName]];
    }
    if (index >= _count)
    {
        [NSException raise:@"DZAUnsafeMutableArray out of bounds" format:@"DZAUnsafeMutableArray out of bounds element: %i element for %lu count", index, (unsigned long)_count];
    }
    return (_longUnsafePointer)[index];
}

#pragma mark Unsigned Long

-(void) addUnsignedLong:(unsigned long) element;
{
    if (_unsignedLongUnsafePointer == nil)
    {
        [NSException raise:@"DZAUnsafeMutableArray wrong type" format:@"DZAUnsafeMutableArray can't call 'addUnsignedLong' for a '%@' elemementType", [self elementName]];
    }
    if (_count >= _capacity)
    {
        [self growArray];
    }
    _unsignedLongUnsafePointer[_count] = element;
    _count++;
}

-(unsigned long) unsignedLongAtIndex:(int) index;
{
    if (_unsignedLongUnsafePointer == nil)
    {
        [NSException raise:@"DZAUnsafeMutableArray wrong type" format:@"DZAUnsafeMutableArray can't call 'unsignedLongAtIndex' for a '%@' elemementType", [self elementName]];
    }
    if (index >= _count)
    {
        [NSException raise:@"DZAUnsafeMutableArray out of bounds" format:@"DZAUnsafeMutableArray out of bounds element: %i element for %lu count", index, (unsigned long)_count];
    }
    return (_unsignedLongUnsafePointer)[index];
}

#pragma mark Double

-(void) addDouble:(double) element;
{
    if (_doubleUnsafePointer == nil)
    {
        [NSException raise:@"DZAUnsafeMutableArray wrong type" format:@"DZAUnsafeMutableArray can't call 'addDouble:' for a '%@' elemementType", [self elementName]];
    }
    if (_count >= _capacity)
    {
        [self growArray];
    }
    _doubleUnsafePointer[_count] = element;
    _count++;
}

-(double) doubleAtIndex:(int) index;
{
    if (_doubleUnsafePointer == nil)
    {
        [NSException raise:@"DZAUnsafeMutableArray wrong type" format:@"DZAUnsafeMutableArray can't call 'doubleAtIndex' for a '%@' elemementType", [self elementName]];
    }
    if (index >= _count)
    {
        [NSException raise:@"DZAUnsafeMutableArray out of bounds" format:@"DZAUnsafeMutableArray out of bounds element: %i element for %lu count", index, (unsigned long)_count];
    }
    return (_doubleUnsafePointer)[index];
}

#pragma mark Float

-(void) addFloat:(float) element;
{
    if (_floatUnsafePointer == nil)
    {
        [NSException raise:@"DZAUnsafeMutableArray wrong type" format:@"DZAUnsafeMutableArray can't call 'addFloat:' for a '%@' elemementType", [self elementName]];
    }
    if (_count >= _capacity)
    {
        [self growArray];
    }
    _floatUnsafePointer[_count] = element;
    _count++;
}

-(float) floatAtIndex:(int) index;
{
    if (_floatUnsafePointer == nil)
    {
        [NSException raise:@"DZAUnsafeMutableArray wrong type" format:@"DZAUnsafeMutableArray can't call 'floatAtIndex' for a '%@' elemementType", [self elementName]];
    }
    if (index >= _count)
    {
        [NSException raise:@"DZAUnsafeMutableArray out of bounds" format:@"DZAUnsafeMutableArray out of bounds element: %i element for %lu count", index, (unsigned long)_count];
    }
    return (_floatUnsafePointer)[index];
}

@end
