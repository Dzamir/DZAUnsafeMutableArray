//
//  DZAUnsafeMutableArray.h
//  DZAUnsafeMutableArray
//
//  Created by Davide Di Stefano on 20/06/17.
//

#import <Foundation/Foundation.h>

@interface DZAUnsafeMutableArray : NSObject

-(instancetype) initWithCapacity:(NSUInteger) initialCapacity elementSize:(size_t) elementSize;

-(void) addElement:(int) element;

@property (readonly, nonatomic) NSUInteger capacity;
@property (readonly, nonatomic) NSUInteger length;
@property (readonly, nonatomic) size_t elementSize;
@property (readonly, nonatomic) int * unsafePointer;
@end
