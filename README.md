# SPEC CPU 2006 within a Docker Container

This is a docker container for SPEC CPU benchmark installation and execution on Ubuntu.
Currently, it supports Xenial (16.04), Bionic (18.04) and Focal(20.04).

Note that you should get the SPEC CPU 2006 iso file by yourself.

## Quick Tutorial with Docker

First, place the SPEC CPU iso file in `${your_data_dir}` with file name
`SPEC_CPU2006v1.1.iso`.
Or you can custimize the file name by modifying SPECIMG env in `Dockerfile`.

Build the docker image.

```shell
docker build -t spec_focal:1.0 .
```

Run the docker container with a mount directory.

```shell
docker run --privileged -it -v${your_data_dir}:/data spec_focal:1.0 bash
```

Finally, you should get the compiled binaries under ${your_data_dir}/spec_bin.

## Quick Tutorial without Docker

First, place the SPEC CPU iso file in this directory with file name
SPEC_CPU2006v1.1.iso.

Extract source code from the iso file.

```shell
$ ./extract_spec.sh
```

Apply patch for build.

```shell
$ ./patch-for-ubuntu16.04.sh
```

or

```shell
$ ./patch-for-ubuntu18.04.sh
```

Build SPEC CPU 2006.  This would take few minutes.

```shell
$ ./build.sh
```

Run mcf workload.

```shell
$ ./run.sh mcf
```

## History

This is a fork of the
[spec_on_ubuntu_xenial](https://github.com/sjp38/spec_on_ubuntu_xenial), which
was made to support only Ubuntu Xenial (16.04).  Yunjae has extended it to
additionally support Bionic (18.04), ad as a result this fork has made.  Note
that the previous version (spec_on_ubuntu_xenial) is deprecated.

## Author

SeongJae Park <sj38.park@gmail.com>
Yunjae Lee <lyj7694@gmail.com>
