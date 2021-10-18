# clickhouse-deployment
Ansible playbook for clickhouse cluster deployment

An example of inventory could be:

```INI
[clickhouse]
<URL-ch01-shard01-replica01> ansible_host=<ip>
<URL-ch01-shard01-replica02> ansible_host=<ip>
...
<URL-ch01-shard02-replica01> ansible_host=<ip>
<URL-ch01-shard02-replica02> ansible_host=<ip>
...
<URL-chX-shardY-replicaZ> ansible_host=<ip>

[zookeeper]
<URL-zookeeper01> ansible_host=<ip>
...
<URL-zookeeperN> ansible_host=<ip>

```
where URL (inventory_hostname) can be the IP or the DNS that will be resolved in runtime.

Notice that in order to build the cluster, `clickhouse` group and `zookeeper` group are mandatory