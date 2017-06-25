//
//  DZAUnsafeMutableArray.h
//  DZAUnsafeMutableArray
//
//  Created by Davide Di Stefano on 20/06/17.
//
//  An Objectice-c wrapper around a pointer to a growing array of int values

#import <Foundation/Foundation.h>

@interface DZAUnsafeMutableArray : NSObject

-(instancetype) initWithCapacity:(NSUInteger) initialCapacity;

-(void) addInt:(int) element;
-(int) intAtIndex:(int) index;
// removes latest object from the array
-(void) removeLastObject;
// new size should be smaller then length, otherwise the method does nothing
-(void) shrinkToSize:(NSUInteger) newSize;

@property (readonly, nonatomic) NSUInteger capacity;
@property (readonly, nonatomic) NSUInteger length;
@property (readonly, nonatomic) size_t elementSize;
@property (readonly, nonatomic) void * unsafePointer;
@property (readonly, nonatomic) int * intUnsafePointer;

@end
