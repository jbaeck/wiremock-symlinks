# wiremock-symlinks
Symlinks testing

Symlink to a folder not under the workdir will fail.
The volume mount is now created for /home/wiremock-symlink/mount-target and a symlink is created in /home/wiremock-symlink/__files/dynamic -> /home/wiremock-symlink/mount-target.

## Build and run the container

docker build -t symlink-2 . && docker run -p 8889:8080 -v $PWD/mount-files/:/home/wiremock-symlink/mount-target --name wm-symlink symlink-2

# URLS

http://localhost:8889/static - shows files which are shipped with the container

http://localhost:8889/symlinked - tries to access a file which is symlinked to a subfolder which is a mountpoint and fails.

