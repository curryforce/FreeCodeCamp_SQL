#!/bin/bash

#
# Script to insert data from courses.csv and students.csv into students database

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
# sorgt dafür, dass inhalt von tabellen geleert wird ohne tabs selbst zu löschen, auch foreign key constraints berücksichtigt
echo $($PSQL "TRUNCATE students, majors, courses, majors_courses")

#hier wird csv in "pipe" eingelesen und durch loop in vars übergeben
cat courses.csv | while IFS="," read MAJOR COURSE
do
  #checkt ob header ignoriert wird
  if [[ $MAJOR != "major" ]]
  then
    # get major_id, dann major_id request in tabelle majors machen
    MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")

    # if not found, also wenn Eintrag noch nicht in datenbank angelegt wurde
    if [[ -z $MAJOR_ID ]]
    then
      # insert major, eintrag wird in tab majors vorgenommen
      INSERT_MAJOR_RESULT=$($PSQL "INSERT INTO majors(major) VALUES('$MAJOR')")
      if [[ $INSERT_MAJOR_RESULT == "INSERT 0 1" ]]
      then
      #ergebnis wird geprintet mit variabel inhalt im aktuellen loop-schritt
        echo Inserted into majors, $MAJOR
      fi

      # get new major_id
      # neue major id wird gespeichert, loop geht weiter...
      MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
    fi

    # get course_id, gleich wie oben
    COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")

    # if not found
    if [[ -z $COURSE_ID ]]
    then
      # insert course
      INSERT_COURSE_RESULT=$($PSQL "INSERT INTO courses(course) VALUES('$COURSE')")
      if [[ $INSERT_COURSE_RESULT == "INSERT 0 1" ]]
      then
        echo Inserted into courses, $COURSE
      fi

      # get new course_id
      COURSE_ID=$($PSQL "SELECT course_id FROM courses WHERE course='$COURSE'")
    fi

    # insert into majors_courses
    # hier werden in junction-table sowohl var für MAJOR_ID als auch COURSE_ID in die tabelle eingefügt
    INSERT_MAJORS_COURSES_RESULT=$($PSQL "INSERT INTO majors_courses(major_id,course_id) VALUES($MAJOR_ID, $COURSE_ID)")
    #check, ob wert eingetragen wurde
    if [[ $INSERT_MAJORS_COURSES_RESULT == "INSERT 0 1" ]]
    then
      echo Inserted into majors_courses, $MAJOR : $COURSE
    fi

  fi
done

#nächster loop für zweites file students mit 4 variablen
cat students.csv | while IFS="," read FIRST LAST MAJOR GPA
do
  if [[ $FIRST != "first_name" ]]
  then
  #get major_id
  MAJOR_ID=$($PSQL "SELECT major_id FROM majors WHERE major='$MAJOR'")
  #if not found
  if [[ -z $MAJOR_ID ]]
  then
    #set to null
    MAJOR_ID=null
  fi
  #insert student, wieder inhalte nach loop tabelle students auffüllen
  INSERT_STUDENT_RESULT=$($PSQL "INSERT INTO students(first_name,last_name,major_id,gpa) VALUES('$FIRST','$LAST',$MAJOR_ID,$GPA)")
  #check, ob wert eingetragen wurde
  if [[ $INSERT_STUDENT_RESULT == "INSERT 0 1" ]]
    then
    echo Inserted into students, $FIRST $LAST
    fi
  fi
done
