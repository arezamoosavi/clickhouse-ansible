start-containers:
	sudo lxc-create -t download -n cent1 -- -d centos -r 8 -a amd64
	sudo lxc-create -t download -n cent2 -- -d centos -r 8 -a amd64
	sudo lxc-create -t download -n cent3 -- -d centos -r 8 -a amd64

check-servers:
	ansible all -a "df -h" -u root -i hosts
	sleep 2
	ansible all -a "free -h" -u root -i hosts