# heroku-buildpack-lumbar

Lumbar buildpack for heroku.

Note:
This buildpack compiles the static lumbar resources only. A binary server is necessary using
mock-server or a custom implementation.

[heroku-buildpack-multi](https://github.com/ddollar/heroku-buildpack-multi) combined with a language
specific build pack is highlight recommended.

## Node.js Usage

_.buildpacks_
```
https://github.com/kpdecker/heroku-buildpack-lumbar.git
https://github.com/heroku/heroku-buildpack-nodejs.git
```

## Lumbar Configuration

Buildpacks do not share access to Heroku environment variables and due to this lumbar command line
configuration is not an option. All command line options must be defined through the lumbar.json
file. Foremost is the `output` config attribute which is required to use with this buildpack.

## Recompiling the vulcan package

1. Download the latest version of node.
2. `tar zxvf $nodePackage`
3. `cd $nodePackageDir`
4. vulcan build
5. ./build-binaries.sh $vulcanPackage

[More information on vulcan builds](https://devcenter.heroku.com/articles/buildpack-binaries)
