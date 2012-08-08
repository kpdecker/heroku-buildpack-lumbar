# heroku-buildpack-lumbar

Lumbar buildpack for heroku.

## Recompiling the vulcan package

1. Download the latest version of node.
2. `tar zxvf $nodePackage`
3. `cd $nodePackageDir`
4. `vulcan create $name`
5. `vulcan build`
6. `./build-binaries.sh $vulcanPackage`
