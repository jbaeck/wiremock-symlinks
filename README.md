# wiremock-symlinks
Symlinks testing

Symlink to a folder not under the workdir will fail.

## Build and run the container

docker build -t symlink-1 . && docker run -p 8889:8080 -v /home/jb/dev/projects/wiremock/wiremock-symlinks/mount-files/:/home/wiremock --name wm-symlink --rm symlink-1 

# URLS

http://localhost:8889/static - shows files which are shipped with the container

http://localhost:8889/symlinked - tries to access a file which is symlinked outside the root-folder and fails.

