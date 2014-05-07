# MTKTools

[![Build Status](https://travis-ci.org/xcvista/MTKTools.svg?branch=master)]
(https://travis-ci.org/xcvista/MTKTools)

MTKTools is a rollup of my existing support libraries for Objective-C program
language. Libraries rolled up includes:

*   `MSBooster` Cryptography Libraries
*   `MSBooster` C Compatibility Layer
*   `MSNetworking` Socket Classes
*   `CGIJSONObject` Object Serialization
*   `CGIJSONObject` JSON RPC interface

New libraries introduced:

*   A wrapper (`NSDecimalNumber`-compatible) of GNU MP library.

## Modules

Various modules are enhanced or modified to fit a broader use case.

### Cryptography Libraries

*   Use either CommonCrypto or OpenSSL, works on both OS X and Linux.
*   A full set of bitwise operations on `NSData` objects, optimized based on the
    platform (`size_t`). Try out new ciphers on yourself :)
*   Easy method access to common cryptography primitives. With Archive Libraries
    you can easily make saft transaction modules.
*   Efficiency on late 2011 MacBook Pro (13-inch, 2.7GHz Core i7-2620M): AES
    approx. 20MB/sec, MiniScramble approx. 2MB/sec, code not optimized.

### Networking Libraries

*   Designed to integrate tighter into the system than [AFNetworking]
    (http://afnetworking.com/) (several layers lower actually)
*   Synchronous interface available (compare [CocoaAsyncSocket]
    (https://github.com/robbiehanson/CocoaAsyncSocket))
*   No GCD, works on Linux as well (with [GNUStep](http://gnustep.org) Base and
    CoreBase) together with [Étoilé](http://etoileos.com/)

### Archiving Libraries

*   A common code base for different archiving formats, with built in support to
    UNIX `ar(1)` and USTAR.
*   Standard compuression methods, DEFLATE, Gzip and Bzip2 available with zlib
    and bzlib.
*   "Check archive" feature for easier implementation of signed archives.