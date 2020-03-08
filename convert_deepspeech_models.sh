#!/bin/sh

DEEPSPEECHVERSION=${DEEPSPEECHVERSION:-0.5.1}
WORKDIR=$PWD


(
    cd /tmp

    echo "Converting DeepSpeech models (v$DEEPSPEECHVERSION) to Intermediate Representation..."
    python3 /opt/intel/openvino/deployment_tools/model_optimizer/mo_tf.py \
        --input_model deepspeech-$DEEPSPEECHVERSION-models/output_graph.pb \
        --freeze_placeholder_with_value "input_lengths->[16]" \
        --input input_node,previous_state_h/read,previous_state_c/read \
        --input_shape [1,16,19,26],[1,2048],[1,2048] \
        --output raw_logits,lstm_fused_cell/GatherNd,lstm_fused_cell/GatherNd_1 \
        --disable_nhwc_to_nch || \
            { echo "Error while converting model to IR"; exit 1; }

    mkdir -p $WORKDIR/model && \
        cp output_graph.* $WORKDIR/model
    echo "IR of DeepSpeech models are available on $WORKDIR/model"
)
