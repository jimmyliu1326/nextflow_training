// TO DO: make sure to import the remaining modules

include { NANOQ				} from './modules/nf-core/nanoq/main.nf'
include { FLYE				} from './modules/nf-core/flye/main'
include { MEDAKA			} from './modules/nf-core/medaka/main'

// TO DO: define path to fastq files
channel.fromPath("path/to/*fastq.gz")
	.map { 
		file ->
		def basename = file.getBasename()
		[id: basename], file
	}
	.set{ch_reads}

// TO DO: what values are accepted by the NANOQ process?
ch_nanoq_outfmt = Channel.value("complete_here")

workflow {

	NANOQ(ch_reads, ch_nanoq_outfmt)
	ch_nanoq_reads = NANOQ.out.reads


	FLYE(ch_nanoq_reads, val("--nano-hq"))


	// TO DO: complete the inputs to produce a channel in the form of 
	//		  tuple val(meta_map), path(reads), path(assembly)
	ch_reads.join()
		.set{ch_input_medaka}

	// TO DO: complete the workflow with the last two processes (medaka and sistr)
	MEDAKA()

	SISTR()

}
