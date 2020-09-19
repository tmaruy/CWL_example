#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

doc: Pipeline for analyzing 16S rRNA amplicon seuqencing datasets. Sequence reads were preprocessed by DADA2 to define A

inputs:
    fastq_directory:
        type: Directory
    project_name:
        type: string
    p_trunc_len_f:
        type: int
    p_trunc_len_r:
        type: int

outputs:
    fasta:
        type: File
        outputSource: get_fasta/converted
    table:
        type: File
        outputSource: biom_convert/converted
    vsa:
        type: File
        outputSource: dada2/vsa_repseq
    qzv:
        type: File
        outputSource: qza2qzv/qzv
    rdp_result:
        type: File
        outputSource: rdp_classifier/rdp_result

steps:
    fastq2qza:
        run: components/QIIME2/fastq2qza.cwl
        in:
            fastqDir: fastq_directory
            project: project_name
        out: [qza]
    qza2qzv:
        run: components/QIIME2/qza2qzv.cwl
        in:
            qza: fastq2qza/qza
        out: [qzv]
    dada2:
        run: components/QIIME2/dada2.cwl
        in:
            qza: fastq2qza/qza
            p_trunc_len_f: p_trunc_len_f
            p_trunc_len_r: p_trunc_len_f
        out: 
            [vsa_repseq, vsa_table, denoising_stats]
    get_fasta:
        run: components/qiime2/qza_convert.cwl
        in: 
            qza: dada2/vsa_repseq
        out:
            [converted]
    get_table:
        run: components/qiime2/qza_convert.cwl
        in: 
            qza: dada2/vsa_table
        out:
            [converted]
    biom_convert:
        run: components/qiime2/biom_convert.cwl
        in: 
            biom: get_table/converted
        out:
            [converted]
    rdp_classifier:
        run: components/rdp-classifier/classify.cwl
        in: 
            fasta: get_fasta/converted
        out:
            [rdp_result]

