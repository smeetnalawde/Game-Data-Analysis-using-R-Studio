library(dplyr)
library(ggplot2)
library(tidyr)
library(lubridate)
library(janitor)
library(tidyverse)
library(scales)
library(viridis)
library(viridisLite)
library(knitr)
library(magrittr)
library(rmarkdown)
library(readr)

vgsales <- read_csv("C:/Users/prade/OneDrive/Documents/vgsales.csv")
view(vgsales)

glimpse(vgsales)
head(vgsales)

colnames(vgsales)
str(vgsales)

summary(vgsales)

count(vgsales[is.na(vgsales$Year), ])

hist(vgsales$Global_Sales)

vgsales %>% 
  select(Rank, NA_Sales, EU_Sales, JP_Sales, Other_Sales, Global_Sales) %>% 
  filter(!complete.cases(.))

vgsales[!duplicated(vgsales$Year), ]

vgsales %>% 
  distinct()

vgsales %>% 
  select(Name, Global_Sales, Year, Genre) %>% 
  filter(Global_Sales >= 25) %>% 
  ggplot(aes(x=Name, y=Global_Sales)) +
  geom_point(aes(colour=Year, size=Genre)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 1, hjust = 0.5)) +
  labs(x = "Game", y = "Global Sales", title = "Highest Selling Video Game")

vgsales %>% 
  select(Global_Sales, Genre) %>% 
  ggplot(data=vgsales, mapping=aes(Genre, Global_Sales)) +
  geom_bar(stat = "identity", fill="blue") +
  theme(axis.text.x = element_text(angle = 90, vjust = 1, hjust = 0.5)) +
  labs(x = "Genre", y = "Global Sales", title = "What Genre Sells The Most")

top_publisher <- vgsales %>% 
  group_by(Publisher) %>% 
  summarise(Count = n()) %>% 
  arrange(desc(Count)) %>% 
  top_n(10)


ggplot(data=top_publisher, mapping = aes(x=Publisher, y=Count, fill=Count)) + 
  geom_bar(colour="black", stat="identity")+
  theme(axis.text.x = element_text(angle = 90, vjust = 1,hjust = 1)) +
  scale_y_continuous(breaks = scales::pretty_breaks(n = 10)) +
  theme(axis.text.x = element_text(angle = 90, vjust = 1, hjust = 0.5))

popular_platform_year <- vgsales %>% 
  group_by(Platform, Year) %>% 
  summarise(GlobalSales = sum(Global_Sales)) %>% 
  arrange(desc(GlobalSales)) %>%
  arrange(Year) %>% top_n(1)

ggplot(data = popular_platform_year, aes(y= Year, x=GlobalSales, fill=Platform)) +
  geom_bar(stat="identity")+
  labs(x="Global Sales", title ="Most popular platform per year")+
  theme_dark()

most_popular_game <- vgsales %>% 
  group_by(Year) %>% 
  arrange(desc(Global_Sales)) %>% 
  top_n(1)

ggplot(data = most_popular_game, mapping = aes(x=Name, y=Global_Sales, colour=Year)) +
  geom_point(size=8) +
  geom_segment(aes(x=Name, xend=Name, y=0, yend=Global_Sales)) +
  labs(title = "Most Popular Game Per Year", x="Video Game", y="Global Sales")+
  coord_flip()
