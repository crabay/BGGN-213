#'---
#'title: "Wk 5 Class 5 Data Visualization lab"
#'author: "Chantal Rabay (PID A14528642)"
#'---
# Week 5 Class 5 Data Visualization lab
r = getOption("repos")
r["CRAN"] = "http://cran.us.r-project.org"
options(repos = r)
#One time only install
install.packages("ggplot2")
#Load this every time a new session is started and ggplot is needed
library(ggplot2)
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

install.packages("gifski")
install.packages("gganimate")
install.packages("gapminder")
library(gapminder)
##
## Attaching package: gapminder
## The following object is masked_by_'.GlobalEnv':
##
##    gapminder
library(gganimate)

# Setup nice regular ggplot of the gapminder data
ggplot(gapminder, aes(gdpPercap, lifeExp, size = pop, colour = country)) +
  geom_point(alpha = 0.7, show.legend = FALSE) +
  scale_colour_manual(values = country_colors) +
  scale_size(range = c(2, 12)) +
  scale_x_log10() +
  # Facet by continent
  facet_wrap(~continent) +
  # Here comes the gganimate specific bits
  labs(title = 'Year: {frame_time}', x = 'GDP per capita', y = 'life expectancy') +
  transition_time(year) +
  shadow_wake(wake_length = 0.1, alpha = FALSE)


sessionInfo()



