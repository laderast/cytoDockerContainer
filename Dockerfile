# get the base image, the rocker/verse has R, RStudio and pandoc
FROM  bioconductor/release_core2

# required
MAINTAINER Your Name <laderast@ohsu.edu>

COPY . /<REPO>
COPY pkgs/openCyto_1.9.4.tar.gz tmp/

# go into the repo directory
RUN . /etc/environment

  # Install linux depedendencies here
  # e.g. need this for ggforce::geom_sina
  RUN sudo apt-get update
  RUN sudo apt-get install libudunits2-dev -y
  RUN sudo apt-get install libhdf5-serial-dev -y

  RUN Rscript -e "install.packages(c('R.utils', 'clue', 'ks'))"
  RUN Rscript -e "BiocInstaller::biocLite(pkgs=c('flowCore', 'ncdfFlow', 'flowWorkspace', \
  'flowClust', 'flowStats', 'flowDensity', 'gtools'))"
  RUN Rscript -e "install.packages('tmp/openCyto_1.9.4.tar.gz', repos=NULL)"
  RUN Rscript -e "devtools::install_github('laderast/flowDashboard/')"

  # build this compendium package
  #&& R -e "devtools::install('/<REPO>', dep=TRUE)" \

 # render the manuscript into a docx
  #&& R -e "rmarkdown::render('/<REPO>/analysis/paper/paper.Rmd')"
