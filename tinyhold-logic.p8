-- game logic

function adv_time()
 if t%30==0 then
  gt_hrs+=1
 end
 
 if gt_hrs>=24 then
  gt_hrs=0
  gt_day+=1
  save_state()
 end
 
 if gt_day>=31 then
  gt_day=1
  if gt_mth==12 then
   gt_mth=1
   gt_yrs+=1
  else
   gt_mth+=1
  end
 end
 
end