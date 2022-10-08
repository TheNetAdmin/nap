# NAP: Not (just) a Paper

NAP is a template for writing a research paper by providing:

   1. An extensible LaTeX template to accommodate templates from different conferences
   2. An Makefile-based system to auto generate plots based on data and code dependency
   3. A Docker image to build the NAP itself

## Usage

### With Docker

1. Build the docker image
   ```shell
   $ cd docker
   $ bash build.sh
   ```
2. Build the paper
   ```shell
   $ make docker-build
   ```

### With native tools

1. Install TeXLive
2. Install R, Python, and corresponding packages
   > Check the `docker/nap.Dockerfile` for packages
3. Build the paper
   ```shell
   $ make
   ```

## License

This code is released under MIT license.
