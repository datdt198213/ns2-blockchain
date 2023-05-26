# vanet-simulation
Operating system: Ubuntu 20.04.6 LTS

**1. NS2 installation**

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

Step 4: Replace @CC@ to be gcc-4.8 and @CXX@ to be g++-4.8 in Makefile.in
```
$ gedit ns-allinone-2.35/otcl-1.14/Makefile.in
$ gedit ns-allinone-2.35/ns-2.35/Makefile.in
$ gedit ns-allinone-2.35/nam-1.15/Makefile.in
$ gedit ns-allinone-2.35/xgraph-12.2/Makefile.in
```

Step 5: Change **erase** to **this->erase** in ns-allinone-2.35/ns-2.35/linkstate/ls.h
```
$ gedit ns-allinone-2.35/ns-2.35/linkstate/ls.h
```

Step 6: Run "install" file in ns-allione-2.35
```
$ cd /home/dangdat/ns-allinone-2.35
$ ./install
```

Step 7: Set environment variable for NS2
Edit .bashrc file
```
$ cd
$ gedit .bashrc
```

Add PATH and LD_LIBRARY_PATH into .bashrc file
```
export PATH=$PATH:/home/dangdat/ns-allinone-2.35/bin:/home/dangdat/ns-allinone-2.35/tcl8.5.10/unix:/home/dangdat/ns-allinone-2.35/tk8.5.10/unix
export LD_LIBRARY_PATH=/home/dangdat/ns-allinone-2.35/otcl-1.14:/home/dangdat/ns-allinone-2.35/lib

Note: In my case, the location of ns-allione-2.35 folder is /home/dangdat/
```

Run .bashrc file to update
```
$ source .bashrc
```

**2. Installation SUMO**

