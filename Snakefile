GENOMES, = glob_wildcards('data/{genomes}.fna.gz')

rule all:
     input:
        "cmp.mat.matrix.png"

rule compare:
     input:
        expand("data/{genomes}.fna.gz.sig", genomes=GENOMES)
     output:
        "cmp.mat.matrix.png"
     conda:
        "env-sourmash.yml"
     shell:
        """sourmash compare {input} -o cmp.mat && \
           sourmash plot cmp.mat"""

rule compute_sig:
     input:
        "{filename}"
     output:
        "{filename}.sig"
     conda:
        "env-sourmash.yml"
     shell: 
        "sourmash compute -k 31 --scaled 1000 {input} -o {output} --name-from-first"
