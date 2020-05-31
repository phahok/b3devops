cas auto authinfo="/home/sas/.authinfo" host='sasviyahost.ec2.internal' port=5570 sessopts=(caslib=casuser timeout=1800 locale="en_US");
caslib _ALL_ assign;

proc cas;
/* Checar se a tabela existe */
 table.tableexists result=r / /* 2 */
 caslib='PUBLIC'
 name='HMEQ_TRATADA';
 run;
	if (r.exists) then do; /* 3 */ 
			table.dropTable result=r
			caslib="PUBLIC"
			name="HMEQ_TRATADA";
	end;
quit;


*Adiciono +1 em year of job;
data public.HMEQ_TRATADA;
set public.HMEQ;
YOJ = YOJ +1;
run;

proc casutil incaslib="PUBLIC" outcaslib="PUBLIC";                         /* 2 */
   promote casdata="HMEQ_TRATADA";
quit;