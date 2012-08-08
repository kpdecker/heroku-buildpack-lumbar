# heroku-buildpack-lumbar

Lumbar buildpack for heroku.

Note:
This buildpack compiles the static lumbar resources only. A binary server is necessary using
mock-server or a custom implementation.

[heroku-buildpack-multi](https://github.com/ddollar/heroku-buildpack-multi) combined with a language
specific build pack is highlight recommended.

## Usage

_.buildpacks_
```
https://github.com/heroku/heroku-buildpack-nodejs.git
https://github.com/kpdecker/heroku-buildpack-lumbar.git
```

## Recompiling the vulcan package

1. Download the latest version of node.
2. `tar zxvf $nodePackage`
3. `cd $nodePackageDir`
4. `vulcan create $name`
5. `vulcan build`
6. `./build-binaries.sh $vulcanPackage`
