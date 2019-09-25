# kubernetes setup example
## building images
```bash
# client
docker build -f ./client/Dockerfile -t rabelais/multi-client:latest ./client
docker push rabelais/multi-client:latest
docker build -f ./server/Dockerfile -t rabelais/multi-server:latest ./server
docker push rabelais/multi-server:latest
docker build -f ./worker/Dockerfile -t rabelais/multi-worker:latest ./worker
docker push rabelais/multi-worker:latest
```