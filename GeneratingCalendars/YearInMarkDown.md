# Script to generate a calender for a year in Markdown notation
Given here are scripts in increasing complexity resulting in a script which generates the calendar for a year in - Markdown notation. If you are interested only in the result go to script 7.
- The markdown text may be converted to various file formats with pandoc
- CSV notation is also possible.(copy/paste into a text processing program)
- The date/time classes used here are the ones which come with the Cuis release. No Chalten classes are used (yet).
- The Smalltalk coding style is aimed at being easy to understand for people with little or no Smalltalk knowledge in order that the script may be customised.

## Note about the Transcript window
The scripts currently write out the markdown code to the Transcript window. In order to copy the result you need to right-click in the Transcript window and ask for the content to be shown in another window from where you can copy the content.

## ToDo
- Hook up the Calendar data fromo package 'Calendarium-Data' in order to make it possible to have the calendar in another  language than English.
- Create a bilingual calendar type
- Create a trilingual calendar type

## Conversion of the Markdown format with pandoc

With the Pandoc universal document converter (https://www.pandoc.org/) other formats may be obtained:

LibreOffice Writer (OpenDocument Text ODT)
````
pandoc --from=markdown --to=odt year2025.md -o year2025.odt
````
Microsoft Word DOCX
````
pandoc --from=markdown --to=docx year2025.md -o year2025.docx
````

Adobe InDesign (ICML)
````
pandoc --from=markdown --to=icml year2025.md -o year2025.icml
````

or HTML
````
pandoc --from=markdown --to=html --standalone year2025.md -o year2025.html
````

## Useful expressions
````Smalltalk
(Date year: 2025 month: 2 day: 1) weekday #Saturday
(Date year: 2025 month: 1 day: 6) week weekNumber 2 

easterSunday := Date easterDateFor: 2025
sevenWeeks := Duration days: 49.
pentecostSunday := easterSunday2025 + sevenWeeks.
````


## Script 1
Calendar for a month. Each day on one line.
````Smalltalk
| year month days |
Transcript clear.
year := 2025.
month := 1.
days := Date daysInMonth: 1  forYear: year.
1 to: days do: [:day | 
    Transcript show: 
    (Date year: year month: month day: day) printString; 
    cr].
````

## Script 2
Calendar for a month. Each day on one line and also showing the week number.
````Smalltalk
| year month days |
Transcript clear.
year := 2025.
month := 1.
days := Date daysInMonth: month  forYear: year.
1 to: days do: [:dayNumber | 
     day :=  (Date year: year month: month day: dayNumber).
    weekNo := day week weekNumber.
    Transcript show: 'W', weekNo printString, ' ',day  printString; 
    cr].
````

## Script 3
Calendar for a month grouped by weeks and also showing the week number.
````Smalltalk
| year month days |
Transcript clear.
year := 2025.
month := 1.
days := Date daysInMonth: 1  forYear: year.
firstDayInMonth := Date year: year month: 1 day: 1.
weekNoA := firstDayInMonth week weekNumber.
1 to: days do: [:dayNumber | 
     day :=  (Date year: year month: month day: dayNumber).
    weekNoB := day week weekNumber.
    (weekNoB > weekNoA) ifTrue: [Transcript cr].
Transcript show: 'W', weekNoB printString, ' ',day  printString.
weekNoA := weekNoB]
````



## Script 4
Calendar for a month in CSV format to be copied into a word processing program and then 'Table convert to text'
````Smalltalk
"Comma separated values, CSV"
| year month days |
Transcript clear.
year := 2025.
month := 1.
days := Date daysInMonth: 1  forYear: year.
firstDayInMonth := Date year: year month: 1 day: 1.
currentWeekNo := firstDayInMonth week weekNumber.
separator := ','.
1 to: (firstDayInMonth weekdayIndex -1) do: [:no | Transcript show: separator].
1 to: days do: [:dayNumber | 
     day :=  (Date year: year month: month day: dayNumber).
 (day week weekNumber > currentWeekNo) ifTrue: [Transcript show: String crlfString. 
	currentWeekNo := day week weekNumber] ifFalse: [(day = firstDayInMonth) ifFalse: [Transcript show: separator]].
Transcript show: (day dayOfMonth).
]
````

## Script 5
Calendar for a full year in markdown format
````Smalltalk
"Markdown"
| year  days |
Transcript clear.
year := 2025.

Transcript show: '# ', year  asString, String crlfString.

1 to: 12 do: [:month | 
firstDayInMonth := Date year: year month: month day: 1.
currentWeekNo := firstDayInMonth week weekNumber.
Transcript show: '## ', firstDayInMonth month name asString, String crlfString.
Transcript show: 'Mon   Tue   Wed   Thu   Fri   Sat   Sun', String crlfString.
columnIndicator := '----- '.
emptyDayCell := '      '. "seven spaces"
1 to: 7 do: [:no | Transcript show: columnIndicator].
Transcript show: String crlfString.
1 to: (firstDayInMonth weekdayIndex -1) do: [:no | Transcript show: emptyDayCell].
days := Date daysInMonth: firstDayInMonth monthIndex   forYear: firstDayInMonth year yearNumber.
1 to: days do: [:dayNumber | 
     day :=  (Date year: year month: month day: dayNumber).
 (day week weekNumber > currentWeekNo) ifTrue: [Transcript show: String crlfString. 
	currentWeekNo := day week weekNumber] ifFalse: [(day = firstDayInMonth)].
d := day dayOfMonth.
(d < 10) ifTrue: [Transcript show: d printString, '     '] ifFalse: [Transcript show: d printString, '    ']
].
Transcript show: String crlfString.
1 to: 7 do: [:no | Transcript show: columnIndicator].
Transcript show: String crlfString, String crlfString]
````

## Script 6
Is the same as script 5 but the test
````Smalltalk
(day week weekNumber > currentWeekNo)
````
has been changed to
````Smalltalk
(day week weekNumber = currentWeekNo) not
````
to avoid a problem with a new week not starting after the 28th December 2025.

````Smalltalk
"Markdown"
| year  days |
Transcript clear.
year := 2025.

Transcript show: '# ', year  asString, String crlfString.

1 to: 12 do: [:month | 
firstDayInMonth := Date year: year month: month day: 1.
currentWeekNo := firstDayInMonth week weekNumber.
Transcript show: '## ', firstDayInMonth month name asString, String crlfString.
Transcript show: 'Mon   Tue   Wed   Thu   Fri   Sat   Sun', String crlfString.
columnIndicator := '----- '.
emptyDayCell := '      '. "seven spaces"
1 to: 7 do: [:no | Transcript show: columnIndicator].
Transcript show: String crlfString.
1 to: (firstDayInMonth weekdayIndex -1) do: [:no | Transcript show: emptyDayCell].
days := Date daysInMonth: firstDayInMonth monthIndex   forYear: firstDayInMonth year yearNumber.
1 to: days do: [:dayNumber | 
     day :=  (Date year: year month: month day: dayNumber).
 (day week weekNumber = currentWeekNo) not ifTrue: [Transcript show: String crlfString. 
	currentWeekNo := day week weekNumber] ifFalse: [(day = firstDayInMonth)].
d := day dayOfMonth.
(d < 10) ifTrue: [Transcript show: d printString, '     '] ifFalse: [Transcript show: d printString, '    ']
].
Transcript show: String crlfString.
1 to: 7 do: [:no | Transcript show: columnIndicator].
Transcript show: String crlfString, String crlfString]
````

## Result
````Markdown

# 2025
## January
Mon   Tue   Wed   Thu   Fri   Sat   Sun
----- ----- ----- ----- ----- ----- ----- 
            1     2     3     4     5     
6     7     8     9     10    11    12    
13    14    15    16    17    18    19    
20    21    22    23    24    25    26    
27    28    29    30    31    
----- ----- ----- ----- ----- ----- ----- 

## February
Mon   Tue   Wed   Thu   Fri   Sat   Sun
----- ----- ----- ----- ----- ----- ----- 
                              1     2     
3     4     5     6     7     8     9     
10    11    12    13    14    15    16    
17    18    19    20    21    22    23    
24    25    26    27    28    
----- ----- ----- ----- ----- ----- ----- 

## March
Mon   Tue   Wed   Thu   Fri   Sat   Sun
----- ----- ----- ----- ----- ----- ----- 
                              1     2     
3     4     5     6     7     8     9     
10    11    12    13    14    15    16    
17    18    19    20    21    22    23    
24    25    26    27    28    29    30    
31    
----- ----- ----- ----- ----- ----- ----- 

## April
Mon   Tue   Wed   Thu   Fri   Sat   Sun
----- ----- ----- ----- ----- ----- ----- 
      1     2     3     4     5     6     
7     8     9     10    11    12    13    
14    15    16    17    18    19    20    
21    22    23    24    25    26    27    
28    29    30    
----- ----- ----- ----- ----- ----- ----- 

## May
Mon   Tue   Wed   Thu   Fri   Sat   Sun
----- ----- ----- ----- ----- ----- ----- 
                  1     2     3     4     
5     6     7     8     9     10    11    
12    13    14    15    16    17    18    
19    20    21    22    23    24    25    
26    27    28    29    30    31    
----- ----- ----- ----- ----- ----- ----- 

## June
Mon   Tue   Wed   Thu   Fri   Sat   Sun
----- ----- ----- ----- ----- ----- ----- 
                                    1     
2     3     4     5     6     7     8     
9     10    11    12    13    14    15    
16    17    18    19    20    21    22    
23    24    25    26    27    28    29    
30    
----- ----- ----- ----- ----- ----- ----- 

## July
Mon   Tue   Wed   Thu   Fri   Sat   Sun
----- ----- ----- ----- ----- ----- ----- 
      1     2     3     4     5     6     
7     8     9     10    11    12    13    
14    15    16    17    18    19    20    
21    22    23    24    25    26    27    
28    29    30    31    
----- ----- ----- ----- ----- ----- ----- 

## August
Mon   Tue   Wed   Thu   Fri   Sat   Sun
----- ----- ----- ----- ----- ----- ----- 
                        1     2     3     
4     5     6     7     8     9     10    
11    12    13    14    15    16    17    
18    19    20    21    22    23    24    
25    26    27    28    29    30    31    
----- ----- ----- ----- ----- ----- ----- 

## September
Mon   Tue   Wed   Thu   Fri   Sat   Sun
----- ----- ----- ----- ----- ----- ----- 
1     2     3     4     5     6     7     
8     9     10    11    12    13    14    
15    16    17    18    19    20    21    
22    23    24    25    26    27    28    
29    30    
----- ----- ----- ----- ----- ----- ----- 

## October
Mon   Tue   Wed   Thu   Fri   Sat   Sun
----- ----- ----- ----- ----- ----- ----- 
            1     2     3     4     5     
6     7     8     9     10    11    12    
13    14    15    16    17    18    19    
20    21    22    23    24    25    26    
27    28    29    30    31    
----- ----- ----- ----- ----- ----- ----- 

## November
Mon   Tue   Wed   Thu   Fri   Sat   Sun
----- ----- ----- ----- ----- ----- ----- 
                              1     2     
3     4     5     6     7     8     9     
10    11    12    13    14    15    16    
17    18    19    20    21    22    23    
24    25    26    27    28    29    30    
----- ----- ----- ----- ----- ----- ----- 

## December
Mon   Tue   Wed   Thu   Fri   Sat   Sun
----- ----- ----- ----- ----- ----- ----- 
1     2     3     4     5     6     7     
8     9     10    11    12    13    14    
15    16    17    18    19    20    21    
22    23    24    25    26    27    28    
29    30    31    
----- ----- ----- ----- ----- ----- ----- 
````

## Conversion to other formats with pandoc
With the Pandoc universal document converter (https://www.pandoc.org/) other formats may be obtained:

For example ODT (LibreOffice)
````
pandoc --from=markdown --to=odt year2025.md -o year2025.odt
````
or Microsoft Word
````
pandoc --from=markdown --to=docx year2025.md -o year2025.docx````````
````

or Adobe InDesign
````
pandoc --from=markdown --to=icml year2025.md -o year2025.icml
````

or HTML
````
pandoc --from=markdown --to=html --standalone year2025.md -o year2025.html
````


# Festivals and holidays
## Easter
https://en.wikipedia.org/wiki/List_of_dates_for_Easter
````Markdown
-----           --------
2025		April 20
2026		April 5	
2027		March 28
2028	        April 16
2029	        April 1
2030	        April 21
2031	        April 13
2032	        March 28
2033	        April 17
2034	        April 9
-----           --------
````


Astronomical Society of South Australia / Resources
List of Easter Sunday Dates 2000-2099
https://www.assa.org.au/edm/#List20
(includes a BASIC program how the easter dates were calculated)

However Cuis already has a method for this.
````Smalltalk
easterSunday := Date easterDateFor: 2025
````

Good Friday
````Smalltalk
goodFriday:= (Date easterDateFor: 2025) previous previous.
````


## Pentecost
https://en.wikipedia.org/wiki/Pentecost
Pentecost (also called Whit Sunday, Whitsunday or Whitsun) is a Christian holiday which takes place on the 49th day (50th day when inclusive counting is used) after Easter Day.

Dates are given as Gregorian dates

````Markdown
Year    Western Eastern
------- ------- -------
2025	June 8  June 8
2026	May 24	May 31
2027	May 16 	June 20
2028	June 4  June 4
2029	May 20	May 27
2030	June 9	June 16
2031	June 1  June 1
------- ------- -------
````

Calculation of Pentecost Sunday

````Smalltalk
easterSunday := Date easterDateFor: 2025
sevenWeeks := Duration days: 49.
pentecostSunday := easterSunday2025 + sevenWeeks.
````



# Script 7
Made columns wider and added dates of events/festivals.

````Smalltalk

"Markdown"
| year  |
Transcript clear.

year := 2025.


events := Dictionary new. "for the next 20 years"

year to: year + 20 do: [:yyyy |
"Events where the date changes each year"
    easterSunday := Date easterDateFor: yyyy.
    goodFriday := easterSunday previous previous.
    sevenWeeks := Duration days: 49.
    pentecostSunday := easterSunday + sevenWeeks.
    events at: easterSunday put: 'Easter'.
    events at: goodFriday put: 'Good Friday'.
    events at: pentecostSunday put: 'Pentcost'.

    "Recurring events each year with fixed date"
    events at: (Date year: yyyy month: 12 day: 25) put: 'Christmas'.
    
    "events at: (Date year: yyyy month: 5 day: 17) put: 'MH birthday'.
    events at: (Date year: yyyy month: 9 day: 24) put: 'NY birthday'."
].




Transcript show: '# ', year  asString, String crlfString.

1 to: 12 do: [:month | 
firstDayInMonth := Date year:  year month: month day: 1.
currentWeekNo := firstDayInMonth week weekNumber.

Transcript show: '## ', firstDayInMonth month name asString, String crlfString.
Transcript show: 'Mon            Tue            Wed            Thu            Fri            Sat            Sun', String crlfString.

columnIndicator := '-------------- '.
emptyDayCell := '               '. "fifteen spaces"
1 to: 7 do: [:no | Transcript show: columnIndicator].
Transcript show: String crlfString.
1 to: (firstDayInMonth weekdayIndex -1) do: [:no | Transcript show: emptyDayCell].

days := Date daysInMonth: firstDayInMonth monthIndex   forYear: firstDayInMonth year yearNumber.
1 to: days do: [:dayNumber | 
     day :=  (Date year: year month: month day: dayNumber).
 (day week weekNumber = currentWeekNo) not ifTrue: [Transcript show: String crlfString. 
	currentWeekNo := day week weekNumber].
       dStr := day dayOfMonth printString.
        fv := events at: day ifAbsent: [''].
       (fv size > 0) ifTrue: [dStr := dStr,' ',fv].
       (15 - dStr size) timesRepeat: [dStr := dStr, ' '].
 	Transcript show: dStr.
].


Transcript show: String crlfString.
1 to: 7 do: [:no | Transcript show: columnIndicator].
Transcript show: String crlfString, String crlfString]
````


# Result of script 7 with festivals

````Markdown
Cuis7.3
latest update: #6907
Running at :C:\Users\hhzl\Documents\2024-12-10_Cuis7.3\CuisImage\Cuis7.3-6895.image

# 2025
## January
Mon            Tue            Wed            Thu            Fri            Sat            Sun
-------------- -------------- -------------- -------------- -------------- -------------- -------------- 
                              1              2              3              4              5              
6              7              8              9              10             11             12             
13             14             15             16             17             18             19             
20             21             22             23             24             25             26             
27             28             29             30             31             
-------------- -------------- -------------- -------------- -------------- -------------- -------------- 

## February
Mon            Tue            Wed            Thu            Fri            Sat            Sun
-------------- -------------- -------------- -------------- -------------- -------------- -------------- 
                                                                           1              2              
3              4              5              6              7              8              9              
10             11             12             13             14             15             16             
17             18             19             20             21             22             23             
24             25             26             27             28             
-------------- -------------- -------------- -------------- -------------- -------------- -------------- 

## March
Mon            Tue            Wed            Thu            Fri            Sat            Sun
-------------- -------------- -------------- -------------- -------------- -------------- -------------- 
                                                                           1              2              
3              4              5              6              7              8              9              
10             11             12             13             14             15             16             
17             18             19             20             21             22             23             
24             25             26             27             28             29             30             
31             
-------------- -------------- -------------- -------------- -------------- -------------- -------------- 

## April
Mon            Tue            Wed            Thu            Fri            Sat            Sun
-------------- -------------- -------------- -------------- -------------- -------------- -------------- 
               1              2              3              4              5              6              
7              8              9              10             11             12             13             
14             15             16             17             18 Good Friday 19             20 Easter      
21             22             23             24             25             26             27             
28             29             30             
-------------- -------------- -------------- -------------- -------------- -------------- -------------- 

## May
Mon            Tue            Wed            Thu            Fri            Sat            Sun
-------------- -------------- -------------- -------------- -------------- -------------- -------------- 
                                             1              2              3              4              
5              6              7              8              9              10             11             
12             13             14             15             16             17             18             
19             20             21             22             23             24             25             
26             27             28             29             30             31             
-------------- -------------- -------------- -------------- -------------- -------------- -------------- 

## June
Mon            Tue            Wed            Thu            Fri            Sat            Sun
-------------- -------------- -------------- -------------- -------------- -------------- -------------- 
                                                                                          1              
2              3              4              5              6              7              8 Pentcost     
9              10             11             12             13             14             15             
16             17             18             19             20             21             22             
23             24             25             26             27             28             29             
30             
-------------- -------------- -------------- -------------- -------------- -------------- -------------- 

## July
Mon            Tue            Wed            Thu            Fri            Sat            Sun
-------------- -------------- -------------- -------------- -------------- -------------- -------------- 
               1              2              3              4              5              6              
7              8              9              10             11             12             13             
14             15             16             17             18             19             20             
21             22             23             24             25             26             27             
28             29             30             31             
-------------- -------------- -------------- -------------- -------------- -------------- -------------- 

## August
Mon            Tue            Wed            Thu            Fri            Sat            Sun
-------------- -------------- -------------- -------------- -------------- -------------- -------------- 
                                                            1              2              3              
4              5              6              7              8              9              10             
11             12             13             14             15             16             17             
18             19             20             21             22             23             24             
25             26             27             28             29             30             31             
-------------- -------------- -------------- -------------- -------------- -------------- -------------- 

## September
Mon            Tue            Wed            Thu            Fri            Sat            Sun
-------------- -------------- -------------- -------------- -------------- -------------- -------------- 
1              2              3              4              5              6              7              
8              9              10             11             12             13             14             
15             16             17             18             19             20             21             
22             23             24             25             26             27             28             
29             30             
-------------- -------------- -------------- -------------- -------------- -------------- -------------- 

## October
Mon            Tue            Wed            Thu            Fri            Sat            Sun
-------------- -------------- -------------- -------------- -------------- -------------- -------------- 
                              1              2              3              4              5              
6              7              8              9              10             11             12             
13             14             15             16             17             18             19             
20             21             22             23             24             25             26             
27             28             29             30             31             
-------------- -------------- -------------- -------------- -------------- -------------- -------------- 

## November
Mon            Tue            Wed            Thu            Fri            Sat            Sun
-------------- -------------- -------------- -------------- -------------- -------------- -------------- 
                                                                           1              2              
3              4              5              6              7              8              9              
10             11             12             13             14             15             16             
17             18             19             20             21             22             23             
24             25             26             27             28             29             30             
-------------- -------------- -------------- -------------- -------------- -------------- -------------- 

## December
Mon            Tue            Wed            Thu            Fri            Sat            Sun
-------------- -------------- -------------- -------------- -------------- -------------- -------------- 
1              2              3              4              5              6              7              
8              9              10             11             12             13             14             
15             16             17             18             19             20             21             
22             23             24             25 Christmas   26             27             28             
29             30             31             
-------------- -------------- -------------- -------------- -------------- -------------- -------------- 

````

# Links
Search for: 'script to generate a calendar in markdown'.
Get ideas from: 
- https://github.com/Nielius/md-agenda
- https://github.com/callum-oakley/markdown-calendar
- https://github.com/nequals30/MDcalendar
- https://github.com/mattgemmell/Calendar/  (HTML formatted with CSS)

 The information about day, month and calendar names is from: https://github.com/fccm/ocaml-cal-svg 
