cas auto authinfo="/home/sas/.authinfo" host='sasviyahost.ec2.internal' port=5570 sessopts=(caslib=casuser timeout=1800 locale="en_US");
caslib _ALL_ assign;


proc cas;
/* Checar se a tabela existe */
 table.tableexists result=r / /* 2 */
 caslib='PUBLIC'
 name='HMEQ_SCORED';
 run;
	if (r.exists) then do; /* 3 */ 
			table.dropTable result=r
			caslib="PUBLIC"
			name="HMEQ_SCORED";
	end;
quit;

/*---------------------------------------------------------
  The options statement below should be placed
  before the data step when submitting this code.
---------------------------------------------------------*/
options VALIDMEMNAME=EXTEND VALIDVARNAME=ANY;
   /*------------------------------------------
   Generated SAS Scoring Code
     Date             : 27May2020:13:15:43
     Locale           : en_US
     Model Type       : Decision Tree
     Interval variable: CLNO
     Interval variable: DEBTINC
     Interval variable: DELINQ
     Interval variable: DEROG
     Interval variable: NINQ
     Interval variable: VALUE
     Interval variable: YOJ
     Class variable   : JOB
     Class variable   : REASON
     Class variable   : BAD
     Response variable: BAD
     ------------------------------------------*/
   /*---------------------------------------------------------
   SAS Code Generated by Cloud Analytic Services for Decision Tree
     Date                  : 27May2020:13:15:43 UTC
     Number of Nodes       : 37
     Number of Tree Depth  : 6
     Number of Bins        : 50
     Number of Obs         : 5960
     -------------------------------------------------------*/
data PUBLIC.HMEQ_SCORED;
set PUBLIC.HMEQ_TRATADA;

   length _strfmt_ $7; drop _strfmt_;
   _strfmt_ = ' ';

   array _tlevname_36_{2} $32 _temporary_ ( '                               0' 
   '                               1');

   array _dt_fi_36_{2} _temporary_;

   _node_id_ =  0;
   _new_id_  = -1;
   nextnode_36:
   if _node_id_ eq 0 then do;
         _numval_ = DEBTINC;
         if missing(_numval_) then do;
            _node_id_ = 1;
            goto nextnode_36;
         end;
         if (_numval_ ge 444526708996157 and _numval_ lt 916125999771303) then do;

            _new_id_ = 1;
         end;
         else if (_numval_ ge 190124463658 and _numval_ lt 444526708996157) then do;

            _new_id_ = 2;
         end;
         else if (_numval_ lt 190124463658) then do;
            _new_id_ = 2;
         end;
         else if (_numval_ ge 916125999771303) then do;
            _new_id_ = 1;
         end;
         else do;
         _new_id_ = 2;
         end;
   end;
   else if _node_id_ eq 1 then do;
         _numval_ = DELINQ;
         if missing(_numval_) then do;
            _node_id_ = 4;
            goto nextnode_36;
         end;
         if (_numval_ ge 1 and _numval_ lt 15) then do;

            _new_id_ = 3;
         end;
         else if (_numval_ ge 0 and _numval_ lt 1) then do;

            _new_id_ = 4;
         end;
         else if (_numval_ lt 0) then do;
            _new_id_ = 4;
         end;
         else if (_numval_ ge 15) then do;
            _new_id_ = 3;
         end;
         else do;
         _new_id_ = 4;
         end;
   end;
   else if _node_id_ eq 2 then do;
         _numval_ = DELINQ;
         if missing(_numval_) then do;
            _node_id_ = 6;
            goto nextnode_36;
         end;
         if (_numval_ ge 2 and _numval_ lt 15) then do;

            _new_id_ = 5;
         end;
         else if (_numval_ ge 0 and _numval_ lt 2) then do;

            _new_id_ = 6;
         end;
         else if (_numval_ lt 0) then do;
            _new_id_ = 6;
         end;
         else if (_numval_ ge 15) then do;
            _new_id_ = 5;
         end;
         else do;
         _new_id_ = 6;
         end;
   end;
   else if _node_id_ eq 3 then do;
         _numval_ = VALUE;
         if missing(_numval_) then do;
            _node_id_ = 8;
            goto nextnode_36;
         end;
         if (_numval_ ge 30808.92 and _numval_ lt 9439407) then do;

            _new_id_ = 7;
         end;
         else if (_numval_ ge 8000 and _numval_ lt 30808.92) then do;

            _new_id_ = 8;
         end;
         else if (_numval_ lt 8000) then do;
            _new_id_ = 8;
         end;
         else if (_numval_ ge 9439407) then do;
            _new_id_ = 7;
         end;
         else do;
         _new_id_ = 7;
         end;
   end;
   else if _node_id_ eq 4 then do;
         _numval_ = DEROG;
         if missing(_numval_) then do;
            _node_id_ = 10;
            goto nextnode_36;
         end;
         if (_numval_ ge 1 and _numval_ lt 10) then do;

            _new_id_ = 9;
         end;
         else if (_numval_ ge 0 and _numval_ lt 1) then do;

            _new_id_ = 10;
         end;
         else if (_numval_ lt 0) then do;
            _new_id_ = 10;
         end;
         else if (_numval_ ge 10) then do;
            _new_id_ = 9;
         end;
         else do;
         _new_id_ = 10;
         end;
   end;
   else if _node_id_ eq 5 then do;
         _numval_ = DEROG;
         if missing(_numval_) then do;
            _node_id_ = 12;
            goto nextnode_36;
         end;
         if (_numval_ ge 0 and _numval_ lt 10) then do;

            _new_id_ = 11;
         end;
         else if (_numval_ ge 0 and _numval_ lt 0) then do;

            _new_id_ = 12;
         end;
         else if (_numval_ lt 0) then do;
            _new_id_ = 11;
         end;
         else if (_numval_ ge 10) then do;
            _new_id_ = 11;
         end;
         else do;
         _new_id_ = 11;
         end;
   end;
   else if _node_id_ eq 6 then do;
         _numval_ = CLNO;
         if missing(_numval_) then do;
            _node_id_ = 13;
            goto nextnode_36;
         end;
         if (_numval_ ge 9 and _numval_ lt 71) then do;

            _new_id_ = 13;
         end;
         else if (_numval_ ge 0 and _numval_ lt 9) then do;

            _new_id_ = 14;
         end;
         else if (_numval_ lt 0) then do;
            _new_id_ = 14;
         end;
         else if (_numval_ ge 71) then do;
            _new_id_ = 13;
         end;
         else do;
         _new_id_ = 13;
         end;
   end;
   else if _node_id_ eq 7 then do;
         _numval_ = DEROG;
         if missing(_numval_) then do;
            _node_id_ = 16;
            goto nextnode_36;
         end;
         if (_numval_ ge 0 and _numval_ lt 10) then do;

            _new_id_ = 15;
         end;
         else if (_numval_ ge 0 and _numval_ lt 0) then do;

            _new_id_ = 16;
         end;
         else if (_numval_ lt 0) then do;
            _new_id_ = 15;
         end;
         else if (_numval_ ge 10) then do;
            _new_id_ = 15;
         end;
         else do;
         _new_id_ = 15;
         end;
   end;
   else if _node_id_ eq 8 then do;
         _leaf_id_ = 8;
         _new_id_ = -1;
         _dt_pred_lev_ = 1;
         _dt_pred_prob_ =     0.98571428571428;
         _dt_fi_36_{1} =     0.01428571428571; 
         _dt_fi_36_{2} =     0.98571428571428; 
   end;
   else if _node_id_ eq 9 then do;
         _numval_ = NINQ;
         if missing(_numval_) then do;
            _node_id_ = 18;
            goto nextnode_36;
         end;
         if (_numval_ ge 0 and _numval_ lt 17) then do;

            _new_id_ = 17;
         end;
         else if (_numval_ ge 0 and _numval_ lt 0) then do;

            _new_id_ = 18;
         end;
         else if (_numval_ lt 0) then do;
            _new_id_ = 17;
         end;
         else if (_numval_ ge 17) then do;
            _new_id_ = 17;
         end;
         else do;
         _new_id_ = 17;
         end;
   end;
   else if _node_id_ eq 10 then do;
         _numval_ = CLNO;
         if missing(_numval_) then do;
            _node_id_ = 20;
            goto nextnode_36;
         end;
         if (_numval_ ge 6 and _numval_ lt 71) then do;

            _new_id_ = 19;
         end;
         else if (_numval_ ge 0 and _numval_ lt 6) then do;

            _new_id_ = 20;
         end;
         else if (_numval_ lt 0) then do;
            _new_id_ = 20;
         end;
         else if (_numval_ ge 71) then do;
            _new_id_ = 19;
         end;
         else do;
         _new_id_ = 19;
         end;
   end;
   else if _node_id_ eq 11 then do;
         _numval_ = VALUE;
         if missing(_numval_) then do;
            _node_id_ = 21;
            goto nextnode_36;
         end;
         if (_numval_ ge 157354.36 and _numval_ lt 9439407) then do;

            _new_id_ = 21;
         end;
         else if (_numval_ ge 8000 and _numval_ lt 157354.36) then do;

            _new_id_ = 22;
         end;
         else if (_numval_ lt 8000) then do;
            _new_id_ = 22;
         end;
         else if (_numval_ ge 9439407) then do;
            _new_id_ = 21;
         end;
         else do;
         _new_id_ = 22;
         end;
   end;
   else if _node_id_ eq 12 then do;
         _leaf_id_ = 12;
         _new_id_ = -1;
         _dt_pred_lev_ = 0;
         _dt_pred_prob_ =     0.98039215686274;
         _dt_fi_36_{1} =     0.98039215686274; 
         _dt_fi_36_{2} =     0.01960784313725; 
   end;
   else if _node_id_ eq 13 then do;
         _numval_ = VALUE;
         if missing(_numval_) then do;
            _node_id_ = 24;
            goto nextnode_36;
         end;
         if (_numval_ ge 8000 and _numval_ lt 9439407) then do;

            _new_id_ = 23;
         end;
         else if (_numval_ lt 8000) then do;
            _new_id_ = 23;
         end;
         else if (_numval_ ge 9439407) then do;
            _new_id_ = 23;
         end;
         else do;
         _new_id_ = 23;
         end;
   end;
   else if _node_id_ eq 14 then do;
         _strfmt_ = left(trim(put(JOB,$7.)));
         if _strfmt_ in ('Self',
         'Office',
         'Other',
         '',
         'Sales',
         'Mgr') then do;

         _new_id_ = 25;
         end;
         else if _strfmt_ in ('ProfExe') then do;

         _new_id_ = 26;
         end;
         else do;
         _new_id_ = 25;
         end;
   end;
   else if _node_id_ eq 15 then do;
         _leaf_id_ = 15;
         _new_id_ = -1;
         _dt_pred_lev_ = 1;
         _dt_pred_prob_ =     0.83333333333333;
         _dt_fi_36_{1} =     0.16666666666666; 
         _dt_fi_36_{2} =     0.83333333333333; 
   end;
   else if _node_id_ eq 16 then do;
         _numval_ = VALUE;
         if missing(_numval_) then do;
            _numval_ = -1.7976931348623E308;
         end;
         if (_numval_ ge 72000 and _numval_ lt 9439407) then do;

            _new_id_ = 27;
         end;
         else if (_numval_ ge 8000 and _numval_ lt 72000) then do;

            _new_id_ = 28;
         end;
         else if (_numval_ lt 8000) then do;
            _new_id_ = 28;
         end;
         else if (_numval_ ge 9439407) then do;
            _new_id_ = 27;
         end;
         else do;
         _new_id_ = 27;
         end;
   end;
   else if _node_id_ eq 17 then do;
         _leaf_id_ = 17;
         _new_id_ = -1;
         _dt_pred_lev_ = 1;
         _dt_pred_prob_ =     0.78873239436619;
         _dt_fi_36_{1} =      0.2112676056338; 
         _dt_fi_36_{2} =     0.78873239436619; 
   end;
   else if _node_id_ eq 18 then do;
         _leaf_id_ = 18;
         _new_id_ = -1;
         _dt_pred_lev_ = 0;
         _dt_pred_prob_ =                    1;
         _dt_fi_36_{1} =                    1; 
         _dt_fi_36_{2} =                    0; 
   end;
   else if _node_id_ eq 19 then do;
         _numval_ = YOJ;
         if missing(_numval_) then do;
            _node_id_ = 29;
            goto nextnode_36;
         end;
         if (_numval_ ge 7 and _numval_ lt 300) then do;

            _new_id_ = 29;
         end;
         else if (_numval_ ge 1 and _numval_ lt 7) then do;

            _new_id_ = 30;
         end;
         else if (_numval_ lt 1) then do;
            _new_id_ = 30;
         end;
         else if (_numval_ ge 300) then do;
            _new_id_ = 29;
         end;
         else do;
         _new_id_ = 29;
         end;
   end;
   else if _node_id_ eq 20 then do;
         _strfmt_ = left(trim(put(JOB,$7.)));
         if _strfmt_ in ('Self',
         'Office',
         'Other',
         'ProfExe',
         'Mgr') then do;

         _new_id_ = 31;
         end;
         else if _strfmt_ in ('') then do;

         _new_id_ = 32;
         end;
         else do;
         _new_id_ = 31;
         end;
   end;
   else if _node_id_ eq 21 then do;
         _leaf_id_ = 21;
         _new_id_ = -1;
         _dt_pred_lev_ = 1;
         _dt_pred_prob_ =                    1;
         _dt_fi_36_{1} =                    0; 
         _dt_fi_36_{2} =                    1; 
   end;
   else if _node_id_ eq 22 then do;
         _numval_ = DELINQ;
         if missing(_numval_) then do;
            _numval_ = -1.7976931348623E308;
         end;
         if (_numval_ ge 4 and _numval_ lt 15) then do;

            _new_id_ = 33;
         end;
         else if (_numval_ ge 0 and _numval_ lt 4) then do;

            _new_id_ = 34;
         end;
         else if (_numval_ lt 0) then do;
            _new_id_ = 34;
         end;
         else if (_numval_ ge 15) then do;
            _new_id_ = 33;
         end;
         else do;
         _new_id_ = 34;
         end;
   end;
   else if _node_id_ eq 23 then do;
         _leaf_id_ = 23;
         _new_id_ = -1;
         _dt_pred_lev_ = 0;
         _dt_pred_prob_ =     0.95142714071106;
         _dt_fi_36_{1} =     0.95142714071106; 
         _dt_fi_36_{2} =     0.04857285928893; 
   end;
   else if _node_id_ eq 24 then do;
         _numval_ = YOJ;
         if missing(_numval_) then do;
            _node_id_ = 36;
            goto nextnode_36;
         end;
         if (_numval_ ge 1 and _numval_ lt 300) then do;

            _new_id_ = 35;
         end;
         else if (_numval_ ge 1 and _numval_ lt 1) then do;

            _new_id_ = 36;
         end;
         else if (_numval_ lt 1) then do;
            _new_id_ = 35;
         end;
         else if (_numval_ ge 300) then do;
            _new_id_ = 35;
         end;
         else do;
         _new_id_ = 35;
         end;
   end;
   else if _node_id_ eq 25 then do;
         _leaf_id_ = 25;
         _new_id_ = -1;
         _dt_pred_lev_ = 0;
         _dt_pred_prob_ =     0.85714285714285;
         _dt_fi_36_{1} =     0.85714285714285; 
         _dt_fi_36_{2} =     0.14285714285714; 
   end;
   else if _node_id_ eq 26 then do;
         _leaf_id_ = 26;
         _new_id_ = -1;
         _dt_pred_lev_ = 1;
         _dt_pred_prob_ =                    1;
         _dt_fi_36_{1} =                    0; 
         _dt_fi_36_{2} =                    1; 
   end;
   else if _node_id_ eq 27 then do;
         _leaf_id_ = 27;
         _new_id_ = -1;
         _dt_pred_lev_ = 1;
         _dt_pred_prob_ =                  0.6;
         _dt_fi_36_{1} =                  0.4; 
         _dt_fi_36_{2} =                  0.6; 
   end;
   else if _node_id_ eq 28 then do;
         _leaf_id_ = 28;
         _new_id_ = -1;
         _dt_pred_lev_ = 0;
         _dt_pred_prob_ =                    1;
         _dt_fi_36_{1} =                    1; 
         _dt_fi_36_{2} =                    0; 
   end;
   else if _node_id_ eq 29 then do;
         _leaf_id_ = 29;
         _new_id_ = -1;
         _dt_pred_lev_ = 0;
         _dt_pred_prob_ =               0.6625;
         _dt_fi_36_{1} =               0.6625; 
         _dt_fi_36_{2} =               0.3375; 
   end;
   else if _node_id_ eq 30 then do;
         _leaf_id_ = 30;
         _new_id_ = -1;
         _dt_pred_lev_ = 1;
         _dt_pred_prob_ =     0.59905660377358;
         _dt_fi_36_{1} =     0.40094339622641; 
         _dt_fi_36_{2} =     0.59905660377358; 
   end;
   else if _node_id_ eq 31 then do;
         _leaf_id_ = 31;
         _new_id_ = -1;
         _dt_pred_lev_ = 1;
         _dt_pred_prob_ =                0.875;
         _dt_fi_36_{1} =                0.125; 
         _dt_fi_36_{2} =                0.875; 
   end;
   else if _node_id_ eq 32 then do;
         _leaf_id_ = 32;
         _new_id_ = -1;
         _dt_pred_lev_ = 0;
         _dt_pred_prob_ =                 0.72;
         _dt_fi_36_{1} =                 0.72; 
         _dt_fi_36_{2} =                 0.28; 
   end;
   else if _node_id_ eq 33 then do;
         _leaf_id_ = 33;
         _new_id_ = -1;
         _dt_pred_lev_ = 1;
         _dt_pred_prob_ =              0.59375;
         _dt_fi_36_{1} =              0.40625; 
         _dt_fi_36_{2} =              0.59375; 
   end;
   else if _node_id_ eq 34 then do;
         _leaf_id_ = 34;
         _new_id_ = -1;
         _dt_pred_lev_ = 0;
         _dt_pred_prob_ =     0.81395348837209;
         _dt_fi_36_{1} =     0.81395348837209; 
         _dt_fi_36_{2} =      0.1860465116279; 
   end;
   else if _node_id_ eq 35 then do;
         _leaf_id_ = 35;
         _new_id_ = -1;
         _dt_pred_lev_ = 1;
         _dt_pred_prob_ =                    1;
         _dt_fi_36_{1} =                    0; 
         _dt_fi_36_{2} =                    1; 
   end;
   else if _node_id_ eq 36 then do;
         _leaf_id_ = 36;
         _new_id_ = -1;
         _dt_pred_lev_ = 0;
         _dt_pred_prob_ =                    1;
         _dt_fi_36_{1} =                    1; 
         _dt_fi_36_{2} =                    0; 
   end;
   if _new_id_ >= 0 then do;
       _node_id_ = _new_id_;
      goto nextnode_36;
   end;

   I_BAD = _tlevname_36_{_dt_pred_lev_+1};
   label I_BAD = 'Into: BAD';
   _i_ = 1;
   _dt_predp_ = _dt_fi_36_{_i_};
   P_BAD0 = _dt_predp_;
   label P_BAD0 = 'Predicted: BAD=0';
   _i_+1;
   _dt_predp_ = _dt_fi_36_{_i_};
   P_BAD1 = _dt_predp_;
   label P_BAD1 = 'Predicted: BAD=1';
   _i_+1;
   drop _dt_predp_;
   drop _i_;
   drop _dt_pred_lev_;
   drop _dt_pred_prob_;
   drop _numval_;
   drop _node_id_;
   drop _new_id_;
   /*------------------------------------------*/
   /*_VA_DROP*/ drop 'I_BAD'n '_leaf_id_'n 'P_BAD0'n 'P_BAD1'n;
length 'I_BAD_36_2'n $32;
      'I_BAD_36_2'n='I_BAD'n;
'P_BAD0_36_2'n='P_BAD0'n;
'P_BAD1_36_2'n='P_BAD1'n;
'_leaf_id__36_2'n='_leaf_id_'n;
   /*------------------------------------------*/
run;

/* Escopo global*/
proc casutil incaslib="PUBLIC" outcaslib="PUBLIC";                         /* 2 */
   promote casdata="HMEQ_SCORED";
quit;