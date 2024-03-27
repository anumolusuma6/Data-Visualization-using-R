#DataVisualization.R
#Purpose: Code for the Data visuilization in R 
#created by: Suma Anumolu

#Import the libraries
library(ggplot2)

#read the file
monitor_obs = read.csv('C:/Users/dell/OneDrive/HSCI846/WEEK 4/LowerMainland_Monitors_101522-102122.csv')

#lets explore the dataset
head(monitor_obs)

#create a density plot of temperature to better understand the distribution of the data
#here i first use the ggplot() command to let R know that you want to create plot with following data and aesthatics,
#then add geom_density() layer to indicate that as a density plot,
ggplot(data=monitor_obs, aes(x = TEMP)) +
  geom_density()

#lets improve the density plot
#there are different themes available at https://ggplot2.tidyverse.org/reference/ggtheme.html.
#All color options available in R can be seen in this R color cheat sheet: https://www.nceas.ucsb.edu/sites/default/files/2020-04/colorPaletteCheatsheet.pdf.

ggplot (data=monitor_obs, aes( x= TEMP)) +
  geom_density(fill='lightblue')+
  theme_classic()+ #removes the grid lines 
  ggtitle('Temperature Distribuution, Lower Mianland, Oct 15-21, 2022')+
  xlab('Temperature(Celsius)')+
  ylab('Density')

#lets find the distribution of temperature across differnt health authorities
#By setting fill to HA you are specifying that you want to plot the values for each HA separately
ggplot(data=monitor_obs, aes(x=TEMP, group=HA, fill=HA))+
  geom_density()+
  theme_classic()+
  ggtitle('Distribution of the temperature, Lower Mainland, Oct 15-21, 2022')+
  xlab('Temperature (Celsius)')+
  ylab('Density')

#lets upgrade the above plot
ggplot(data=monitor_obs, aes(x=TEMP, group=HA, fill=HA), alpha=0.5)+ #alpha 0.5 mean you want to set the fill color of the plot to "50% transparency"
  geom_density()+
  theme_classic()+
  ggtitle('Distribution of the temperature, Lower Mainland, Oct 15-21, 2022')+
  xlab('Temperature (Celsius)')+
  ylab('Density')
  scale_fill_brewer(palette='Dark2', name='Health Autority') #palette specifies thec olor palette that i want to use
  #the palettes included in the R brewer can be found here  https://r-graph-gallery.com/38-rcolorbrewers-palettes.html
  
  
#now lets understand the NO2 and O3 observations
ggplot(data=monitor_obs, aes(x=O3, y=NO2))+
  geom_point()

#lets upgrade the above plot
ggplot (data=monitor_obs, aes(x=O3, y=NO2))+
  geom_point()+
  theme_classic()+
  ggtitle('Association Between O3 and NO2, Lower Mainland, Oct 15-21, 2022')+
  xlab('Ozone (ppb)')+
  ylab('Nitrogen Dioxide (ppb)')
  

#lets find if there is any assoiation between O3 and NO2 differed by HSDA
ggplot (data=monitor_obs, aes(x=O3, y=NO2, color=HSDA, shape=HSDA))+
  geom_point()+
  theme_classic()+
  ggtitle('Association Between O3 and NO2, Lower Mainland, Oct 15-21, 2022')+
  xlab('Ozone (ppb)')+
  ylab('Nitrogen Dioxide (ppb)')
  
#to understand the realtionship better lets try usiing facets
ggplot (data=monitor_obs, aes(x=O3, y=NO2))+
  geom_point()+
  theme_classic()+
  ggtitle('Association Between O3 and NO2, Lower Mainland, Oct 15-21, 2022')+
  xlab('Ozone (ppb)')+
  ylab('Nitrogen Dioxide (ppb)')+
  facet_wrap(vars(HSDA))
  
#lets create a plot to show the summary statistics of the PM2.5 concentrations across different HA
ggplot(data=monitor_obs, aes(x=HA, y=PM25))+
  geom_boxplot()
  
#lets update the above plot  
ggplot(data=monitor_obs, aes(x=HA, y=PM25, fill=HA))+
  geom_boxplot() +
  theme_classic()+
  ggtitle('PM2.5 concentrations across different Health Authority, Oct 15-21, 2022')+
  xlab('Health Authority')+
  ylab('PM2.5 (ug/m3)')
  scale_fill_brewer(palette='Pastel1', guide='none')

#it looks like the fraser health authority had the higher levels of PM2.5 concentrations than VCH
#now lets find which health service delivery area (HSDA) has the higher PM2.5 values
ggplot(data=monitor_obs, aes(x=HSDA, y=PM25, fill=HSDA))+
  geom_boxplot() +
  theme_classic()+
  ggtitle('PM2.5 concentrations across different Health Authority, Oct 15-21, 2022')+
  xlab('Health Service Delivery Area')+
  ylab('PM2.5 (ug/m3)')
  scale_fill_brewer(palette='Pastel1', guide='none')  #indicates that you do not want to display the legend
  
#now lets make a line graph to understand the temporal trands in PM2.5 during October, 15-21, 2022. 
ggplot (data=monitor_obs, aes(x=Date, y=PM25, group=Station.Name))+
 geom_line()
  
#lets update the above plot
ggplot (data=monitor_obs, aes(x=Date, y=PM25, group=Station.Name, color=HSDA))+
  geom_line()+
  theme_classic()+
  ggtitle('Daily average PM2.5 concentrations by Monitor, Oct 15-21, 2022')+
  xlab('Date')+
  ylab('PM2.5 (ug/m3)')+
  scale_color_brewer(palette='Set1', name='Health Service Delivery Area')
#scale_color_brewer controls the color of outlines or borders

#While the above pot gives a decent sense of how the trends in PM2.5 varied by HSDA
#lets improve it by using facets
ggplot (data=monitor_obs, aes(x=Date, y=PM25, group=Station.Name, color=HSDA))+
  geom_line()+
  theme_classic()+
  ggtitle('Daily average PM2.5 concentrations by Monitor, Oct 15-21, 2022')+
  xlab('Date')+
  ylab('PM2.5 (ug/m3)')+
  scale_color_brewer(palette='Set1', guide='none')+
  facet_wrap(vars(HSDA))














  

