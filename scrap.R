

ra<-sample(1:245031, 10000)

dat<-data_econ[ra,]
dat_1 <- dat %>% 
        mutate(propdmgexp = as.factor(propdmgexp)) %>%
        mutate(cropdmgexp = as.factor(cropdmgexp)) 

summary(dat_1)

dat_2 <- fct_recode(dat_1$propdmgexp, 
        "10000" = "k",
        "1000000" = "m",
        "1000000000" = "b")

dat_3 <- fct_other(dat_2, keep = c("10000", "1000000", "1000000000"))
summary(dat_3)

dat_4 <- data_econ %>% 
        mutate(propdmgexp = as.factor(propdmgexp)) %>%
        mutate(cropdmgexp = as.factor(cropdmgexp)) %>%
        mutate(propdmgexp = fct_recode(.$propdmgexp,"100" = "h","10000" = "k","1000000" = "m","1000000000" = "b")) %>%
        mutate(propdmgexp = fct_other(.$propdmgexp,keep = c("100","10000","1000000","1000000000"))) %>%
        mutate(cropdmgexp = fct_recode(.$cropdmgexp,"10000" = "k","1000000" = "m","1000000000" = "b")) %>%
        mutate(cropdmgexp = fct_other(.$cropdmgexp,keep = c("10000","1000000","1000000000")))



                
                unique(data_econ$cropdmgexp)
                summary(dat_4$cropdmgexp)
                
data_econ_2 <- data_econ %>% 
        mutate(propdmgexp = fct_recode(.$propdmgexp,"1" = "Other")) %>%
        mutate(cropdmgexp = fct_recode(.$cropdmgexp,"1" = "Other"))

summary(data_econ_2$propdmgexp)
a<-data_econ_1$propdmg * parse_number(as.character(data_econ_1$propdmgexp))
unique(a)
filter(total_econdmg, str_detect(evtype, "typhoon"))
