from std/tables import Table, `[]=`, `$`
from std/json import parseJson, to, `$`
import std/jsonutils
from std/os import fileExists
from std/times import getTime, toUnix

import std/locks

import pkg/prologue

type
  Sites = Table[string, string]
  Cache = Table[string, tuple[online: bool, time: int64]]

proc getCache(file: string): Cache =
  ## Retrieves the cache from a json file
  if fileExists file:
    let node = file.readFile.parseJson.to Cache
    echo node
proc setCache(file: string; data: Cache) =
  ## Saves the cache to a json file
  file.writeFile data.toJson.`$`

proc itson*(sitesJson, cacheJson: string) =
  var sitesLock: Lock
  let sites {.guard: sitesLock.} = sitesJson.readFile.parseJson.to Sites


  proc check(ctx: Context) {.async.} =
    ## Checks if website is online
    let id = ctx.getPathParams("id", "")
    var site = ""
    {.gcsafe.}:
      withLock sitesLock:
        if sites.hasKey id:
          site = sites[id]
    var cache = cacheJson.getCache
    cache[site] = (true, getTime().toUnix)
    echo cache
    cacheJson.setCache cache

    resp "<h1>" & site & "</h1>"
    
  initLock sitesLock

  let app = newApp()
  app.get("/{id}", check)
  run app

  deinitLock sitesLock


when isMainModule:
  import pkg/cligen
  dispatch itson
