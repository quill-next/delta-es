#!/bin/sh

TSC=./node_modules/.bin/tsc
ESBUILD=./node_modules/.bin/esbuild

rm -rf dist

$TSC --project tsconfig.esm.json

# As in quill-delta, require() returns Delta itself (with Delta.default).
# Only the CommonJS bundle does this, so the ES module bundle never
# touches `module`, which bundlers warn about.
$ESBUILD --bundle dist/esm/Delta.js --outfile=dist/index.js \
  --format=cjs --platform=node --sourcemap \
  --footer:js='module.exports = module.exports.default; module.exports.default = module.exports;'

$ESBUILD --bundle dist/esm/Delta.js --outfile=dist/index.mjs \
  --format=esm --platform=browser --sourcemap

rm -rf dist/esm
