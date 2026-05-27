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

# Copy each .d.ts as .d.mts, rewriting relative imports (e.g. './Op') to
# include .mjs extensions (e.g. './Op.mjs') for node16/nodenext resolution.
for f in dist/types/*.d.ts; do
  out="${f%.d.ts}.d.mts"
  sed -E \
    -e "s|from '(\\./[^']+)';|from '\\1.mjs';|g" \
    -e 's|from "(\./[^"]+)";|from "\1.mjs";|g' \
    "$f" > "$out"
done
