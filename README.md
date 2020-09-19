# Example CWL code
* 本パイプラインはCommon workflow language (CWL) の習得に向けて作成しました。
* 例題として16S rRNA 遺伝子のアンプリコンシーケンス解析のパイプラインを作成しました。

## 概要
* Pipeline
    * microbiome_16S.cwl
    * components/
    * microbiome_16S.yml
* Input file
    * Paired-end FASTQファイル (dat_light/)
* Output file
    * OTU行列 (test.table.txt)
    * OTU代表配列 (test.vsa.fasta)
    * OTU代表配列 生物種アノテーション結果 (test.vsa.rdp_classifier.txt)

## 動かし方
``` bash
git clone https://github.com/tmaruy/CWL_example.git
cd CWL_example
cwltool microbiome_16S.cwl microbiome_16S.yml
```