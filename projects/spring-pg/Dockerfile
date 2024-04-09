ARG BASE_IMAGE_TAG

FROM $BASE_IMAGE_TAG

SHELL ["/bin/bash", "-c"]    

RUN curl -fLo coursier https://github.com/coursier/launchers/raw/master/coursier && chmod +x coursier 

RUN source "/root/.sdkman/bin/sdkman-init.sh"   \
                && sdk install java 19.0.2-tem  \
                # && sdk install sbt 1.8.2        \
                # && sdk install scala 3.3.0      \
                && ./coursier || true
