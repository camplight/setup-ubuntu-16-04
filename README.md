# setup ubuntu 16.04

## prerequirements

* a VPS instance with ssh root access
* **optionally** organic-angel installed globally, otherwise instead of `angel` use `node ./node_modules/.bin/angel` commands bellow

## setup

```
$ cd ./setup-ubuntu-16.04
$ npm install
```

## commands

```
$ cd ./setup-ubuntu-16.04
```

### setup vps

```
$ angel vps 0.0.0.0 setup
```

### setup mongodb

```
$ angel vps 0.0.0.0 setup mongodb
```

### setup pm2

```
$ angel vps 0.0.0.0 setup pm2
```
