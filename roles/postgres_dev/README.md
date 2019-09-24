There are optional flags that can generate tpch datasets as part of this. Just run:


```bash
ansible-playbook -t tpch-dbgen main.yaml -e "{run_tpch_datagen: true}" -e tpch_datagen_scale=1
```

Loading the data into postgres:

```bash
psql -c "create table lineitem(
   l_orderkey integer,
   l_partkey integer,
   l_suppkey integer,
   l_linenumber integer,
   l_quantity real,
   l_extendedprice real,
   l_discount real,
   l_tax real,
   l_returnflag \"char\",
   l_linestatus \"char\",
   l_shipdate date,
   l_commitdate date,
   l_receiptdate date,
   l_shipinstruct char(25),
   l_shipmode char(10),
   l_comment char(44),
   l_dummy char(1));
copy lineitem from '/home/<homedir>/lineitem.tbl' delimiter '|' csv;"
```
