#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: ExpressionTool

requirements:
    InlineJavascriptRequirement: {}

inputs:
    inputCollection:
        type: Directory

outputs:
    outputArray:
        type: File[]

expression: |
    ${
        return{"outputArray": inputs.inputCollection.listing} 
    }