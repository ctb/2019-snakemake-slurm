# 2019-snakemake-slurm

This is @ctb's attempt to learn how to use snakemake+SLURM on farm, his
UC Davis cluster.

submit like so:

```
snakemake --cluster "sbatch -t {cluster.time} -p {cluster.partition} -N {cluster.nodes}" --cluster-config cluster_conf/farm_config.yml --jobs 2 --latency-wait=15 --use-conda
```

the only real trick on farm seems to be to provide a latency wait time
of 15s instead of 5 seconds.

HT to @bluegenes for her [tutorial](https://github.com/dib-lab/farm-notes/blob/master/snakemake-slurm.md)!
