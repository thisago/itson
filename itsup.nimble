# Package

version       = "0.3.0"
author        = "Thiago Navarro"
description   = "It's up? A bridge to check if site is up without revealing URL"
license       = "MIT"
srcDir        = "src"
bin           = @["itsup"]

binDir = "build"

requires "prologue"
requires "harpoon"
requires "cligen"

# Dependencies

requires "nim >= 1.6.4"
