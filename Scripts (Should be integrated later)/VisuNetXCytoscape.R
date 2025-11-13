library(devtools)
if(!"RCy3" %in% installed.packages()){
    install.packages("BiocManager")
    BiocManager::install("RCy3")
}
library(RCy3)
load_all(path = "C:/Users/matti/Documents/GitHub/VisuNet.v.1.1")

autconJohnson <- rosetta(autcon, roc = TRUE, clroc = "autism")
rules <- autconJohnson$main

title <- "Autism_Visunet"

Autism_Visunet <- visunet(rules)

for (net_name in names(Autism_Visunet)) {
  network <- Autism_Visunet[[net_name]]
  colnames(network$edges)[colnames(network$edges) == "from"] <- "source"
  colnames(network$edges)[colnames(network$edges) == "to"] <- "target"
  createNetworkFromDataFrames(network$nodes,network$edges, title=net_name, collection=title)
}
