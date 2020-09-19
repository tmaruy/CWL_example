#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

#hints:
#    DockerRequirement:
#        dockerPull: tmaruy/fastqc

baseCommand: fastqc
arguments: ["-d", $(runtime.tmpdir), "-o", $(runtime.outdir)]

inputs:
    fastq:
        type: File
        inputBinding:
            position: 0

outputs:
    fastqc:
        type: File[]
        outputBinding:
            glob: "*"
