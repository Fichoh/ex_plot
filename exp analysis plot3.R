df<-read.table(file='household\\household_power_consumption.txt',stringsAsFactor=F,sep=';',header=T,na.strings='?')

df<-subset(df,Date=='1/2/2007' | Date=='2/2/2007')

df<-transform(df,datetime=as.POSIXct(paste(Date,Time),tz='GMT','%d/%m/%Y %H:%M:%S'))

with(df, {
     plot(datetime,Sub_metering_1,type='l',ylab='Energy Sub Metering',xlab='')
     lines(datetime,Sub_metering_2,col='red')
     lines(datetime,Sub_metering_3,col='blue')
     legend('topright',col=c('black','red','blue'),lty=1,lwd=1,
            labels=c('Sub_Metering_1','Sub_metering_2','Sub_metering_3'))
})
dev.copy(png,plot3.png,width=480,height=480)
dev.off()
