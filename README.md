# Jupyter Demo

Demo repository for showing off what jupyter is

## Running Jupyter Notebook

> Requires Docker to be installed

```sh
./jupyter.sh build     # builds a docker image
./jupyter.sh notebook  # runs jupyter notebook
```

This will start up a one-off container with Jupyter Notebook and expose it on http://localhost:8888 with your current working directory mounted in the container as `~/work`.

When it starts up you should see a link in it's output, which you'll need to use to authenticate your browser session.

## Running the slides

Open `work/slides.ipynb` in Jupyter Notebook and press <kbd>ALT</kbd>+<kbd>R</kbd> to start the presentation.
