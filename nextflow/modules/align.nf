process ALIGN {
    conda "/opt/anaconda3/envs/mafft"
    publishDir "${params.outdir}/Aligned"
    
    input:
    path (fastas)
    path isolates_fasta_files

    output:
    path "aligned.fas"

    script:
    """
    mkdir -p reordered_fastas
    python $projectDir/bin/concatenate.py reordered_fastas $fastas $isolates_fasta_files
    mafft --auto reordered_fastas/concatenated_sequences.fasta > aligned.fas
    """
}