App deployment test for CoreOS using kubernetes.

I used https://github.com/pires/kubernetes-vagrant-coreos-cluster to deploy a 3 node cluster locally: 1 master with two minions.

On each of the minions, make sure that `/home/core/.dockercfg` has the correct auth info for pulling the private images.

Files included:

- `start-config` - simple shell script that will generate an app config based on environment variables.
- `Dockerfile` - generates a simple image for running `start-config`
- `app-redis-controller.json` - single replica redis.
- `app-redis-service.json` - simple service for redis.
- `app-mysql-controller.json` - single replica for mysql.  Sets up database using environment variables. See https://coreos.com/docs/enterprise-registry/mysql-container/
- `app-mysql-service.json` - service for mysql.
- `app-web-controller.json` - must be ran as single replica as it just uses local storage.  Includes two containers: the app itself, and the "config" app. Notice the use of an `emptyDir` volume to share the config moutn point and just using a `hostDir` for storage.  Also, the environment variables `DB_*` must match those set in `app-mysql-controller.json`.


