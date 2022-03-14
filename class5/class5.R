#'---
#'title: "Wk 5 Class 5 Data Visualization lab"
#'author: "Chantal Rabay (PID A14528642)"
#'---
# Week 5 Class 5 Data Visualization lab
#One time only install
# install.packages("ggplot2")
#Load this every time a new session is started and ggplot is needed
library(ggplot2)
ggplot(cars) +
  aes(x=speed, y=dist) +
  geom_point()

ggplot(cars) +
  aes(x=speed, y=dist) +
  geom_point() +
  geom_smooth()

ggplot(cars) + 
  aes(x=speed, y=dist) +
  geom_point() +
  labs(title="Speed and Stopping Distances of Cars",
       x="Speed (MPH)", 
       y="Stopping Distance (ft)",
       subtitle = "Your informative subtitle text here",
       caption="Dataset: 'cars'") +
  geom_smooth(method="lm", se=FALSE) +
  theme_bw()


url<- "https://bioboot.github.io/bimm143_S20/class-material/up_down_expression.txt"
genes<-read.delim(url)
head(genes)
nrow(genes)
colnames(genes)
ncol(genes)
table(genes$State)
round( table(genes$State)/nrow(genes)*100, 2 )

ggplot(genes) +
  aes(x=Condition1, y=Condition2) +
  geom_point()

p<- ggplot(genes) +
  aes(x=Condition1, y=Condition2, col=State) +
  geom_point()
p
p + scale_colour_manual(values=c("blue","gray","red"))+
  labs(title="Gene Expression Changes Upon Drug Treatment",
       x="Control (no drug) ",
       y="Drug Treatment")

r = getOption("repos")
r["CRAN"] = "http://cran.us.r-project.org"
options(repos = r)

sessionInfo()
