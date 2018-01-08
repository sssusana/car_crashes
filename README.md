# car_crashes
Airbag And Other Influences On Accident Fatalities

US data, for 1997-2002, from police-reported car crashes in which there is a harmful event (people or property), and from which at least one vehicle was towed. Data are restricted to front-seat occupants.

Variables:
dead:factor with levels alive dead
airbag: a factor with levels none airbag
seatbelt: aa factor with levels none belted
frontal: a numeric vector; 0 = non-frontal, 1=frontal impact
sex: a factor with levels f m
occRole
a factor with levels driver pass
--
not used:
injSeverity
a numeric vector; 0:none, 1:possible injury, 2:no incapacity, 3:incapacity, 4:killed; 5:unknown, 6:prior death

-- 

Formulas that could be used if we want to use more variables:

Formula used to do the car age categorization
=IF(L2<=1;"New";IF(L2<=3;"2-3y";IF(L2<=5;"3-5y";IF(L2<=10;"5-10y";IF(L2<=15;"10-15y";IF(L2<20;"16-20y";">20y"))))))

=IF(K10=0; "noInjury"; IF(K10 = 1; "possibleInjury"; IF(K10=2;"noIncapacity"; IF(K10 = 3; "Incapacity"; IF(K10 = 4; "Killed"; Other)))))
