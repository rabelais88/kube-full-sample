# client
docker build -t rabelais/multi-client:latest \
    -t rabelais/multi-client:$SHA \
    -f ./client/Dockerfile \
    ./client
docker push rabelais/multi-client:latest
docker push rabelais/multi-client:$SHA

# server
docker build -t rabelais/multi-server:latest \
    -f rabelais/multi-server:$SHA \
    ./server/Dockerfile \
    ./server
docker push rabelais/multi-server:latest
docker push rabelais/multi-server:$SHA

# worker
docker build -t rabelais/multi-worker:latest \
    -f rabelais/multi-worker:$SHA \
    ./worker/Dockerfile \
    ./worker
docker push rabelais/multi-worker:latest
docker push rabelais/multi-worker:$SHA

kubectl apply -f k8s
# force-changing images with same tag
# w/o this, k8 wouldn't try to change the image unless the tags are changed.
# when accessing deployment, "deployment/${yaml.metadata.name}"
kubectl set image deployment/server-deployment server=rabelais/multi-server:$SHA
kubectl set image deployment/client-deployment client=rabelais/multi-client:$SHA
kubectl set image deployment/worker-deployment client=rabelais/multi-worker:$SHA
