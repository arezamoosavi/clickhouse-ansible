start-containers:
	sudo lxc-create -t download -n cent1 -- -d centos -r 8 -a amd64
	sudo lxc-create -t download -n cent2 -- -d centos -r 8 -a amd64
	sudo lxc-create -t download -n cent3 -- -d centos -r 8 -a amd64