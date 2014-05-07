//
//  NSData+MTKDeflate.h
//  MTKTools
//
//  Created by Maxthon Chan on 5/6/14.
//  Copyright (c) 2014 Maxthon Chan. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 Level of compression.
 */
typedef NS_ENUM(NSInteger, MTKCompressionLevel)
{
    /// No compression.
    MTKCompressionLevelNoCompression = 0,
    
    /// Fastest compression.
    MTKCompressionLevelBestSpeed = 1,
    
    /// Smallest compression.
    MTKCompressionLevelBestSize = 9,
    
    /// Default compression ratio.
    MTKCompressionLevelDefault = -1
};

@interface NSData (MTKCompression)

/// DEFLATE compressing using default compression level.
- (NSData *)zlibCompress;

/**
 DEFLATE compressing using given level.
 
 @param     level   Compression level.
 */
- (NSData *)zlibCompressWithLevel:(MTKCompressionLevel)level;

/// DEFLATE decompressing.
- (NSData *)zlibDecompress;

/// Gzip compressing using default compression level.
- (NSData *)gzipCompress;

/**
 Gzip compressing using given level.
 
 @param     level   Compression level.
 */
- (NSData *)gzipCompressWithLevel:(MTKCompressionLevel)level;

/// Gzip decompressing.
- (NSData *)gzipDecompress;

/// Bzip2 compressing using default compression level.
- (NSData *)bzipCompress;

/**
 Bzip2 compressing using given level.
 
 @param     level   Compression level.
 */
- (NSData *)bzipCompressWithLevel:(MTKCompressionLevel)level;

/// Bzip2 decompressing.
- (NSData *)bzipDecompress;

@end
