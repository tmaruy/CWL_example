#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
    DockerRequirement:
        dockerPull: qiime2/core:2020.8
    InlineJavascriptRequirement: {}

baseCommand: qiime
arguments: ["dada2", "denoise-paired",
            "--o-table", "${return inputs.qza.nameroot}.table.qza",
            "--o-representative-sequences", "${return inputs.qza.nameroot}.vsa.qza",
            "--o-denoising-stats", "${return inputs.qza.nameroot}.denoising_stats.qza"]

inputs:
    qza:
        type: File
        inputBinding:
            position: 0
            prefix: "--i-demultiplexed-seqs"
    p_trim_left_f:
        type: int
        label: trim first XXX bases from forward reads
        inputBinding:
            position: 1
            prefix: "--p-trim-left-f"
        default: 0
    p_trim_left_r:
        type: int
        label: trim first XXX bases from reverse reads
        inputBinding:
            position: 2
            prefix: "--p-trim-left-r"
        default: 0
    p_trunc_len_f:
        type: int
        label: truncate 3' end and set length of the forward reads into XXX bp
        inputBinding:
            position: 3
            prefix: "--p-trunc-len-f"
        default: 250
    p_trunc_len_r:
        type: int
        label: truncate 3' end and set length of the reverse reads into XXX bp
        inputBinding:
            position: 4
            prefix: "--p-trunc-len-r"
        default: 250
    p_max_ee_f:
        type: int
        label: remove forward reads if including >XX expected errors
        inputBinding:
            position: 5
            prefix: "--p-max-ee-f"
        default: 2
    p_max_ee_r:
        type: int
        label: remove reverse reads if including >XX expected errors
        inputBinding:
            position: 6
            prefix: "--p-max-ee-r"
        default: 2
outputs:
    vsa_repseq:
        type: File
        outputBinding:
            glob: "${return inputs.qza.nameroot}.vsa.qza"
    vsa_table:
        type: File
        outputBinding:
            glob: "${return inputs.qza.nameroot}.table.qza"
    denoising_stats:
        type: File
        outputBinding:
            glob: "${return inputs.qza.nameroot}.denoising_stats.qza"

