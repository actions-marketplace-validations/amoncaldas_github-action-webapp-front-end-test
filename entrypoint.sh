#!/bin/sh -l
set -e

target=$1

time=$(date)
echo "$time Run: npm ci"
npm ci

time=$(date)
echo "$time Run: npm rebuild node-sass"
npm rebuild node-sass

time=$(date)
echo "$time Run: npm run $target"
npm run "$target"
