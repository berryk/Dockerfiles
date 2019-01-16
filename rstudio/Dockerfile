FROM rocker/rstudio

RUN apt-get update && apt-get install -y \
    ssh \
    libxml2-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN adduser rstudio sudo 
RUN adduser rstudio users 

RUN echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile
RUN Rscript -e "install.packages('kableExtra')"
RUN Rscript -e "install.packages('caTools')"
RUN Rscript -e "install.packages('rprojroot')"
RUN Rscript -e "install.packages('quantmod')"
