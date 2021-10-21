CREATE DATABASE IF NOT EXISTS test_db;

CREATE TABLE test_db.test(a String, b UInt8, c FixedString(1)) ENGINE = Log;

INSERT INTO test_db.test (a,b,c) values ('user_1',1,'5');
INSERT INTO test_db.test (a,b,c) values ('user_4',4,'5');
INSERT INTO test_db.test (a,b,c) values ('user_5',5,'5');


CREATE TABLE test_db.colleagues (id UInt64,name String,url String,created DateTime) ENGINE = MergeTree() PRIMARY KEY id ORDER BY id;
INSERT INTO test_db.colleagues VALUES (1, 'margaret', 'http://1.com', '2021-01-01 00:01:01');
INSERT INTO test_db.colleagues VALUES (2, 'john', 'http://2.com', '2021-01-01 00:01:01');