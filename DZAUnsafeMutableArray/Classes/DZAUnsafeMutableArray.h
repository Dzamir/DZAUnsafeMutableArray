//
//  DZAUnsafeMutableArray.h
//  DZAUnsafeMutableArray
//
//  Created by Davide Di Stefano on 20/06/17.
//

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

-(instancetype) initWithCapacity:(NSUInteger) initialCapacity elementSize:(size_t) elementSize;

-(void) addElement:(void *) element;
-(void *) elementAtIndex:(int) index;

-(void) addInt:(int) element;
-(int) intAtIndex:(int) index;

//-(void) addElement2:(TypesUnion) element;
//-(TypesUnion) elementAtIndex2:(int) index;

@property (readonly, nonatomic) NSUInteger capacity;
@property (readonly, nonatomic) NSUInteger length;
@property (readonly, nonatomic) size_t elementSize;
@property (readonly, nonatomic) void * unsafePointer;
@property (readonly, nonatomic) int * intUnsafePointer;
//@property (readonly, nonatomic) TypesUnion * unsafePointer2;

@end
