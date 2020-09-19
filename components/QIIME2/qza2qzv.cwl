#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
    DockerRequirement:
        dockerPull: qiime2/core:2020.8
    InlineJavascriptRequirement: {}

baseCommand: qiime
# https://commonwl.org/v1.0/CommandLineTool.html#file
arguments: ["demux", "summarize",
            "--o-visualization", "${return inputs.qza.nameroot}.qzv"] 

inputs:
    qza:
        type: File
        inputBinding:
            position: 0
            prefix: "--i-data"

outputs:
    qzv:
        type: File
        outputBinding:
            glob: "${return inputs.qza.nameroot}.qzv"

