#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

hints:
    DockerRequirement:
        dockerPull: qiime2/core:2020.8

baseCommand: qiime
arguments: ["tools", "import", 
            "--type", "SampleData[PairedEndSequencesWithQuality]", 
            "--input-format", "CasavaOneEightSingleLanePerSampleDirFmt", 
            "--output-path", "$(inputs.project).qza"]

inputs:
    fastqDir:
        type: Directory
        inputBinding:
            position: 0
            prefix: "--input-path"
    project:
        type: string

outputs:
    qza:
        type: File
        outputBinding:
            glob: "*.qza"
