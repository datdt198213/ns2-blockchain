# vanet-simulation
**1. NS2 installation **

Step 1: Install ns2 from web browser and decompress
```
Link: 
$ tar zxvf ns-allinone-2.35.tar.gz
```

Step 2: Install requirement of NS2
```
$ sudo apt update
$ sudo apt upgrade
$ sudo apt install build-essential autoconf automake libxmu-dev
```

Step3: Install gcc-4.8 and g++-4.8
Edit file /etc/apt/sources.list


```
$ sudo nano /etc/apt/sources.list
```

Add below content to file /etc/apt/source.list
```
deb http://in.archive.ubuntu.com/ubuntu/ bionic main universe
```

Update system and download gcc
```
$ sudo apt update
$ sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32
$ sudo apt update
$ sudo apt install gcc-4.8 g++-4.8
```

Step 4: 



**2. Installation SUMO**

