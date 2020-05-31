cas auto authinfo="/home/sas/.authinfo" host='sasviyahost.ec2.internal' port=5570 sessopts=(caslib=casuser timeout=1800 locale="en_US");
caslib _ALL_ assign;

proc cas;
/* Checar se a tabela existe */
 table.tableexists result=r / /* 2 */
 caslib='PUBLIC'
 name='HMEQ';
 run;
	if (r.exists) then do; /* 3 */ 
			table.dropTable result=r
			caslib="PUBLIC"
			name="HMEQ";
	end;
quit;


/* Promoting to CAS  */
proc casutil;
                load file="/opt/sas/viya/config/data/cas/default/public/HMEQ.sashdat" incaslib="PUBLIC" 
                outcaslib="PUBLIC" casout="HMEQ" promote;
run;