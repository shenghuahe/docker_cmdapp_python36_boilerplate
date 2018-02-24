# docker_cmdapp_python36_boilerplate
A boilerplate of a python3.6 command line app in Docker. 

### Features
* Designed to run a Python script every n seconds using ENTRYPOINT and CMD (Act like a CRON job).
* Can be built and deployed to i.e. ECS (Elastic Container Service).
* SIGINT and SIGTERM are tracked properly and CTRL + C will also terminate the app gracefully.

### How to build and run
```
make build
make run
```

### ENTRYPOINT and CMD explained
You'll see something like the following in the Dockerfile
```
ENTRYPOINT ["/bin/bash", "/home/appuser/entrypoint.sh"]
CMD ["10"]
```
This is equivalent to `/bin/bash /home/appuser/entrypoint.sh 10`. `10` is number of seconds of interval to execute the python script `main.py` repeatably. Feel free to change this.

Have fun!

