#/bin/bash
grep '==.*completed' $1 | sed 's/.*(\([0-9\\.]*\) ms).*/\1/g' | tr '.' ',' | datamash mean 1 median 1
