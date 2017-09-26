docker build -f Dockerfile -t bank .
docker run -it --rm -v $(pwd):/app --name bank --network bankcommandedpresentationsep252017_default bank
