# Chronos
### This repository contains the custom changes done to support TLS in Chronos

1. The source code has been cloned via:
```
git clone https://github.com/mesos/chronos.git
```
Following are the steps to build the deb
```
cd chronos-with-tls/deb_build
apt-get install ruby-dev build-essential
dpkg-deb --build chronos/
```
2. Install the deb
```
dpkg -i chronos.deb
```
3. Start Chronos
```
systemctl start chronos
```
