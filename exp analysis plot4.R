df<-read.table(file='household\\household_power_consumption.txt',stringsAsFactor=F,sep=';',header=T,na.strings='?')

df<-subset(df,Date=='1/2/2007' | Date=='2/2/2007')

df<-transform(df,datetime=as.POSIXct(paste(Date,Time),tz='GMT','%d/%m/%Y %H:%M:%S'))

par(mfrow=c(2,2))
with(df, {
  plot(datetime,Global_active_power,type='l')
  plot(datetime,Voltage,type='l',xlab='datetime',ylab='Voltage')
  plot(datetime,Sub_metering_1,type='l',ylab='Energy Sub Metering',xlab='')
  lines(datetime,Sub_metering_2,col='red')
  lines(datetime,Sub_metering_3,col='blue')
  legend('topright',col=c('black','red','blue'),lty=1,lwd=0.8,
         legend=c('Sub_Metering_1','Sub_metering_2','Sub_metering_3'),cex=0.5,bty='n')
  plot(datetime,Global_reactive_power,type='l',ylab='Global Reactive POwer(kilowatts)',
       xlab='')
})
dev.copy(png,'plot4.png',width=480,height=480)
dev.off()