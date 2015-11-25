docker-jekyll
=============

Docker build for image with Jekyll and Node

Build:

```
docker build -t wetransform/jekyll .
```

Default working directory is `/opt/jekyll`. Use it to mount a Jekyll site as volume and conveniently call `jekyll serve` or `jekyll build`, e.g.:

```
docker run -it -v $(pwd):/opt/jekyll -p 9001:9001 wetransform/jekyll jekyll serve
```


Tags
----

For manully created images create a tag featuring the version numbers of the main libraries/tools, e.g. `jekyll-2.5.3_ruby-2.1_node-0.12.4`.


License
-------

MIT
