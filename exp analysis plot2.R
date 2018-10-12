df<-read.table(file='household\\household_power_consumption.txt',stringsAsFactor=F,sep=';',header=T,na.strings='?')

df<-subset(df,Date=='1/2/2007' | Date=='2/2/2007')

df<-transform(df,datetime=as.POSIXct(paste(Date,Time),tz='GMT','%d/%m/%Y %H:%M:%S'))

with(df,
     plot(datetime,Global_active_power,main='Global Active Power',type='l',
          ylab='Global Active Power (kilowatts)',xlab=''))
dev.copy(png,'plot2.png',height=480,width=480)
dev.off()