**Importing card.xlsx file
import excel "C:\Users\jbarillas\Desktop\ECON6424\Data Sets-Excel\card.xls", sheet("CARD")

**Rename alphabetical variables to their actual variable name 
rename A  id                       
rename B  nearc2                   
rename C  nearc4                   
rename D  educ                     
rename E  age                      
rename F  fatheduc                 
rename G  motheduc                 
rename H  weight                   
rename I  momdad14                 
rename J  sinmom14                 
rename K  step14                   
rename L  reg661                   
rename M  reg662                   
rename N  reg663                   
rename O  reg664                   
rename P  reg665                   
rename Q  reg666                   
rename R  reg667                   
rename S  reg668                   
rename T  reg669                   
rename U  south66                  
rename V  black                    
rename W  smsa                     
rename X  south                    
rename Y  smsa66                   
rename Z  wage                     
rename AA enroll                  
rename AB KWW                     
rename AC IQ                      
rename AD married                 
rename AE libcrd14                
rename AF exper                   
rename AG lwage                   
rename AH expersq  

**Inspect data
de

//Problem: a few numerical variables (KWW, IQ, married, libcrd14)
//were imported as string
**Repair variables using destring
destring  KWW IQ married libcrd14, replace

**Label variables to include description              
label var id       "person identifier"
label var nearc2   "=1 if near 2 yr college, 1966"
label var nearc4   "=1 if near 4 yr college, 1966"
label var educ     "years of schooling, 1976"
label var age      "in years"
label var fatheduc "father's schooling"
label var motheduc "mother's schooling"
label var weight   "NLS sampling weight, 1976"
label var momdad14 "=1 if live with mom, dad at 14"
label var sinmom14 "=1 if with single mom at 14"
label var step14   "=1 if with step parent at 14"
label var reg661   "=1 for region 1, 1966"
label var reg662   "=1 for region 2, 1966"
label var reg663   "=1 for region 3, 1966"
label var reg664   "=1 for region 4, 1966"
label var reg665   "=1 for region 5, 1966"
label var reg666   "=1 for region 6, 1966"
label var reg667   "=1 for region 7, 1966"
label var reg668   "=1 for region 8, 1966"
label var reg669   "=1 for region 9, 1966"
label var south66  "=1 if in south in 1966"
label var black    "=1 if black"
label var smsa     "=1 in in SMSA, 1976"
label var south    "=1 if in south, 1976"
label var smsa66   "=1 if in SMSA, 1966"
label var wage     "hourly wage in cents, 1976"
label var enroll   "=1 if enrolled in school, 1976"
label var KWW      "knowledge world of work score"
label var IQ       "IQ score"
label var married  "=1 if married, 1976"
label var libcrd14 "=1 if lib. card in home at 14"
label var exper    "age - educ - 6"
label var lwage    "log(wage)"
label var expersq  "exper^2"

**Part a: Estimate lwage equation
reg lwage educ exper expersq black south smsa reg661 reg662 reg663 reg664 reg665 reg666 reg667 reg668 smsa66

**Part b: Estimate reduced form equation for educ
reg educ exper expersq black south smsa reg661 reg662 reg663 reg664 reg665 reg666 reg667 reg668 smsa66 nearc4

**Part c: Estimate using IV
ivreg 2sls lwage (educ = nearc4) exper expersq black south smsa reg661 reg662 reg663 reg664 reg665 reg666 reg667 reg668 smsa66

**Part d: Estimate with more than one IV
reg educ exper expersq black south smsa reg661 reg662 reg663 reg664 reg665 reg666 reg667 reg668 smsa66 nearc4 nearc2

ivreg lwage (educ = nearc4 nearc2) exper expersq black south smsa reg661 reg662 reg663 reg664 reg665 reg666 reg667 reg668 smsa66

**Part e: Estimate iq on nearc4
reg IQ nearc4

**Part f: Estimate iq on nearc4 and other variables
reg IQ nearc4 smsa66 reg661 reg662 reg669
