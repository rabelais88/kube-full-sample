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

## workflow(travis-CI)
1. Install Google Cloud SDK CLI
2. Configure SDK with GC auth
  > service-account.json must be served via extensive Travis-CI settings
  > must use Travis-CI CLI
  > https://github.com/travis-ci/travis.rb#installation
3. Docker CLI login
4. build
5. run test
6. push docker image to hub
7. apply k8s config

### travis-CI auth encryption
```bash
travis login # use Github info
travis encrypt-file ${GC_AUTH_JSON_FILE} -r ${GITHUB_USERNAME}/${GITHUB_REPO_NAME}
```