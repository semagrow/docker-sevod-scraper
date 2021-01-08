#!/bin/bash

case "$MODE" in
  "rdfdump")
    ARGS="--rdfdump"
    ;;
  "geordfdump")
    ARGS="--geordfdump"
    ;;
  "cassandra")
    ARGS="--cassandra"
    ;;
  "sparql")
    ARGS="--sparql"
    ;;
  *)
    ARGS=""
    ;;
esac

if [ "$INPUT"     ] ;  then ARGS=$ARGS" -i "$INPUT     ; fi
if [ "$OUTPUT"    ] ;  then ARGS=$ARGS" -o "$OUTPUT    ; fi
if [ "$ENDPOINT"  ] ;  then ARGS=$ARGS" -e "$ENDPOINT  ; fi
if [ "$PREFIXES"  ] ;  then ARGS=$ARGS" -p "$PREFIXES  ; fi
if [ "$GRAPH"     ] ;  then ARGS=$ARGS" -g "$GRAPH     ; fi
if [ "$POLYGON"   ] ;  then ARGS=$ARGS" -P "$POLYGON   ; fi
if [ "$NAMESPACE" ] ;  then ARGS=$ARGS" -n "$NAMESPACE ; fi

echo "sevod scraper args: "$ARGS

./sevod-scraper.sh $ARGS
