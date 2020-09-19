#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
    DockerRequirement:
        dockerPull: qiime2/core:2020.8
    InlineJavascriptRequirement: {}

baseCommand: qiime
# https://commonwl.org/v1.0/CommandLineTool.html#file
arguments: ["tools", "export",
            "--output-path", "export/"] 

inputs:
    qza:
        type: File
        inputBinding:
            position: 0
            prefix: "--input-path"

outputs:
    converted:
        type: File
        outputBinding:
            glob: "export/*"
            outputEval: |
                ${
                    self[0].basename = inputs.qza.nameroot + self[0].nameext
                    return self[0]
                }
            
