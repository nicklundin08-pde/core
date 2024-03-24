#############################################
# Layer 1: build nvim from source
#############################################
FROM ubuntu:latest as nvim_builder

COPY ./scripts/nvim.sh /nvim.sh
RUN chmod +x /nvim.sh && /nvim.sh && rm /nvim.sh

#############################################
# Layer 2: Customize image 
#############################################
FROM ubuntu:latest as final

## Copy nvim from stage 1
COPY --from=nvim_builder /usr/local/bin/nvim  /usr/local/bin/nvim
COPY --from=nvim_builder /usr/local/share/nvim  /usr/local/share/nvim
RUN apt-get update && apt-get install -y gcc g++ git

## LVIM 
COPY ./scripts/lvim.sh /lvim.sh
RUN chmod +x /lvim.sh && /lvim.sh && rm /lvim.sh

## SDKMan 
SHELL ["/bin/bash", "-c"]    
COPY ./scripts/sdk.sh /sdk.sh
RUN chmod +x /sdk.sh && /sdk.sh && rm /sdk.sh

## If you need to access sdkman inside a dockerfile, do so like this
# SHELL ["/bin/bash", "-c"]
# RUN source /root/.sdkman/bin/sdkman-init.sh && sdk version

## ZSH, Docker, Compose
RUN apt install -y zsh docker docker-compose
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN echo "source /root/.sdkman/bin/sdkman-init.sh" >> /root/.zshrc