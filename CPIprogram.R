			#==========
#Title: This is R program
#Objective: To estimate least squares
#Author: Fadhilah Nur Binti Ismail
#Matric Number :A167808
#Date :26 July 2020 (Friday)
#==========

#untuk remove file dan clearkan file sebelumnya
remove(list=ls())
dir()

#untuk set path yang kita nak
require(rstudioapi)

#nak direct import kepada path yang kita nak
rstudioapi::getActiveDocumentContext()
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#untuk import data, guna package read excel
require(readxl)
df = read_excel("python.xlsx",sheet="CPI")

#buat simple descriptive stats: mean,variance and standard deviation
mean = mean(df$CPI)
variance = var(df$CPI)
std = sd(df$CPI)

#median,minimum and maximum
median = median(df$CPI)
max = max(df$CPI)
min = min(df$CPI)
print(min)

#plot data CPI sahaja
#declare CPI dulu sebagai satu nilai series
CPI = df$CPI
plot(CPI,type="l",col="maroon")
title(main = "Consumer Price Index from January 2010 until January 2020",col.main = "magenta")


#drop 4 variable TIT,POP,TEDB,EX
df$TIT = df$POP = df$TEDB = df$EX = df$Year= NULL
#namakan dataframe baru yang dah log
dflog = log(df)
#estimate OLS
reg = lm(CPI~USD+OIL , data=dflog)
summary(reg)

#Export results into doc format
require(stargazer)
stargazer(reg,
          type="html",
          out="A167808.doc")
