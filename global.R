#Load Data (Fri Jun  6 10:22:10 2014)
dfk <- read.table("data/koi.csv", sep=",",header=TRUE,stringsAsFactors=FALSE) 
dfp <- read.table("data/planets_confirmed.csv", sep=",",header=TRUE,stringsAsFactors=FALSE)

# Confirmed Planets by Kepler Spacecraft
dfp1<-subset(dfp, pl_kepflag == 1)
dfp1$pl_eqt<-log(dfp1$pl_eqt)
dfp1$pl_orbsmax<-log(dfp1$pl_orbsmax)

# Kepler Object of Interest
dfk1<-subset(dfk,koi_disposition == 'CANDIDATE' | koi_disposition == 'CONFIRMED')
dfk1$koi_teq<-log(dfk1$koi_teq)
dfk1$koi_dor<-log(dfk1$koi_dor)

#Number Exoplanets by Methods and Years
dfp$value<-1
dfp2<-aggregate(dfp$value,list(Method = dfp$pl_discmethod, Year = dfp$pl_disc),sum)
colnames(dfp2)<-c('Method','Year','Freq')