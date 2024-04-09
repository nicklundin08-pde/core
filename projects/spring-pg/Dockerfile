ARG BASE_IMAGE_TAG

FROM $BASE_IMAGE_TAG

SHELL ["/bin/bash", "-c"]    

# # https://stackoverflow.com/questions/53656537/install-sdkman-in-docker-image
RUN source "/root/.sdkman/bin/sdkman-init.sh"   \
                && sdk install java 19.0.2-tem  \
                # && sdk install sbt 1.8.2        \
                # && sdk install scala 3.3.0      \
                && ./coursier || true

RUN echo '# >>> coursier install directory >>>' >> /root/.profile
RUN echo 'export PATH="$PATH:/root/.local/share/coursier/bin"' >> /root/.profile
RUN echo '# <<< coursier install directory <<<' >> /root/.profile 

RUN curl -fL "https://github.com/coursier/launchers/raw/master/cs-x86_64-pc-linux.gz" | gzip -d > cs && chmod +x cs &&  eval "$(cs setup --env)" 