# Script to generate a calender for a year in Markdown
Given here are scripts in increasing complexity resulting in a script which generates the calendar for a year in Markdown notation.
CSV notation is also possible.
The date/time classes used here are the ones which come with the Cuis release. No Chalten classes are used (yet).

## Script 1
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
````Smalltalk
| year month days |
Transcript clear.
year := 2025.
month := 1.
days := Date daysInMonth: 1  forYear: year.
1 to: days do: [:dayNumber | 
     day :=  (Date year: year month: month day: dayNumber).
    weekNo := day week weekNumber.
    Transcript show: 'W', weekNo printString, ' ',day  printString; 
    cr].
````

## Script 3
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
pandoc --from=markdown --to=docx year2025.md -o year2025.docx
````
or HTML
````
pandoc --from=markdown --to=html --standalone year2025.md -o year2025.html
````

