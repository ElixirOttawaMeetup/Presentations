docker build -t string_split_proper .
docker run --rm -it -v $PWD:/app string_split_proper /bin/bash
