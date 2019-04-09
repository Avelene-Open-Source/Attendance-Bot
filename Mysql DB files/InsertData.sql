use uniDb;

#Populating Student details

# Computer Science 
INSERT INTO cse_students
  (srn,name,semester,section,branch)
VALUES
  ('R15CS019', 'Ajith Shenoy', 8 ,'A','CSE'),
  ('R15CS022', 'Akash Sharma', 6 ,'F','CSE'),
  ('R15CS024', 'Akshay GV', 4, 'A','CSE'),
  ('R15CS025', 'Akshay Rajan', 5 ,'A','CSE');
  
#ce_students , civil student details
INSERT INTO ce_students
  (srn,name,semester,section)
VALUES
  ('R15CE011', 'Prateek Shinde', 6 ,'A'),
  ('R15CE072', 'Kuldeep Shetty', 4 ,'A'),
  ('R15CE154', 'Trisha Reddy', 8 , 'A'),
  ('R15CE125', 'Matthew Perry', 8 ,'A'),
  ('R15CE009', 'Prateek Shinde', 6 ,'A')
  ;
  
#ece_students , electronic and communication
INSERT INTO ece_students
  (srn,name,semester,section)
VALUES
  ('R15EC001','Disha Patil', 6 ,'C'),
  ('R15EC079', 'Deep Sagar', 4 ,'A'),
  ('R15EC554', 'Ganesh Gaitonde', 8 , 'B'),
  ('R15EC235', 'Mohammed Iqbal', 8 ,'F'),
  ('R15EC109', 'Carolina Chaterjee', 6 ,'E')
  ;
  
#eee_students , EEE students
INSERT INTO eee_students
  (srn,name,semester,section)
VALUES
  ('R15EE006','Prema Prabhu', 6 ,'C'),
  ('R15EE009', 'Deepika Sangarkar', 4 ,'A'),
  ('R15EE504', 'Neerav Modi', 8 , 'B'),
  ('R15EE285', 'Mohammed Azar', 8 ,'F'),
  ('R15EE159', 'Kaustub Banarjee', 6 ,'E')
  ;
  
#me_students , mechanical 
INSERT INTO me_students
  (srn,name,semester,section)
VALUES
  ('R15ME016','Khushbu Patekar', 6 ,'C'),
  ('R15ME019', 'Neela Bhat ', 4 ,'A'),
  ('R15ME104', 'Pratiksha Nayak', 8 , 'B'),
  ('R15ME185', 'Masood Pasha', 8 ,'F'),
  ('R15ME199', 'Kaustub Banarjee', 6 ,'E')
  ;
  
# Attendance 

#CSE attendance
INSERT INTO cse_attendance
  (srn,days_attended,days_total)
VALUES
  ('R15CS019',58,180),
  ('R15CS022',168,180),
  ('R15CS024',108,180),
  ('R15CS025',078,180);
  
#ECE attendance 
INSERT INTO ece_attendance
  (srn,days_attended,days_total)
VALUES
  ('R15EC001',108,180),
  ('R15EC079',120,180),
  ('R15EC554',169,180),
  ('R15EC235',171,180),
  ('R15EC109',100,180)
  ;
  
  #Mechanical  attendance 
  INSERT INTO me_attendance
  (srn,days_attended,days_total)
  VALUES
  ('R15ME016',098,180),
  ('R15ME019',155,180),
  ('R15ME104',128,180),
  ('R15ME185',178,180),
  ('R15ME199',075,180)
  ;
  
#EEE
INSERT INTO eee_attendance
(srn,days_attended,days_total)
VALUES
  ('R15EE006',008,180),
  ('R15EE009',068,180),
  ('R15EE504',128,180),
  ('R15EE285',178,180),
  ('R15EE159',166,180);
  
#Civil Attendance 
INSERT INTO ce_attendance
	(srn,days_attended,days_total)
VALUES
  ('R15CE011',128,180),
  ('R15CE072',118,180),
  ('R15CE154',168,180),
  ('R15CE125',38,180),
  ('R15CE009',98,180);

# latest updates filled
 INSERT INTO latest_update
 (date_issued,content,branch,expiry)
 VALUES
 ('2019-04-01',"Final end semester examination to be held on 24-05-2019 for all engineering branches","UNI",'2019-05-25 00:00:00'),
 ('2019-04-02',"All students are requested to fill up feedback forms","UNI",'2019-04-25 00:00:00'),
 ('2019-02-07',"Project demonstration for Electrical dept on 21st of this month","EEE",'2019-02-20 00:00:00'),
 ('2019-01-20',"Sports day selection for CS dept on 23rd january","CSE",'2019-01-22 00:00:00'),
 ('2019-03-14',"Industrial visit to GRE,Bangalore for mechanical department  on 21st march","ME",'2019-03-20 00:00:00'),
 ('2019-04-02',"ECE students of REVA University are requested to present papers to their respective guides","ECE",'2019-04-20 00:00:00'),
 ('2019-01-02',"Teachers of Civil dept requested to prepare respective class students for placements","CE",'2019-05-20 00:00:00');
  
  
  

