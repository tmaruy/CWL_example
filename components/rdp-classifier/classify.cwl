#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
    DockerRequirement:
        dockerPull: compmetagen/rdpclassifier
    InlineJavascriptRequirement: {}

# https://commonwl.org/v1.0/CommandLineTool.html#file
arguments: ["java", "-Xmx2g", "-jar", "/opt/rdp_classifier/dist/classifier.jar",
            "classify", "-o", "${return inputs.fasta.nameroot}.rdp_classifier.txt"] 

inputs:
    fasta:
        type: File
        inputBinding:
            position: 0

outputs:
    rdp_result:
        type: File
        outputBinding:
            glob: "*.rdp_classifier.txt"
            
