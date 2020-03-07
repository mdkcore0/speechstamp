# Progress

- Mar 03, 2020
    - Studying the [samples and demos provided on OpenVINO](https://docs.openvinotoolkit.org/latest/_inference_engine_samples_speech_libs_and_demos_Offline_speech_recognition_demo.html)
    - Creating a planning document ([README.md](README.md))

- Mar 04, 2020
    - Looking the [Speech Library](https://docs.openvinotoolkit.org/latest/_inference_engine_samples_speech_libs_and_demos_Speech_library.html) source code, and I liked the idea of the [Offline Speech Recognition Demo](https://docs.openvinotoolkit.org/latest/_inference_engine_samples_speech_libs_and_demos_Offline_speech_recognition_demo.html), thinking on use the *lspeech_s5_ext* model in the future, but while I'm familiar with c++, the time constraint of the project showcase will not let me dig deeper on it right now, so I've decided to find some python code around the subject
    - Found [a repository containing speech recognition with openvino + python](https://github.com/meshaun9/openvino_speech_recognition), trying to understand the code

    This is challenging for me, as I never had worked on this level of speech recognition (google cloud text-to-speech API hides all the machine learning steps from you :p)

- Mar 06, 2020
    - Learning about [TensorFlow speech recognition](https://github.com/tensorflow/docs/blob/master/site/en/r1/tutorials/sequences/audio_recognition.md) and how to train data. This is crucial to be able to generate a model that fits on my showcase project needs, so I can convert it and use in OpenVINO.

    - Found about [Pannous' speech recognition repository](https://github.com/pannous/tensorflow-speech-recognition), an effort on creating a good speech recognition using TensorFlow on Linux.

    Realized I will not complete any code until the deadline :/

    It could be easier for me if I had chosen something related to image processing or computer vision (one idea I had was to integrate openvino on a small robot I'm assembling, so I could detect my cats and/or my son around the house), but decided to try out something different to maximize what I've learned on the course ¯\\_(ツ)_/¯

- Mar 07, 2020
    - Continuing the study about spech recognition and just found [Mozilla's DeepSpeech](https://github.com/mozilla/DeepSpeech) very interesting! After looking on the [examples](https://github.com/mozilla/DeepSpeech-examples), decided to try to convert it's model (it's a TensorFlow implementation) to IR, and found a page on [OpenVINO documentation about it](https://docs.openvinotoolkit.org/latest/_docs_MO_DG_prepare_model_convert_model_tf_specific_Convert_DeepSpeech_From_Tensorflow.html).

    - Successful converted the DeepSpeech model to IR using the Model Optimizer. Although the documentation mentions DeepSpeech v0.3.0, managed to convert [v0.5.1](https://github.com/mozilla/DeepSpeech/releases/tag/v0.5.1) (tried the [latest version, v0.6.1](https://github.com/mozilla/DeepSpeech/releases/tag/v0.6.1), with no luck) with just some adjustments:

            python3 /opt/intel/openvino/deployment_tools/model_optimizer/mo_tf.py \
                --input_model deepspeech-0.5.1-models/output_graph.pb \
                --freeze_placeholder_with_value "input_lengths->[16]" \
                --input input_node,previous_state_h/read,previous_state_c/read \
                --input_shape [1,16,19,26],[1,2048],[1,2048] \
                --output raw_logits,lstm_fused_cell/GatherNd,lstm_fused_cell/GatherNd_1 \
                --disable_nhwc_to_nch

        Result:

            Model Optimizer arguments:
            Common parameters:
                    - Path to the Input Model:      /opt/src/deepspeech-0.5.1-models/output_graph.pb
                    - Path for generated IR:        /opt/src/.
                    - IR output name:       output_graph
                    - Log level:    ERROR
                    - Batch:        Not specified, inherited from the model
                    - Input layers:         input_node,previous_state_h/read,previous_state_c/read
                    - Output layers:        raw_logits,lstm_fused_cell/GatherNd,lstm_fused_cell/GatherNd_1
                    - Input shapes:         [1,16,19,26],[1,2048],[1,2048]
                    - Mean values:  Not specified
                    - Scale values:         Not specified
                    - Scale factor:         Not specified
                    - Precision of IR:      FP32
                    - Enable fusing:        True
                    - Enable grouped convolutions fusing:   True
                    - Move mean values to preprocess section:       False
                    - Reverse input channels:       False
            TensorFlow specific parameters:
                    - Input model in text protobuf format:  False
                    - Path to model dump for TensorBoard:   None
                    - List of shared libraries with TensorFlow custom layers implementation:        None
                    - Update the configuration file with input/output node names:   None
                    - Use configuration file used to generate the model with Object Detection API:  None
                    - Operations to offload:        None
                    - Patterns to offload:  None
                    - Use the config file:  None
            Model Optimizer version:        2020.1.0-61-gd349c3ba4a

            [ SUCCESS ] Generated IR version 10 model.
            [ SUCCESS ] XML file: /opt/src/./output_graph.xml
            [ SUCCESS ] BIN file: /opt/src/./output_graph.bin
            [ SUCCESS ] Total execution time: 5.50 seconds.
            [ SUCCESS ] Memory consumed: 1130 MB.

        **NOTE**: the above command was run on my [OpenVINO container](https://github.com/mdkcore0/dockerfiles/tree/master/openvino), after installing the [requirements](./requirements.txt). This step will be detailed later, and a proper docker container will be created as well.

    - Next step is to integrate this Intermediate Representation on an application and develop the project showcase :)
