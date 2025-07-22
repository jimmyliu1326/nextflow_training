#!/usr/bin/env nextflow

// import nf-core modules
include { MEDAKA } from './modules/nf-core/medaka'
include { NANOQ } from './modules/nf-core/nanoq'
include { SISTR } from './modules/nf-core/sistr'
include { MINIASM } from './modules/nf-core/miniasm'

// define workflow
workflow {
    // define input channel
    ch_reads = Channel
        .fromPath( "https://object-arbutus.cloud.computecanada.ca/cidgohshare/hackathon/seqqc/isolate_wgs/nanopore/sra_split/ERR7565110/ERR7565110.1.fastq.gz")
        .map { [ [ id: 'ERR7565110' ], it ] }

    // workflow start

}