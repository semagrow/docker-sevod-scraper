# docker-sevod-scraper

This is the docker container for sevod-scraper.
Sevod-scraper is a tool to create dataset metadata for Semagrow.

To build docker-sevod-scraper go into the clone directory and run

    docker build -t sevod-scraper .


As an example, suppose that your dataset is stored locally in `/my/path/dump.nt`
and its SPARQL endpoint is `http://localhost:8080/sparql`.
To extract its metadata for Semagrow, issue the following command:

    docker run --rm \
       -e MODE=rdfdump \
       -e INPUT=/share/dump.nt \
       -e OUTPUT=/share/metadata.ttl \
       -e ENDPOINT=http://localhost:8890/sparql \
       -v /my/path:/share \
      sevod-scraper

The result of sevod-scraper should appear in `/my/path/metadata.ttl`.

In general, you can control the sevod-scraper using the following environment variables:

Variable     | Description
:------------|:-----------------------------------------------------
 `MODE`      |  Determines the type of the input. Possible values:
 &nbsp;      |  `rdfdump`:  input is a path to an RDF file in ntriples format
 &nbsp;      |  `geordfdump`:  input is a path to geospatial RDF file in ntriples format
 &nbsp;      |  `cassandra`: input is a Cassandra keyspace
 &nbsp;      |  `sparql`: input is a SPARQL endpoint
 `INPUT`     |  input (type of input determined by `MODE`)
 `OUTPUT`    |  path to write the output
 `ENDPOINT`  |  SPARQL endpoint URL (used for annotation only)
 `PREFIXES`  |  List of known URI prefixes (comma-separated)
 `GRAPH`     |  Graph (only for SPARQL endpoint)
 `POLYGON`   |  Known bounding polygon (for geospatial RDF files)
 `NAMESPACE` |  Namespace for URI mappings (only for cassandra)

For more info about the tool and more examples see https://github.com/semagrow/sevod-scraper
