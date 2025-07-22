process MINIASM {
    tag "$meta.id"
    label 'process_high'

    conda "${moduleDir}/environment.yml"
    container "${ workflow.containerEngine == 'singularity' && !task.ext.singularity_pull_docker_container ?
        'docker://community.wave.seqera.io/library/miniasm_minimap2:c6c8a5d8c81a6ce6' :
        'community.wave.seqera.io/library/miniasm_minimap2:c6c8a5d8c81a6ce6' }"

    input:
    tuple val(meta), path(reads)

    output:
    tuple val(meta), path("*.gfa.gz")  , emit: gfa
    tuple val(meta), path("*.fasta")   , emit: assembly
    path "versions.yml"                , emit: versions

    when:
    task.ext.when == null || task.ext.when

    script:
    def args = task.ext.args ?: ''
    def prefix = task.ext.prefix ?: "${meta.id}"
    """
    minimap2 -x ava-ont -t2 $reads $reads > reads.paf
    miniasm \\
        $args \\
        -f $reads \\
        reads.paf > \\
        ${prefix}.gfa

    awk '/^S/{print ">"\$2"\\n"\$3}' "${prefix}.gfa" | fold > ${prefix}.fasta

    gzip -n ${prefix}.gfa

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        miniasm: \$( miniasm -V 2>&1 )
    END_VERSIONS
    """

    stub:
    def prefix = task.ext.prefix ?: "${meta.id}"
    """
    echo "" | gzip > ${prefix}.gfa.gz
    echo "" | gzip > ${prefix}.fasta.gz

    cat <<-END_VERSIONS > versions.yml
    "${task.process}":
        miniasm: \$( miniasm -V 2>&1 )
    END_VERSIONS
    """

}
