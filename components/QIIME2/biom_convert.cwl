#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
    DockerRequirement:
        dockerPull: qiime2/core:2020.8
    InlineJavascriptRequirement: {}

# https://commonwl.org/v1.0/CommandLineTool.html#file
arguments: ["biom", "convert",
            "-o", "${return inputs.biom.nameroot}.txt",
            "--to-tsv"] 

inputs:
    biom:
        type: File
        inputBinding:
            position: 0
            prefix: "-i"

outputs:
    converted:
        type: File
        outputBinding:
            glob: "*.txt"
            
