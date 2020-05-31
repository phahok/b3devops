cas auto authinfo="/home/sas/.authinfo" host='sasviyahost.ec2.internal' port=5570 sessopts=(caslib=casuser timeout=1800 locale="en_US");
caslib _ALL_ assign;


proc casutil;
	LIST tables incaslib="PUBLIC";
run;