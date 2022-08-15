# It's Up?

Is my website up?

A tool to check if a website is online without revealing the real URL

## Installation

```bash
git clone https://github.com/thisago/itsup
cd itsup
nimble install -y
```

## Usage

Example:
- `-c build/cache.json` (`--cacheJson`) is the cache file that will be created
- `-s` [`example/sites.json`](example/sites.json) (`--sitesJson`) is where you config what sites to check (see the file)
- `--delay` or `-d` is the time between checks, the "expiration of cache"
- `--timeout` or `-t` is the max accepted timeout of site response (the correct is to be less than the `--delay`)

```bash
itsup -s example/sites.json -c build/cache.json -d 1000 -t 1000
```

## Help

```bash
$ itsup --help
Usage:
  itsUp [REQUIRED,optional-params] 
Options:
  -h, --help                           print this cligen-erated help
  --help-syntax                        advanced: prepend,plurals,..
  -s=, --sitesJson=  string  REQUIRED  set sitesJson
  -c=, --cacheJson=  string  REQUIRED  set cacheJson
  -d=, --delay=      int     REQUIRED  set delay
  -t=, --timeout=    int     REQUIRED  set timeout
```

---

## License

MIT
