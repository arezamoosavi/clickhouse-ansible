SELECT
    cluster,
    shard_num,
    replica_num,
    host_name
FROM system.clusters;

SELECT * FROM system.macros;

CREATE DATABASE IF NOT EXISTS db;

CREATE TABLE IF NOT EXISTS db.entries(
timestamp DateTime,
parameter String,
value Float64)
ENGINE = Distributed(cluster01, db, entries, rand())
    SETTINGS
    fsync_after_insert=0,
    fsync_directories=0;

CREATE TABLE test_db.test(a String, b UInt8, c FixedString(1)) ENGINE = Log;

INSERT INTO test_db.test (a,b,c) values ('user_1',1,'5');
INSERT INTO test_db.test (a,b,c) values ('user_4',4,'5');
INSERT INTO test_db.test (a,b,c) values ('user_5',5,'5');


CREATE TABLE test_db.colleagues (id UInt64,name String,url String,created DateTime) ENGINE = MergeTree() PRIMARY KEY id ORDER BY id;
INSERT INTO test_db.colleagues VALUES (1, 'margaret', 'http://1.com', '2021-01-01 00:01:01');
INSERT INTO test_db.colleagues VALUES (2, 'john', 'http://2.com', '2021-01-01 00:01:01');



-- distributed:
-- v1
CREATE TABLE db.test ON CLUSTER cluster01
(
    `EventDate` DateTime,
    `id` UInt64
)
ENGINE = ReplicatedMergeTree('/clickhouse/tables/{shard}/db/test', '{replica}')
PARTITION BY toYYYYMM(EventDate)
ORDER BY id;

CREATE TABLE db.test_all ON CLUSTER cluster01
(
    `EventDate` DateTime,
    `id` UInt64
)
ENGINE = Distributed(cluster01, db, test, rand());

INSERT INTO db.test Values (1546300800, 1), ('2019-01-01 00:00:00', 2);
