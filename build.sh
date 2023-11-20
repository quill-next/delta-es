#!/bin/sh

TSC=./node_modules/.bin/tsc
ESBUILD=./node_modules/.bin/esbuild

rm -rf dist

$TSC --project tsconfig.esm.json

$ESBUILD --bundle dist/esm/Delta.js --outfile=dist/index.js \
  --format=cjs --platform=node --sourcemap

$ESBUILD --bundle dist/esm/Delta.js --outfile=dist/index.mjs \
  --format=esm --platform=browser --sourcemap

rm -rf dist/esm
