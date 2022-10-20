# Brad-s-Future-Camp-Program
Program for placing all children 3 activity sections out of 5 options
6 activities per week
2 activities after breakfast
1 after lunch
Mon Tue Wed Thur Fri Sat Sun
1   2   3   4    5   6    7
When requesting activities kids get to select 10 different activities

Beginner project period minimum required campers: 5
Beginner project period max campers: 

 Start with a database 
 Every activity gets its own table
 Camper table
 Counselor table
 
 CITs and their history from when they are a camper, need to have the ability to convert camper ID to a counselor ID when they age out 

-----------------------------------------
-----------------------------------------
-----------------------------------------
-----------------------------------------
Table descriptions
Huts: cabin - is the name of the physical structure ie J6; year_built - is the year that the cabin was built in (fun way to keep track of some history); max_occ - maximum occupancy of the structure; min_occ - minimum occupancy, village - junior, ridge, villa; age_group - the age range of the campers staying in that cabin
Cabin: cabin - the name of the physical structure; session - the session of camp that is taking place; occupants - the ids of the campers assigned to that cabin for the session
Bodies: id - the system sequence serial number assigned to the individual; sesh - the current session of camp; name - the name of the individual attending/working at North Star; DOB - date of birth for calculating age; n_summers - the number of summers they have attended camp
Session: sesh - the concatenated unique identifier for a session of camp; year - the current year; session - the chunk of the summer it currently is (1,2,3,4)
Counselor: id - SSSN assigned to the counselor
Camper: id - see above; name - the individuals name; age - calculated from the DOB
Activity: act_num - serial number assigned to each activity; min - minimum amount of campers required for a program period; max - max permitted in one program period; name - the name of the activity
Prereq: act_num - the number of the intended activity; prereq_num - the act_num of the prerequisite activity
Takes: act_num - the number of the intended activity; id - the SSSN of the camper; period - period of the day the activity is taking place; week - whatever week of camp the activity is taking place, sesh - the session of camp the activity takes place in; location - area of camp the activity is taking place in; inst_id - SSSN of the counselor instructing the activity
