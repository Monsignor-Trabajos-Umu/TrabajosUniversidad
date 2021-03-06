#############################################################################
# This file is part of RSIM Utilities                                       #
#                                                                           #
######################## LICENSE TERMS AND CONDITIONS #######################
#                                                                           #
#  Copyright Notice                                                         #
#       1997 Rice University                                                #
#                                                                           #
#  1. The "Software", below, refers to RSIM (Rice Simulator for ILP         #
#  Multiprocessors) version 1.0 and includes the RSIM Simulator, the        #
#  RSIM Applications Library, Example Applications ported to RSIM,          #
#  and RSIM Utilities.  Each licensee is addressed as "you" or              #
#  "Licensee."                                                              #
#                                                                           #
#  2. Rice University is copyright holder for the RSIM Simulator and RSIM   #
#  Utilities. The copyright holders reserve all rights except those         #
#  expressly granted to the Licensee herein.                                #
#                                                                           #
#  3. Permission to use, copy, and modify the RSIM Simulator and RSIM       #
#  Utilities for any non-commercial purpose and without fee is hereby       #
#  granted provided that the above copyright notice appears in all copies   #
#  (verbatim or modified) and that both that copyright notice and this      #
#  permission notice appear in supporting documentation. All other uses,    #
#  including redistribution in whole or in part, are forbidden without      #
#  prior written permission.                                                #
#                                                                           #
#  4. The RSIM Applications Library is free software; you can               #
#  redistribute it and/or modify it under the terms of the GNU Library      #
#  General Public License as published by the Free Software Foundation;     #
#  either version 2 of the License, or (at your option) any later           #
#  version.                                                                 #
#                                                                           #
#  The Library is distributed in the hope that it will be useful, but       #
#  WITHOUT ANY WARRANTY; without even the implied warranty of               #
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU         #
#  Library General Public License for more details.                         #
#                                                                           #
#  You should have received a copy of the GNU Library General Public        #
#  License along with the Library; if not, write to the Free Software       #
#  Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307,    #
#  USA.                                                                     #
#                                                                           #
#  5. LICENSEE AGREES THAT THE EXPORT OF GOODS AND/OR TECHNICAL DATA FROM   #
#  THE UNITED STATES MAY REQUIRE SOME FORM OF EXPORT CONTROL LICENSE FROM   #
#  THE U.S.  GOVERNMENT AND THAT FAILURE TO OBTAIN SUCH EXPORT CONTROL      #
#  LICENSE MAY RESULT IN CRIMINAL LIABILITY UNDER U.S. LAWS.                #
#                                                                           #
#  6. RICE UNIVERSITY NOR ANY OF THEIR EMPLOYEES MAKE ANY WARRANTY,         #
#  EXPRESS OR IMPLIED, OR ASSUME ANY LEGAL LIABILITY OR RESPONSIBILITY      #
#  FOR THE ACCURACY, COMPLETENESS, OR USEFULNESS OF ANY INFORMATION,        #
#  APPARATUS, PRODUCT, OR PROCESS DISCLOSED AND COVERED BY A LICENSE        #
#  GRANTED UNDER THIS LICENSE AGREEMENT, OR REPRESENT THAT ITS USE WOULD    #
#  NOT INFRINGE PRIVATELY OWNED RIGHTS.                                     #
#                                                                           #
#  7. IN NO EVENT WILL RICE UNIVERSITY BE LIABLE FOR ANY DAMAGES,           #
#  INCLUDING DIRECT, INCIDENTAL, SPECIAL, OR CONSEQUENTIAL DAMAGES          #
#  RESULTING FROM EXERCISE OF THIS LICENSE AGREEMENT OR THE USE OF THE      #
#  LICENSED SOFTWARE.                                                       #
#                                                                           #
#############################################################################

BEGIN {numprocs=-1;badflag=0;}
# NOTE: BADFLAG IS FOR SCREWED UP CKP THING. FIX THIS BEFORE RELEASE....
/^STAT Processor:/ {numprocs++; issued[numprocs] = $7; graduated[numprocs] = $9;}
/^STAT Execution time:/ {exec[numprocs] = $4; if ($4 < 10000.0) badflag++;}
/^STAT ALU time:/ {if ($5 == 0) ALU_time[numprocs] = 0; else {temp = ("1" $7) - 10;ALU_time[numprocs] = temp*exec[numprocs];}}
/^STAT User 1 time:/ {if ($6 == 0) User_1_time[numprocs] = 0; else {temp = ("1" $8) - 10;User_1_time[numprocs] = temp * exec[numprocs];}}
/^STAT User 2 time:/ {if ($6 == 0) User_2_time[numprocs] = 0; else {temp = ("1" $8) - 10;User_2_time[numprocs] = temp * exec[numprocs];}}
/^STAT User 3 time:/ {if ($6 == 0) User_3_time[numprocs] = 0; else {temp = ("1" $8) - 10;User_3_time[numprocs] = temp * exec[numprocs];}}
/^STAT User 4 time:/ {if ($6 == 0) User_4_time[numprocs] = 0; else {temp = ("1" $8) - 10;User_4_time[numprocs] = temp * exec[numprocs];}}
/^STAT User 5 time:/ {if ($6 == 0) User_5_time[numprocs] = 0; else {temp = ("1" $8) - 10;User_5_time[numprocs] = temp * exec[numprocs];}}
/^STAT User 6 time:/ {if ($6 == 0) User_6_time[numprocs] = 0; else {temp = ("1" $8) - 10;User_6_time[numprocs] = temp * exec[numprocs];}}
/^STAT User 7 time:/ {if ($6 == 0) User_7_time[numprocs] = 0; else {temp = ("1" $8) - 10;User_7_time[numprocs] = temp * exec[numprocs];}}
/^STAT User 8 time:/ {if ($6 == 0) User_8_time[numprocs] = 0; else {temp = ("1" $8) - 10;User_8_time[numprocs] = temp * exec[numprocs];}}
/^STAT User 9 time:/ {if ($6 == 0) User_9_time[numprocs] = 0; else {temp = ("1" $8) - 10;User_9_time[numprocs] = temp * exec[numprocs];}}
/^STAT Barrier time:/ {if ($5 == 0) Bar__time[numprocs] = 0; else {temp = ("1" $7) - 10;Bar_time[numprocs] = temp * exec[numprocs];}}
/^STAT Spin time:/ {if ($5 == 0) Spin_time[numprocs] = 0; else {temp = ("1" $7) - 10;Spin_time[numprocs] = temp * exec[numprocs];}}
/^STAT Acquire time:/ {if ($5 == 0) Acquire_time[numprocs] = 0; else {temp = ("1" $7) - 10;Acquire_time[numprocs] = temp * exec[numprocs];}}
/^STAT Release time:/ {if ($5 == 0) Release_time[numprocs] = 0; else {temp = ("1" $7) - 10;Release_time[numprocs] = temp * exec[numprocs];}}
/^STAT RMW time:/ {if ($5 == 0) RMW_time[numprocs] = 0; else {temp = ("1" $7) - 10;RMW_time[numprocs] = temp * exec[numprocs];}}
/^STAT Write time:/ {if ($5 == 0) Write_time[numprocs] = 0; else {temp = ("1" $7) - 10;Write_time[numprocs] = temp * exec[numprocs];}}
/^STAT Read time:/ {if ($5 == 0) Read_time[numprocs] = 0; else {temp = ("1" $7) - 10;Read_time[numprocs] = temp * exec[numprocs];}}
/^STAT Branch time:/ {if ($5 == 0) Branch_time[numprocs] = 0; else {temp = ("1" $7) - 10;Branch_time[numprocs] = temp * exec[numprocs];}}
/^STAT FPU time:/ {if ($5 == 0) FPU_time[numprocs] = 0; else {temp = ("1" $7) - 10;FPU_time[numprocs] = temp * exec[numprocs];}}
/^STAT Except time:/ {if ($5 == 0) Except_time[numprocs] = 0; else {temp = ("1" $7) - 10;Except_time[numprocs] = temp * exec[numprocs];}}
/^STAT MEMBAR time:/ {if ($5 == 0) MEMBAR_time[numprocs] = 0; else {temp = ("1" $7) - 10;MEMBAR_time[numprocs] = temp * exec[numprocs];}}
/^STAT BUSY TIME:/ {if ($5 == 0) BUSY_time[numprocs] = 0; else {temp = ("1" $7) - 10;BUSY_time[numprocs] = temp * exec[numprocs];}}
/^STAT Read miss time:/ {if ($6 == 0) Read_miss_time[numprocs] = 0; else {temp = ("1" $8) - 10;Read_miss_time[numprocs] = temp * exec[numprocs];}}
/^STAT Write miss time:/ {if ($6 == 0) Write_miss_time[numprocs] = 0; else {temp = ("1" $8) - 10;Write_miss_time[numprocs] = temp * exec[numprocs];}}
/^STAT RMW miss time:/ {if ($6 == 0) RMW_miss_time[numprocs] = 0; else {temp = ("1" $8) - 10;RMW_miss_time[numprocs] = temp * exec[numprocs];}}
/^STAT Read L1 time:/ {if ($6 == 0) Read_L1_time[numprocs] = 0; else {temp = ("1" $8) - 10;Read_L1_time[numprocs] = temp * exec[numprocs];}}
/^STAT Read L2 time:/ {if ($6 == 0) Read_L2_time[numprocs] = 0; else {temp = ("1" $8) - 10;Read_L2_time[numprocs] = temp * exec[numprocs];}}
/^STAT Read localmem time:/ {if ($6 == 0) Read_localmem_time[numprocs] = 0; else {temp = ("1" $8) - 10;Read_localmem_time[numprocs] = temp * exec[numprocs];}}
/^STAT Read remotemem time:/ {if ($6 == 0) Read_remotemem_time[numprocs] = 0; else {temp = ("1" $8) - 10;Read_remotemem_time[numprocs] = temp * exec[numprocs];}}
/^STAT Write L1 time:/ {if ($6 == 0) Write_L1_time[numprocs] = 0; else {temp = ("1" $8) - 10;Write_L1_time[numprocs] = temp * exec[numprocs];}}
/^STAT Write L2 time:/ {if ($6 == 0) Write_L2_time[numprocs] = 0; else {temp = ("1" $8) - 10;Write_L2_time[numprocs] = temp * exec[numprocs];}}
/^STAT Write localmem time:/ {if ($6 == 0) Write_localmem_time[numprocs] = 0; else {temp = ("1" $8) - 10;Write_localmem_time[numprocs] = temp * exec[numprocs];}}
/^STAT Write remotemem time:/ {if ($6 == 0) Write_remotemem_time[numprocs] = 0; else {temp = ("1" $8) - 10;Write_remotemem_time[numprocs] = temp * exec[numprocs];}}
/^STAT RMW L1 time:/ {if ($6 == 0) RMW_L1_time[numprocs] = 0; else {temp = ("1" $8) - 10;RMW_L1_time[numprocs] = temp * exec[numprocs];}}
/^STAT RMW L2 time:/ {if ($6 == 0) RMW_L2_time[numprocs] = 0; else {temp = ("1" $8) - 10;RMW_L2_time[numprocs] = temp * exec[numprocs];}}
/^STAT RMW localmem time:/ {if ($6 == 0) RMW_localmem_time[numprocs] = 0; else {temp = ("1" $8) - 10;RMW_localmem_time[numprocs] = temp * exec[numprocs];}}
/^STAT RMW remotemem time:/ {if ($6 == 0) RMW_remotemem_time[numprocs] = 0; else {temp = ("1" $8) - 10;RMW_remotemem_time[numprocs] = temp * exec[numprocs];}}
/^STAT Branch prediction rate:/ {temp = ("1" $5) - 10;Branch_rate[numprocs]=temp;}
/^STAT Reads Mean \(ACT\)/ {meanread_act[numprocs]=$5;}
/^STAT Writes Mean \(ACT\)/ {meanwrite_act[numprocs]=$5;}
/^STAT RMW Mean \(ACT\)/ {meanrmw_act[numprocs]=$5;}
/^STAT Reads Mean \(EA\)/ {meanread[numprocs]=$5;}
/^STAT Writes Mean \(EA\)/ {meanwrite[numprocs]=$5;}
/^STAT RMW Mean \(EA\)/ {meanrmw[numprocs]=$5;}
/^STAT Reads Mean \(ISS\)/ {meanread_iss[numprocs]=$5;}
/^STAT Writes Mean \(ISS\)/ {meanwrite_iss[numprocs]=$5;}
/^STAT RMW Mean \(ISS\)/ {meanrmw_iss[numprocs]=$5;}
/^STAT Availability/ {temp = ("1" $3) - 10;avail[numprocs] = temp * exec[numprocs]; temp = ("1" $5) - 10;eff[numprocs] = temp*avail[numprocs]; temp = ("1" $7) - 10;util[numprocs] = temp*eff[numprocs];}
END {
  numprocs++;
  exec[numprocs] = 0;
  for (i=0;i< numprocs; i++)
    {
      if (exec[i] > exec[numprocs])
	exec[numprocs]=exec[i];
      avail[numprocs]+=avail[i];
      issued[numprocs]+=issued[i];
      graduated[numprocs]+=graduated[i];
      ALU_time[numprocs]+=ALU_time[i];
      User_1_time[numprocs]+=User_1_time[i];
      User_2_time[numprocs]+=User_2_time[i];
      User_3_time[numprocs]+=User_3_time[i];
      User_4_time[numprocs]+=User_4_time[i];
      User_5_time[numprocs]+=User_5_time[i];
      User_6_time[numprocs]+=User_6_time[i];
      User_7_time[numprocs]+=User_7_time[i];
      User_8_time[numprocs]+=User_8_time[i];
      User_9_time[numprocs]+=User_9_time[i];
      Bar_time[numprocs]+=Bar_time[i];
      Spin_time[numprocs]+=Spin_time[i];
      Acquire_time[numprocs]+=Acquire_time[i];
      Release_time[numprocs]+=Release_time[i];
      RMW_time[numprocs]+=RMW_time[i];
      Write_time[numprocs]+=Write_time[i];
      Read_time[numprocs]+=Read_time[i];
      Branch_time[numprocs]+=Branch_time[i];
      FPU_time[numprocs]+=FPU_time[i];
      Except_time[numprocs]+=Except_time[i];
      MEMBAR_time[numprocs]+=MEMBAR_time[i];
      BUSY_time[numprocs]+=BUSY_time[i];
      meanread[numprocs]+=meanread[i];
      meanwrite[numprocs]+=meanwrite[i];
      meanrmw[numprocs]+=meanrmw[i];
      meanread_act[numprocs]+=meanread_act[i];
      meanwrite_act[numprocs]+=meanwrite_act[i];
      meanrmw_act[numprocs]+=meanrmw_act[i];
      meanread_iss[numprocs]+=meanread_iss[i];
      meanwrite_iss[numprocs]+=meanwrite_iss[i];
      meanrmw_iss[numprocs]+=meanrmw_iss[i];
      Read_miss_time[numprocs] += Read_miss_time[i];
      Write_miss_time[numprocs] += Write_miss_time[i];
      RMW_miss_time[numprocs] += RMW_miss_time[i];
      Read_L1_time[numprocs] += Read_L1_time[i];
      Read_L2_time[numprocs] += Read_L2_time[i];
      Read_localmem_time[numprocs] += Read_localmem_time[i];
      Read_remotemem_time[numprocs] += Read_remotemem_time[i];
      Write_L1_time[numprocs] += Write_L1_time[i];
      Write_L2_time[numprocs] += Write_L2_time[i];
      Write_localmem_time[numprocs] += Write_localmem_time[i];
      Write_remotemem_time[numprocs] += Write_remotemem_time[i];
      RMW_L1_time[numprocs] += RMW_L1_time[i];
      RMW_L2_time[numprocs] += RMW_L2_time[i];
      RMW_localmem_time[numprocs] += RMW_localmem_time[i];
      RMW_remotemem_time[numprocs] += RMW_remotemem_time[i];
    }

  np = numprocs-badflag;



#FIX BADFLAG BEFORE RELEASE
  
  execmean=exec[numprocs];
  gradmean=graduated[numprocs]/np;
  ALU_time[numprocs]/=np*execmean;
  User_1_time[numprocs]/=np*execmean;
  User_2_time[numprocs]/=np*execmean;
  User_3_time[numprocs]/=np*execmean;
  User_4_time[numprocs]/=np*execmean;
  User_5_time[numprocs]/=np*execmean;
  User_6_time[numprocs]/=np*execmean;
  User_7_time[numprocs]/=np*execmean;
  User_8_time[numprocs]/=np*execmean;
  User_9_time[numprocs]/=np*execmean;
  Spin_time[numprocs]/=np*execmean;
  Bar_time[numprocs]/=np*execmean;
  Acquire_time[numprocs]/=np*execmean;
  Release_time[numprocs]/=np*execmean;
  RMW_time[numprocs]/=np*execmean;
  Write_time[numprocs]/=np*execmean;
  Read_time[numprocs]/=np*execmean;
  Branch_time[numprocs]/=np*execmean;
  FPU_time[numprocs]/=np*execmean;
  Except_time[numprocs]/=np*execmean;
  MEMBAR_time[numprocs]/=np*execmean;
  BUSY_time[numprocs]/=np*execmean;
  eff[numprocs]= issued[numprocs]/avail[numprocs];
  util[numprocs]= graduated[numprocs]/issued[numprocs];
  avail[numprocs]/=np*execmean;
  
  meanread[numprocs]/=numprocs;
  meanwrite[numprocs]/=numprocs;
  meanrmw[numprocs]/=numprocs;

  meanread_act[numprocs]/=numprocs;
  meanwrite_act[numprocs]/=numprocs;
  meanrmw_act[numprocs]/=numprocs;

  meanread_iss[numprocs]/=numprocs;
  meanwrite_iss[numprocs]/=numprocs;
  meanrmw_iss[numprocs]/=numprocs;

  Read_miss_time[numprocs]/=np*execmean;
  Write_miss_time[numprocs]/=np*execmean;
  RMW_miss_time[numprocs]/=np*execmean;

  Read_L1_time[numprocs] /= np*execmean;
  Read_L2_time[numprocs] /= np*execmean;
  Read_localmem_time[numprocs] /= np*execmean;
  Read_remotemem_time[numprocs] /= np*execmean;

  Write_L1_time[numprocs] /= np*execmean;
  Write_L2_time[numprocs] /= np*execmean;
  Write_localmem_time[numprocs] /= np*execmean;
  Write_remotemem_time[numprocs] /= np*execmean;

  RMW_L1_time[numprocs] /= np*execmean;
  RMW_L2_time[numprocs] /= np*execmean;
  RMW_localmem_time[numprocs] /= np*execmean;
  RMW_remotemem_time[numprocs] /= np*execmean;
  
  printf("\n%-10sIPC\tBusy\tAcq\tRel\tRead\tWrite\tRMW\tSpin\tBarrier\n","Exec time");
  printf("%-10.3g%.3f\t%.2f\t%.2f\t%.2f\t%.2f\t%.2f\t%.2f\t%.2f\t%.2f\n\n",
	 execmean,gradmean/execmean,
	 (ALU_time[numprocs]+FPU_time[numprocs]+Branch_time[numprocs]+BUSY_time[numprocs])*100.0,
	 Acquire_time[numprocs]*100.0, Release_time[numprocs]*100.0,
	 Read_time[numprocs]*100.0,
	 Write_time[numprocs]*100.0,
	 RMW_time[numprocs]*100.0,
	 Spin_time[numprocs]*100.0,
	 Bar_time[numprocs]*100.0);

  printf("USER:\t1\t2\t3\t4\t5\t6\t7\t8\t9\n");
  printf("USER:\t%.2f\t%.2f\t%.2f\t%.2f\t%.2f\t%.2f\t%.2f\t%.2f\t%.2f\n\n",
	 User_1_time[numprocs]*100.0,
	 User_2_time[numprocs]*100.0,
	 User_3_time[numprocs]*100.0,
	 User_4_time[numprocs]*100.0,
	 User_5_time[numprocs]*100.0,
	 User_6_time[numprocs]*100.0,
	 User_7_time[numprocs]*100.0,
	 User_8_time[numprocs]*100.0,
	 User_9_time[numprocs]*100.0);

  printf("\tRead L1 =\t%.2f\tWrite L1 =\t%.2f\tRMW L1 =\t%.2f\n",Read_L1_time[numprocs]*100.0,
	 Write_L1_time[numprocs]*100.0,RMW_L1_time[numprocs]*100.0);
  printf("\tRead L2 =\t%.2f\tWrite L2 =\t%.2f\tRMW L2 =\t%.2f\n",Read_L2_time[numprocs]*100.0,
	 Write_L2_time[numprocs]*100.0,RMW_L2_time[numprocs]*100.0);
  printf("\tRead local =\t%.2f\tWrite local =\t%.2f\tRMW remote =\t%.2f\n",Read_localmem_time[numprocs]*100.0,
	 Write_localmem_time[numprocs]*100.0,RMW_localmem_time[numprocs]*100.0);
  printf("\tRead remote =\t%.2f\tWrite remote =\t%.2f\tRMW remote =\t%.2f\n\n",Read_remotemem_time[numprocs]*100.0,
	 Write_remotemem_time[numprocs]*100.0,RMW_remotemem_time[numprocs]*100.0);
  printf("LAT   :\tRD\tWT\tRMW\n");
  printf("Addr  :\t%.2f\t%.2f\t%.2f\n\n",meanread[numprocs],meanwrite[numprocs],meanrmw[numprocs]);
  printf("Issue :\t%.2f\t%.2f\t%.2f\n\n",meanread_iss[numprocs],meanwrite_iss[numprocs],meanrmw_iss[numprocs]);
  printf("Active:\t%.2f\t%.2f\t%.2f\n\n",meanread_act[numprocs],meanwrite_act[numprocs],meanrmw_act[numprocs]);

  printf("BUSY=%.2f\tALU=%.2f\tFPU=%.2f\tBRU=%.2f\n",BUSY_time[numprocs]*100.0,ALU_time[numprocs]*100.0,FPU_time[numprocs]*100.0,Branch_time[numprocs]*100.0);
  printf("READ MISS=%.2f\tWRITE MISS=%.2f\tRMW MISS=%.2f\n",Read_miss_time[numprocs]*100.0,
	 Write_miss_time[numprocs]*100.0,RMW_miss_time[numprocs]*100.0);

  
  printf("Avail=%.3f\tEff=%.3f\tUtil=%.3f\n\n",avail[numprocs],eff[numprocs],util[numprocs]);
  printf("----------------------------------------------------------------\n");

  if (0)
    {
      printf("Busy times distribution\n");
      for(i=0;i<numprocs;i++){
	temp = ((ALU_time[i] + FPU_time[i])/execmean)*100.0;
	printf("Processor %3d: \t",i);
	for(j=0;j<temp;j+=2.5)
	  printf("*");
	printf("\n");
      }
    }
}


