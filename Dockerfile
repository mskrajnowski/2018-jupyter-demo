FROM jupyter/datascience-notebook:e8613d84128b

# Add Live slideshows with RISE
RUN conda install -c damianavila82 rise
