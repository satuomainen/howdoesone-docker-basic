Basic docker sample
===

Intro
---

This is a simple example of the docker stuff that I need to remember when 
setting up docker to do anything. The details can be found in the excellent
Docker documentation.

Using images and building containers
---

Look inside the files in `docker/` for the actual stuff. To build and run
the container, just say `./build.sh && ./run.sh`. To stop the container, 
press `Ctrl+C`. To run the container "in the background", use the `-d`
(or `--detach`) option with `docker run` command (see `run.sh`).

To start an existing container again, say `docker start <containername>`.

Sharing filesystem resources between host and container
---

The directory `docker/basicdata/` will be mounted into the container (see
`run.sh`) and the software in the container can read & write the directory
contents.

Open a shell a shell inside a running container, execute
`docker exec -i -t <containername> /bin/bash`

Then edit the file in the mounted directory `vi /data/greeting.txt`, 
save and observe how the changes are visible in the host as well.

Cleaning up
---

Downloaded base images are saved on disk. Also the containers take up 
space and so do any volumes created by containers. 

To remove obsolete containers
* see what's there: `docker ps -a`
* delete what's not wanted: `docker rm -f <containerid>`

To remove obsolete images:
* see what's there: `docker images`
* delete what's not wanted: `docker rmi -f <imageid>`

To remove obsolete volumes:
* see what's there: `docker volume ls`
* delete what's not wanted: `docker volume rm <volumename>`
