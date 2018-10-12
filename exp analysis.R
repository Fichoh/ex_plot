
system.time(df<-read.table(file='household\\household_power_consumption.txt',stringsAsFactor=F,sep=';',header=T,na.strings='?'))

df<-subset(df,Date=='1/2/2007' | Date=='2/2/2007')

df<-transform(df,datetime=as.POSIXct(paste(Date,Time),tz='GMT','%d/%m/%Y %H:%M:%S'))

with(df,hist(Global_active_power,col='red',main='Global Active Power',xlab='Global Active Power (kilowatts)'))
dev.copy(png)

names(df)

plot(df$Date,df$gap,type='l')
