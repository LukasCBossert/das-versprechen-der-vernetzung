# Visualization of networks – analyzing and visualizing connections between (planned) NFDI consortia


```R
#install.packages("igraph")
library("igraph")
```

## The Dataset for Edges
Get the data: [nfdi-collaborations.csv](https://gist.github.com/LukasCBossert/9bd04115db3aa9ed974fdc69d3ff227c)                    


```R
# https://gist.github.com/LukasCBossert/9bd04115db3aa9ed974fdc69d3ff227c
NFDI_edges <- read.table(header=TRUE,
                         sep=",",
                         text="
from,to
DataPLANT,NFDI4BioDiversity
DataPLANT,NFDI4Chem
GHGA,NFDI4Health
KonsortSWD,BERD@NFDI
KonsortSWD,NFDI4BioDiversity
KonsortSWD,NFDI4Earth
KonsortSWD,NFDI4Health
KonsortSWD,Text+
NFDI4BioDiversity,NFDI4Earth
NFDI4BioDiversity,NFDI4Chem
NFDI4BioDiversity,NFDI4Health
NFDI4BioDiversity,KonsortSWD
NFDI4BioDiversity,DataPLANT
NFDI4Cat,FAIRmat
NFDI4Cat,NFDI4Chem
NFDI4Cat,NFDI4Ing
NFDI4Cat,DAPHNE4NFDI
NFDI4Chem,FAIRmat
NFDI4Chem,NFDI4Ing
NFDI4Chem,NFDI4Cat
NFDI4Chem,DAPHNE4NFDI
NFDI4Chem,PUNCH4NFDI
NFDI4Chem,NFDI4Health
NFDI4Chem,NFDI4BioDiversity
NFDI4Culture,Text+
NFDI4Culture,MaRDI
NFDI4Culture,NFDI4Ing
NFDI4Health,GHGA
NFDI4Health,KonsortSWD
NFDI4Health,NFDI4Chem
NFDI4Health,NFDI4Earth
NFDI4Health,NFDI4BioDiversity
NFDI4Ing,NFDI-MatWerk
NFDI4Ing,FAIRmat
NFDI4Ing,NFDI4Chem
NFDI4Ing,NFDI4Earth
NFDI4Ing,MaRDI
NFDI4Ing,Text+
NFDI4Ing,NFDI4Culture
BERD@NFDI,KonsortSWD
BERD@NFDI,MaRDI
BERD@NFDI,Text+
DAPHNE4NFDI,FAIRmat
DAPHNE4NFDI,NFDI-MatWerk
DAPHNE4NFDI,NFDI4Cat
DAPHNE4NFDI,NFDI4Chem
DAPHNE4NFDI,NFDI4Health
DAPHNE4NFDI,NFDI4Ing
DAPHNE4NFDI,PUNCH4NFDI
FAIRmat,DAPHNE4NFDI
FAIRmat,DataPLANT
FAIRmat,MaRDI
FAIRmat,NFDI-MatWerk
FAIRmat,NFDI4Cat
FAIRmat,NFDI4Chem
FAIRmat,NFDI4DataScience
FAIRmat,NFDI4Ing
FAIRmat,PUNCH4NFDI
MaRDI,BERD@NFDI
MaRDI,FAIRmat
MaRDI,NFDI-MatWerk
MaRDI,NFDI4Cat
MaRDI,NFDI4Chem
MaRDI,NFDI4Ing
MaRDI,PUNCH4NFDI
NFDI-MatWerk,DAPHNE4NFDI
NFDI-MatWerk,DataPLANT
NFDI-MatWerk,FAIRmat
NFDI-MatWerk,MaRDI
NFDI-MatWerk,NFDI4Chem
NFDI-MatWerk,NFDI4DataScience
NFDI-MatWerk,NFDI4Ing
NFDI4DataScience,KonsortSWD
NFDI4DataScience,MaRDI
NFDI4DataScience,NFDI-MatWerk
NFDI4DataScience,NFDI4BioDiversity
NFDI4DataScience,NFDI4Cat
NFDI4DataScience,NFDI4Chem
NFDI4DataScience,NFDI4Culture
NFDI4DataScience,NFDI4Health
NFDI4DataScience,NFDI4Ing
NFDI4DataScience,NFDI4Microbiota
NFDI4Earth,DataPLANT
NFDI4Earth,GHGA
NFDI4Earth,KonsortSWD
NFDI4Earth,NFDI4BioDiversity
NFDI4Earth,NFDI4Cat
NFDI4Earth,NFDI4Chem
NFDI4Earth,NFDI4Culture
NFDI4Earth,NFDI4Health
NFDI4Earth,NFDI4Ing
NFDI4Microbiota,DataPLANT
NFDI4Microbiota,GHGA
NFDI4Microbiota,NFDI4BioDiversity
NFDI4Microbiota,NFDI4Chem
NFDI4Microbiota,NFDI4DataScience
NFDI4Microbiota,NFDI4Health
NFDI4Microbiota,NFDI4Ing
PUNCH4NFDI,DAPHNE4NFDI
PUNCH4NFDI,FAIRmat
PUNCH4NFDI,GHGA
PUNCH4NFDI,MaRDI
PUNCH4NFDI,NFDI4Earth
PUNCH4NFDI,NFDI4Ing
Text+,KonsortSWD
Text+,NFDI4BioDiversity
Text+,NFDI4Culture
Text+,NFDI4Earth
Text+,NFDI4Ing
")
```


```R
head(NFDI_edges)
```


```R
NFDI_network <- graph_from_data_frame(NFDI_edges,
                                      directed = FALSE
                                     )
```


```R
head(NFDI_network)
```

## First plot


```R
plot(NFDI_network) # loading data frame
```


    
![png](the-promise-to-partner-workshop_files/the-promise-to-partner-workshop_8_0.png)
    



```R
set.seed(9876543)

plot(NFDI_network,                    # loading data frame
     main  = "NFDI Network",          # adding a title
     frame = TRUE                     # making a frame 
     )

```


    
![png](the-promise-to-partner-workshop_files/the-promise-to-partner-workshop_9_0.png)
    


## Layout settings


```R
set.seed(9876543)

plot(NFDI_network,                     # loading data frame
     main  = "NFDI Network",           # adding a title
     frame  = TRUE,                    # making a frame
     layout = layout.graphopt,         #* better layout options
     )
```


    
![png](the-promise-to-partner-workshop_files/the-promise-to-partner-workshop_11_0.png)
    


### Layout algorithm

The network is now already better structured and the distances between the nodes are more harmonious.

If you like, you can try out [further layout settings](https://igraph.org/python/doc/tutorial/tutorial.html#layout-algorithms):

* `layout_circle` (`circle,circular`): Deterministic layout that places the vertices on a circle
* `layout_drl` (`drl`): The Distributed Recursive Layout algorithm for large graphs
* `layout_fruchterman_reingold` (`fr`): Fruchterman-Reingold force-directed algorithm
* `layout_fruchterman_reingold_3d` (`fr3d, fr_3d`): Fruchterman-Reingold force-directed algorithm in three dimensions
* `layout_grid_fruchterman_reingold` (`grid_fr`): Fruchterman-Reingold force-directed algorithm with grid heuristics for large graphs
* `layout_kamada_kawai` (`kk`): Kamada-Kawai force-directed algorithm
* `layout_kamada_kawai_3d` (`kk3d, kk_3d`): Kamada-Kawai force-directed algorithm in three dimensions
* `layout_lgl` (`large, lgl, large_graph`): The Large Graph Layout algorithm for large graphs
* `layout_random` (`random`): Places the vertices completely randomly
* `layout_random_3d` (`random_3d`): Places the vertices completely randomly in 3D
* `layout_reingold_tilford` (`rt, tree`): Reingold-Tilford tree layout, useful for (almost) tree-like graphs
* `layout_reingold_tilford_circular` (`rt_circular, tree`): Reingold-Tilford tree layout with a polar coordinate post-transformation, useful for (almost) tree-like graphs
* `layout_sphere` (`sphere,spherical,circular_3d`): Deterministic layout that places the vertices evenly on the surface of a sphere

### Color, Size, Curvature (Nodes and Edges)


```R
set.seed(9876543)


plot(NFDI_network,                     # loading data frame
     main   = "NFDI Network",          # adding a title
     frame  = TRUE,                    # making a frame 
     layout = layout.graphopt,         # better layout options
     vertex.color       = "#ffcc66",   #* color of nodes
     vertex.frame.color = "#ffcc66",   #* color of the frame of nodes
     vertex.label.cex   = 0.5,         #* size of the description of the labels
     vertex.label.color = "black",     #* color of the description 
     edge.color         = "#808080",   #* color of edges
     edge.curved        = 0.1,         #* factor of "curvity"
     )
```


    
![png](the-promise-to-partner-workshop_files/the-promise-to-partner-workshop_14_0.png)
    


## Node size as a function of the number of edges


```R
degree(NFDI_network) #* calculate number of edges              
```


<style>
.dl-inline {width: auto; margin:0; padding: 0}
.dl-inline>dt, .dl-inline>dd {float: none; width: auto; display: inline-block}
.dl-inline>dt::after {content: ":\0020"; padding-right: .5ex}
.dl-inline>dt:not(:first-of-type) {padding-left: .5ex}
</style><dl class=dl-inline><dt>DataPLANT</dt><dd>7</dd><dt>GHGA</dt><dd>5</dd><dt>KonsortSWD</dt><dd>11</dd><dt>NFDI4BioDiversity</dt><dd>13</dd><dt>NFDI4Cat</dt><dd>10</dd><dt>NFDI4Chem</dt><dd>19</dd><dt>NFDI4Culture</dt><dd>7</dd><dt>NFDI4Health</dt><dd>13</dd><dt>NFDI4Ing</dt><dd>19</dd><dt>BERD@NFDI</dt><dd>5</dd><dt>DAPHNE4NFDI</dt><dd>12</dd><dt>FAIRmat</dt><dd>16</dd><dt>MaRDI</dt><dd>14</dd><dt>NFDI-MatWerk</dt><dd>12</dd><dt>NFDI4DataScience</dt><dd>13</dd><dt>NFDI4Earth</dt><dd>15</dd><dt>NFDI4Microbiota</dt><dd>8</dd><dt>PUNCH4NFDI</dt><dd>10</dd><dt>Text+</dt><dd>9</dd></dl>



## Modify the network design


```R
set.seed(9876543)

plot(NFDI_network,                     # loading data frame
     main   = "NFDI-Netzwerk",         # adding a title
     frame  = TRUE,                    # making a frame 
     layout = layout.graphopt,         # better layout options
     vertex.color       = "#ffcc66",   # color of nodes
     vertex.frame.color = "#ffcc66",   # color of the frame of nodes
     vertex.label.cex   = 0.5,         # size of the description of the labels
     vertex.label.color = "black",     # color of the description 
                                       # color: https://www.w3schools.com/colors/colors_picker.asp 
     edge.color         = "#808080",   # color of edges
     edge.curved        = 0.1,         # factor of "curvity"
     vertex.size        = degree(NFDI_network), #* size of nodes depends on amount of edges
     )
```


    
![png](the-promise-to-partner-workshop_files/the-promise-to-partner-workshop_18_0.png)
    


## Show incoming and outgoing edges with directed graphs


```R
NFDI_network_directed <- graph_from_data_frame(NFDI_edges,
                                               directed = TRUE
                                              )
```


```R
set.seed(9876543)

plot(NFDI_network_directed,            #<<<<<<< loading data frame
     main   = "NFDI-Netzwerk",         # adding a title
     frame  = TRUE,                    # making a frame 
     layout = layout.graphopt,         # better layout options
     vertex.color       = "#ffcc66",   # color of nodes
     vertex.frame.color = "#ffcc66",   # color of the frame of nodes
     vertex.label.cex   = 0.5,         # size of the description of the labels
     vertex.label.color = "black",     # color of the description 
                                       # color: https://www.w3schools.com/colors/colors_picker.asp 
     edge.color         = "#808080",   # color of edges
     edge.curved        = 0,           #<<<<<<<<< factor of "curvity"
     vertex.size        = degree(NFDI_network_directed), #<<<<<< size of nodes depends on amount of edges
     edge.arrow.size    = .5,          #* arrow size,  defaults to 1
    )

```


    
![png](the-promise-to-partner-workshop_files/the-promise-to-partner-workshop_21_0.png)
    


## The Dataset for Nodes
Get the data: [nfdi-consortia.csv](https://gist.github.com/LukasCBossert/ce56ebd0059b4879c7d11c1090118c25)                    



```R
# https://gist.github.com/LukasCBossert/ce56ebd0059b4879c7d11c1090118c25
NFDI_nodes <- read.table(header=TRUE,
                         sep=",",
                         text="
name,group,round
DataPLANT,2,1
GHGA,1,1
KonsortSWD,3,1
NFDI4BioDiversity,2,1
NFDI4Cat,5,1
NFDI4Chem,5,1
NFDI4Culture,3,1
NFDI4Health,1,1
NFDI4Ing,4,1
BERD@NFDI,3,2
DAPHNE4NFDI,5,2
FAIRmat,5,2
MaRDI,4,2
NFDI-MatWerk,4,2
NFDI4DataScience,4,2
NFDI4Earth,2,2
NFDI4Microbiota,2,2
PUNCH4NFDI,5,2
Text+,3,2
")
```


```R
head(NFDI_nodes) # check if data is loaded correctly
```


<table class="dataframe">
<caption>A data.frame: 6 × 3</caption>
<thead>
	<tr><th></th><th scope=col>name</th><th scope=col>group</th><th scope=col>round</th></tr>
	<tr><th></th><th scope=col>&lt;fct&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>
</thead>
<tbody>
	<tr><th scope=row>1</th><td>DataPLANT        </td><td>2</td><td>1</td></tr>
	<tr><th scope=row>2</th><td>GHGA             </td><td>1</td><td>1</td></tr>
	<tr><th scope=row>3</th><td>KonsortSWD       </td><td>3</td><td>1</td></tr>
	<tr><th scope=row>4</th><td>NFDI4BioDiversity</td><td>2</td><td>1</td></tr>
	<tr><th scope=row>5</th><td>NFDI4Cat         </td><td>5</td><td>1</td></tr>
	<tr><th scope=row>6</th><td>NFDI4Chem        </td><td>5</td><td>1</td></tr>
</tbody>
</table>




```R
NFDI_network_directed <- graph_from_data_frame(d = NFDI_edges,        # d = data frame =~ edges
                                               vertices = NFDI_nodes, #nodes
                                               directed = TRUE)       #directed
```

## Color nodes according to funding year


```R
NFDI_color_year <- c("lightgreen", # 2019 (1)
                     "lightblue"  # 2020 (2)
                    )
NFDI_color_groups <- NFDI_color_year[
    as.numeric(as.factor(
        V(NFDI_network_directed)$round))] # <<<< based on the round
```


```R
set.seed(9876543)

plot(NFDI_network_directed,            # loading data frame
     main   = "NFDI-Network (<Funding year>)",  #<<<<<<<< adding a title
     frame  = TRUE,                    # making a frame 
     layout = layout.graphopt,         # better layout options
     vertex.color       = NFDI_color_groups,   #<<<<<<<<<< color of nodes
     vertex.frame.color = NFDI_color_groups,   #<<<<<<<<<< color of the frame of nodes
     vertex.label.cex   = 0.5,         # size of the description of the labels
     vertex.label.color = "black",     # color of the description 
                                       # color: https://www.w3schools.com/colors/colors_picker.asp 
     edge.color         = "#808080",   # color of edges
     edge.curved        = 0,           # factor of "curvity"
     vertex.size        = degree(NFDI_network_directed,
                                 mode = "total"), #<<<<<<<<<<< size of nodes depends on amount of edges
     edge.arrow.size    = .5,          # arrow size,  defaults to 1
    )
```


    
![png](the-promise-to-partner-workshop_files/the-promise-to-partner-workshop_28_0.png)
    


## Color nodes according to discipline


```R
NFDI_color_code <- c("#f5ac9f", # Medicine
                     "#e43516", # Life Sciences
                     "#f9b900", # Humanities
                     "#007aaf", # Engineering Sciences
                     "#6ca11d"  # Chemistry/Physics
                    )
NFDI_color_groups <- NFDI_color_code[
    as.numeric(as.factor(
        V(NFDI_network_directed)$group))]
```


```R
set.seed(9876543)

plot(NFDI_network_directed,            # loading data frame
     main   = "NFDI-Network (<NFDI conference systematics>)",  #<<<<<<<< adding a title
     frame  = TRUE,                    # making a frame 
     layout = layout.graphopt,         # better layout options
     vertex.color       = NFDI_color_groups,   #<<<<<<<<<< color of nodes
     vertex.frame.color = NFDI_color_groups,   #<<<<<<<<<< color of the frame of nodes
     vertex.label.cex   = 0.5,         # size of the description of the labels
     vertex.label.color = "black",     # color of the description 
                                       # color: https://www.w3schools.com/colors/colors_picker.asp 
     edge.color         = "#808080",   # color of edges
     edge.curved        = 0,           # factor of "curvity"
     vertex.size        = degree(NFDI_network_directed,
                                 mode = "total"), #<<<<<<<<<<< size of nodes depends on amount of edges
     edge.arrow.size    = .5,          # arrow size,  defaults to 1
    )
```


    
![png](the-promise-to-partner-workshop_files/the-promise-to-partner-workshop_31_0.png)
    


## Legend


```R
nfdi_plot_legend <- function(){
    
    legend("topleft",   # x-position
       title  = "NFDI conference systematics", # title
       legend = c(
           "(1) Medicine",
           "(2) Life Sciences",
           "(3) Humanities",
           "(4) Engineering Sciences",
           "(5) Chemistry/Physics"
       ),  # the text of the legend
       col    = NFDI_color_code ,  # colors of lines and points beside the legend text
       pch    = 20,     # the plotting symbols appearing in the legend
       bty    = "n",    # no frame, the type of box to be drawn around the legend (n=no frame)
       cex    = .75,    # character expansion factor relative to current par("cex").
       pt.cex = 2       # expansion factor(s) for the points
          )
}
```


```R
set.seed(9876543)

plot(NFDI_network_directed,            # loading data frame
     main   = "NFDI Network (<NFDI conference systematics>)",  #<<<<<<<< adding a title
     frame  = TRUE,                    # making a frame 
     layout = layout.graphopt,         # better layout options
     vertex.color       = NFDI_color_groups,   # color of nodes
     vertex.frame.color = NFDI_color_groups,   # color of the frame of nodes
     vertex.label.cex   = 0.5,         # size of the description of the labels
     vertex.label.color = "black",     # color of the description 
                                       # color: https://www.w3schools.com/colors/colors_picker.asp 
     edge.color         = "#808080",   # color of edges
     edge.curved        = 0,           # factor of "curvity"
     vertex.size        = degree(NFDI_network_directed,
                                 mode = "total"), #<<<<<<<<<<< size of nodes depends on amount of edges
     edge.arrow.size    = .5,          # arrow size,  defaults to 1
    )
nfdi_plot_legend() # <<<< add the legend to the plot
```


    
![png](the-promise-to-partner-workshop_files/the-promise-to-partner-workshop_34_0.png)
    


## Additional stuff


```R
nfdi_plot_group <- function(NFDI_name) {
  
    set.seed(9876543)
    nfdi_local_network <- function(NFDI_name) {
    plot(NFDI_network_directed,
     main   = "NFDI Network (<NFDI conference systematics>)",  # adding a title
    sub = NFDI_name,
     frame  = TRUE,                    # making a frame 
     layout = layout.graphopt,         # better layout options
     vertex.color       = NFDI_color_groups,   # color of nodes
     vertex.frame.color = NFDI_color_groups,   # color of the frame of nodes
     vertex.label.cex   = 0.5,         # size of the description of the labels
     vertex.label.color = "black",     # color of the description 
                                       # color: https://www.w3schools.com/colors/colors_picker.asp 
     edge.curved        = 0.2,           # factor of "curvity"
     vertex.size        = degree(NFDI_network_directed,
                                 mode = "total"), #<<<<<<<<<<< size of nodes depends on amount of edges
     edge.arrow.size    = .5,          # arrow size,  defaults to 1
         edge.color = with(NFDI_edges,
                           ifelse(from %in% NFDI_name,"#808080", # grey
                                  ifelse(to == NFDI_name,"#000000", # black
                                         NA)))
        )
    nfdi_plot_legend()

      
          }
    
    ####################################################
    ### ! important! 
    ### If you want to export the plots,
    ### you need to create a folder called "img" first.
    ####################################################
 # pdf(paste0("img/network_group_",NFDI_name,".pdf"))   # save image as PDF
 # nfdi_local_network(NFDI_name) # display image for saving
 # dev.off()                      # close image stream
 nfdi_local_network(NFDI_name)  # display image in JupyterNotebook
}
nfdi_plot_group("NFDI4Ing")
```


    
![png](the-promise-to-partner-workshop_files/the-promise-to-partner-workshop_36_0.png)
    



```R
nfdi_plot_group("NFDI4Microbiota")
```


    
![png](the-promise-to-partner-workshop_files/the-promise-to-partner-workshop_37_0.png)
    


I love loops....


```R
for (name in NFDI_nodes$name){
  nfdi_plot_group(name)
}
```


    
![png](the-promise-to-partner-workshop_files/the-promise-to-partner-workshop_39_0.png)
    



    
![png](the-promise-to-partner-workshop_files/the-promise-to-partner-workshop_39_1.png)
    



    
![png](the-promise-to-partner-workshop_files/the-promise-to-partner-workshop_39_2.png)
    



    
![png](the-promise-to-partner-workshop_files/the-promise-to-partner-workshop_39_3.png)
    



    
![png](the-promise-to-partner-workshop_files/the-promise-to-partner-workshop_39_4.png)
    



    
![png](the-promise-to-partner-workshop_files/the-promise-to-partner-workshop_39_5.png)
    



    
![png](the-promise-to-partner-workshop_files/the-promise-to-partner-workshop_39_6.png)
    



    
![png](the-promise-to-partner-workshop_files/the-promise-to-partner-workshop_39_7.png)
    



    
![png](the-promise-to-partner-workshop_files/the-promise-to-partner-workshop_39_8.png)
    



    
![png](the-promise-to-partner-workshop_files/the-promise-to-partner-workshop_39_9.png)
    



    
![png](the-promise-to-partner-workshop_files/the-promise-to-partner-workshop_39_10.png)
    



    
![png](the-promise-to-partner-workshop_files/the-promise-to-partner-workshop_39_11.png)
    



    
![png](the-promise-to-partner-workshop_files/the-promise-to-partner-workshop_39_12.png)
    



    
![png](the-promise-to-partner-workshop_files/the-promise-to-partner-workshop_39_13.png)
    



    
![png](the-promise-to-partner-workshop_files/the-promise-to-partner-workshop_39_14.png)
    



    
![png](the-promise-to-partner-workshop_files/the-promise-to-partner-workshop_39_15.png)
    



    
![png](the-promise-to-partner-workshop_files/the-promise-to-partner-workshop_39_16.png)
    



    
![png](the-promise-to-partner-workshop_files/the-promise-to-partner-workshop_39_17.png)
    



    
![png](the-promise-to-partner-workshop_files/the-promise-to-partner-workshop_39_18.png)
    


# Backup, export and outlook

We have done the network visualization and analysis using only the package 'igraph'.
Now you have to save the result, e.g. under "*File*" --> "*Save and Checkpoint*".
You can also download the JupyterNotebook, there are several formats available.

If you have created the network with the RNoteBook, you can call it up again at any time via the URL and you can make further modifications in the network.

There are other exciting occupations with this network.
For example, you can also create an interactive network or display the network as a pie chart.
Have a look at the overview on https://www.r-graph-gallery.com/network.html.


```R

```
