# Package

version       = "0.1.0"
author        = "Thiago Navarro"
description   = "It's on? A bridge to check if site is online without revealing URL"
license       = "MIT"
srcDir        = "src"
bin           = @["itsup"]

binDir = "build"

requires "prologue"
requires "cligen"

# Dependencies

requires "nim >= 1.6.4"
