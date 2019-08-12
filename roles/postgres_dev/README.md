There are optional flags that can generate tpch datasets as part of this. Just run:


```bash
ansible-playbook -t tpch-dbgen main.yaml -e "{run_tpch_datagen: true}" -e tpch_datagen_scale=1
```
