start-containers:
	sudo lxc-create -t download -n cent1 -- -d centos -r 8 -a amd64
	sudo lxc-create -t download -n cent2 -- -d centos -r 8 -a amd64
	sudo lxc-create -t download -n cent3 -- -d centos -r 8 -a amd64

check-servers:
	ansible all -a "df -h" -u root -i hosts
	sleep 2
	ansible all -a "free -h" -u root -i hosts

pre-install:
	ansible-playbook prepare_ansible_hosts.yml -i hosts

logs-click:
	tail -fn 100 /var/log/clickhouse-server/clickhouse-server.log
	tail -fn 100 /var/log/clickhouse-server/clickhouse-server.err.log
	