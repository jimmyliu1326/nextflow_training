#!/usr/bin/env nextflow

// import nf-core modules
include { MEDAKA } from './modules/nf-core/medaka'
include { NANOQ } from './modules/nf-core/nanoq'
include { SISTR } from './modules/nf-core/sistr'
include { MINIASM } from './modules/nf-core/miniasm'

// define workflow
workflow {
    // define input channel
    ch_reads_path = Channel.fromPath( "https://object-arbutus.cloud.computecanada.ca/cidgohshare/hackathon/seqqc/isolate_wgs/nanopore/sra_split/ERR7565110/ERR7565110.1.fastq.gz")
    ch_meta       = Channel.from( [ id: 'ERR7565110' ] )
    ch_reads      = ch_meta.combine( ch_reads_path )

    // TO DO: Inspect what the ch_reads channel looks like


    // TO DO: Walk through the first step of the workflow together
    //NANOQ()

	// TO DO: Complete the workflow with the remaining processes in the workflow diagram
    //MINIASM()
	//MEDAKA()
	//SISTR()

}
