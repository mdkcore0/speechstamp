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
