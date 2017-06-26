//
//  DZAUnsafeMutableArray.h
//  DZAUnsafeMutableArray
//
//  Created by Davide Di Stefano on 20/06/17.
//
//  An Objectice-c wrapper around a pointer to a growing array of int values

#import <Foundation/Foundation.h>

typedef enum _Type
{
    TypeBool,
    TypeChar,
    TypeUnsignedChar,
    TypeInt,
    TypeUnsignedInt,
    TypeShort,
    TypeUnsignedShort,
    TypeLong,
    TypeUnsignedLong,
    TypeDouble,
    TypeFloat
} Type;

@interface DZAUnsafeMutableArray : NSObject

-(instancetype) initWithCapacity:(NSUInteger) initialCapacity elementType:(Type) elementType;
// initializes as int type
-(instancetype) initWithCapacity:(NSUInteger) initialCapacity;

// Adds an integer at the end of the array.
// You can only use the function for a DZAUnsafeMutableArray with elementType 'TypeInt', otherwise it will throw an Exception
-(void) addInt:(int) element;
// Returns the integer at the specified index.
// You can only use the function for a DZAUnsafeMutableArray with elementType 'TypeInt', otherwise it will throw an Exception
// If you try to access out of the bounds of the array, an Exception will be launched.
-(int) intAtIndex:(int) index;

// Adds a BOOL at the end of the array.
// You can only use the function for a DZAUnsafeMutableArray with elementType 'TypeBool', otherwise it will throw an Exception
-(void) addBool:(BOOL) element;
// Returns the BOOL at the specified index.
// You can only use the function for a DZAUnsafeMutableArray with elementType 'TypeBool', otherwise it will throw an Exception
// If you try to access out of the bounds of the array, an Exception will be launched.
-(BOOL) boolAtIndex:(int) index;

// Adds a char at the end of the array.
// You can only use the function for a DZAUnsafeMutableArray with elementType 'TypeChar', otherwise it will throw an Exception
-(void) addChar:(char) element;
// Returns the char at the specified index.
// You can only use the function for a DZAUnsafeMutableArray with elementType 'TypeChar', otherwise it will throw an Exception
// If you try to access out of the bounds of the array, an Exception will be launched.
-(char) charAtIndex:(int) index;

// Adds an unsigned char at the end of the array.
// You can only use the function for a DZAUnsafeMutableArray with elementType 'TypeUnsignedChar', otherwise it will throw an Exception
-(void) addUnsignedChar:(unsigned char) element;
// Returns the unsigned char at the specified index.
// You can only use the function for a DZAUnsafeMutableArray with elementType 'TypeUnsignedChar', otherwise it will throw an Exception
// If you try to access out of the bounds of the array, an Exception will be launched.
-(unsigned char) unsignedCharAtIndex:(int) index;

// Adds an unsigned int at the end of the array.
// You can only use the function for a DZAUnsafeMutableArray with elementType 'TypeUnsignedInt', otherwise it will throw an Exception
-(void) addUnsignedInt:(unsigned int) element;
// Returns the unsigned int at the specified index.
// You can only use the function for a DZAUnsafeMutableArray with elementType 'TypeUnsignedInt', otherwise it will throw an Exception
// If you try to access out of the bounds of the array, an Exception will be launched.
-(unsigned int) unsignedIntAtIndex:(int) index;

// Adds a short at the end of the array.
// You can only use the function for a DZAUnsafeMutableArray with elementType 'TypeShort', otherwise it will throw an Exception
-(void) addShort:(short) element;
// Returns the short at the specified index.
// You can only use the function for a DZAUnsafeMutableArray with elementType 'TypeShort', otherwise it will throw an Exception
// If you try to access out of the bounds of the array, an Exception will be launched.
-(short) shortAtIndex:(int) index;

// Adds an unsigned short at the end of the array.
// You can only use the function for a DZAUnsafeMutableArray with elementType 'TypeUnsignedShort', otherwise it will throw an Exception
-(void) addUnsignedShort:(unsigned short) element;
// Returns the unsigned short at the specified index.
// You can only use the function for a DZAUnsafeMutableArray with elementType 'TypeUnsignedShort', otherwise it will throw an Exception
// If you try to access out of the bounds of the array, an Exception will be launched.
-(unsigned short) unsignedShortAtIndex:(int) index;

// Adds an long at the end of the array.
// You can only use the function for a DZAUnsafeMutableArray with elementType 'TypeLong', otherwise it will throw an Exception
-(void) addLong:(long) element;
// Returns the long at the specified index.
// You can only use the function for a DZAUnsafeMutableArray with elementType 'TypeLong', otherwise it will throw an Exception
// If you try to access out of the bounds of the array, an Exception will be launched.
-(long) longAtIndex:(int) index;

// Adds an unsigned long at the end of the array.
// You can only use the function for a DZAUnsafeMutableArray with elementType 'TypeUnsignedLong', otherwise it will throw an Exception
-(void) addUnsignedLong:(unsigned long) element;
// Returns the unsigned long at the specified index.
// You can only use the function for a DZAUnsafeMutableArray with elementType 'TypeUnsignedLong', otherwise it will throw an Exception
// If you try to access out of the bounds of the array, an Exception will be launched.
-(unsigned long) unsignedLongAtIndex:(int) index;

// Adds an double at the end of the array.
// You can only use the function for a DZAUnsafeMutableArray with elementType 'TypeDouble', otherwise it will throw an Exception
-(void) addDouble:(double) element;
// Returns the double at the specified index.
// You can only use the function for a DZAUnsafeMutableArray with elementType 'TypeDouble', otherwise it will throw an Exception
// If you try to access out of the bounds of the array, an Exception will be launched.
-(double) doubleAtIndex:(int) index;

// Adds an float at the end of the array.
// You can only use the function for a DZAUnsafeMutableArray with elementType 'TypeFloat', otherwise it will throw an Exception
-(void) addFloat:(float) element;
// Returns the float at the specified index.
// You can only use the function for a DZAUnsafeMutableArray with elementType 'TypeFloat', otherwise it will throw an Exception
// If you try to access out of the bounds of the array, an Exception will be launched.
-(float) floatAtIndex:(int) index;

// removes latest object from the array
-(void) removeLastElement;
// new size should be smaller then length, otherwise the method does nothing
-(void) shrinkToSize:(NSUInteger) newSize;

// size of the array in memory. If the count exceds the capacity, the array will be reallocated with a larger capacity
@property (readonly, nonatomic) NSUInteger capacity;
// actual count of the array
@property (readonly, nonatomic) NSUInteger count;

@property (readonly, nonatomic) size_t elementSize;
@property (readonly, nonatomic) Type elementType;

@property (readonly, nonatomic) void * unsafePointer;
// Unsafe pointers for the various types.
// Only the pointer for the elementType is initialized, the rests remains nil and inusable
@property (readonly, nonatomic) BOOL * boolUnsafePointer;
@property (readonly, nonatomic) char * charUnsafePointer;
@property (readonly, nonatomic) unsigned char * unsignedCharUnsafePointer;
@property (readonly, nonatomic) int * intUnsafePointer;
@property (readonly, nonatomic) unsigned int * unsignedIntUnsafePointer;
@property (readonly, nonatomic) short * shortUnsafePointer;
@property (readonly, nonatomic) unsigned short * unsignedShortUnsafePointer;
@property (readonly, nonatomic) long * longUnsafePointer;
@property (readonly, nonatomic) unsigned long * unsignedLongUnsafePointer;
@property (readonly, nonatomic) double * doubleUnsafePointer;
@property (readonly, nonatomic) float * floatUnsafePointer;

@end
