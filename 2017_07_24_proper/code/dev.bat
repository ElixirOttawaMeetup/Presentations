docker build -t string_split_proper .
docker run --rm -it -v %cd%:/app string_split_proper /bin/bash
