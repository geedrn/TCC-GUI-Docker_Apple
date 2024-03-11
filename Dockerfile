FROM rocker/rstudio:4.2.1

# Maintainer
LABEL Maintainer="Ryo Niwa <ryo.niwa@cira.kyoto-u.ac.jp>"
LABEL Description="Docker image for TCC-GUI. The image is based on rocker/r-ver:4.1.2 and MENTHU docker."
LABEL Version="1.0"

RUN apt-get update && apt-get install -y \
    sudo \
    gdebi-core \
    pandoc \
    pandoc-citeproc \
    libcairo2-dev \
    libxt-dev \
    xtail \
    wget \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    git

COPY /Main /home/rstudio
WORKDIR /home/rstudio

# renv.lock
RUN R -e "install.packages('renv', repos='https://cloud.r-project.org/')" -e "renv::hydrate()"
RUN R -e "if (!requireNamespace('BiocManager', quietly = TRUE)) install.packages('BiocManager')" -e "BiocManager::install('TCC')"
