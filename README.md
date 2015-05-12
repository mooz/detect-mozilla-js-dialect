# Script for detecting mozilla js dialect's deprecated syntaxes

Detect mozilla js dialect's deprecated syntaxes including *expression
closure* (`function (x) x * x`), *let expression* (`let (x = 10) x`),
and *let body* (`let (x = 10) { x };`).

## Usage

Call `detect_mozilla_dialect.sh` with suspicious files,

    ./detect_mozilla_dialect.sh ./test/test.js

and the script outputs the following messages in *gcc's error message
style*.

    ./test/test.js:8: expression closure is deprecated
    ./test/test.js:3: let expression/body is deprecated

## Deprecated syntaxes

See https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Deprecated_and_obsolete_features
for the list of deprecated syntaxes.
