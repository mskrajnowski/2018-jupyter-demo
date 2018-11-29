#!/bin/sh

image=jupyter-demo:latest

case $1 in
    build)
        docker build -t $image .
        ;;
    lab)
        docker run \
            --rm \
            -p 8888:8888 \
            -e JUPYTER_ENABLE_LAB=yes \
            -v "$PWD":/home/jovyan/work \
            $image start-notebook.sh \
            --NotebookApp.custom_display_url=http://localhost:8888
        ;;
    notebook)
        docker run \
            --rm \
            --hostname localhost \
            -p 8888:8888 \
            -v "$PWD":/home/jovyan/work \
            $image start-notebook.sh \
            --NotebookApp.custom_display_url=http://localhost:8888
        ;;
    slides)
        docker run \
            --rm \
            -v "$PWD":/home/jovyan/work \
            $image start.sh jupyter nbconvert work/slides.ipynb \
            --to slides \
            --reveal-prefix https://cdnjs.cloudflare.com/ajax/libs/reveal.js/3.5.0
        ;;
    *)
        echo "Usage:"
        echo "    $0 lab              Starts Jupyter Lab"
        echo "    $0 notebook         Starts Jupyter Notebook"
        echo "    $0 slides           Build the slides" 
        ;;
esac
