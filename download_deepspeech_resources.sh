#!/bin/sh

DEEPSPEECHVERSION=${DEEPSPEECHVERSION:-0.5.1}
WORKDIR=$PWD


(
    cd /tmp

    echo "Downloading DeepSpeech models (v$DEEPSPEECHVERSION) on /tmp..."
    curl -LOJ "https://github.com/mozilla/DeepSpeech/releases/download/v$DEEPSPEECHVERSION/deepspeech-$DEEPSPEECHVERSION-models.tar.gz" && \
        tar xzf deepspeech-$DEEPSPEECHVERSION-models.tar.gz

    echo "Downloading DeepSpeech audio samples (v$DEEPSPEECHVERSION) on /tmp..."
    curl -LOJ "https://github.com/mozilla/DeepSpeech/releases/download/v$DEEPSPEECHVERSION/audio-$DEEPSPEECHVERSION.tar.gz" && \
        tar xzf audio-$DEEPSPEECHVERSION.tar.gz

    mkdir -p $WORKDIR/audio && \
        cp audio/* $WORKDIR/audio
    echo "DeepSpeech audio samples are available on $WORKDIR/audio"
)
