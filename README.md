# 📊 TCC-GUI: Graphical User Interface for TCC package
### About TCC-GUI
This repository only aims to make TCC-GUI dockered. 
Users are responsible for checking the original repository, all the citations and code of conducts. 
https://github.com/swsoyee/TCC-GUI

### How I made a dockerfile
I changed the style of installation of required package. Originally TCC-GUI relies on renv::restore(). However, it takes long time to make docker image, I confirmed the required packages like

```bash=
grep -r "library(" $(pwd)/TCC-GUI_edited/TCC-GUI | cut -d'(' -f2 | cut -d')' -f1 | sort | uniq

plotly
DT
MASS
RColorBrewer
TCC
cluster
data.table
dplyr
heatmaply
knitr
markdown
plotly
rmarkdown
shiny
shinyBS
shinyWidgets
shinycssloaders
shinydashboard
tidyr
utils
```

I made a description file following these packages and used renv::hydrate() instead. Docker image sustains the versions of R package in itself and the strategy sounds fair to me. TCC is somehow difficult to install so I added a line separately.
This docker image was tested on my computer (MBP 2019, Intel core i7). I am considering to test this on MBP 20XX, Apple silicon.

### How to use the dockered TCC-GUI
Turn on your Docker Desktop app!

#### HARD VERSION
You can git clone and run docker build in the directory.

```bash=
git clone https://github.com/geedrn/TCC-GUI-Docker.git
cd TCC-GUI-Docker
docker build . -t IMAGE_NAME
```
#### EASY VERSION
The image itself is publicly available too (https://hub.docker.com/r/sayaka0710/tcc). If you trust me, use this version.

```bash=
docker run \
  --rm -e DISABLE_AUTH=true \
  -p 8787:8787 \
  sayaka0710/tcc
```

This automatically finds the image in your local PC. If the docker does not find it, it pulls the image from the hub for your initial run. Once you close the terminal from the red botton, it also shut offs the docker container.

#### Go to Rstudio server
Open localhost:8787 by Google Chrome or Safari. 

#### Execute TCC-GUI
Copy this magic commnand and run TCC-GUI.

```R=
shiny::runApp(appDir = "TCC-GUI")
```

If you are not familiar with this, you can also find TCC-GUI folder in the bottom right and open it. 
Then find ui.R file and double click. This process pops up the window on the up left. Find Run App botton and push it!

After finishing the analysis, Control+C wraps up everything. Confirm your docker container is shut down on app. 

#### How to finish the analysis
Close the terminal. Close the Docker hub app. If you are a mac user, you should find a Docker icon at the top of your screen. Click it and push Quit Docker Desktop. Otherwise Docker eats at least 4GB memory all the time. 
