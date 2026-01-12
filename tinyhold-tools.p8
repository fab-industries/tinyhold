-- tools

function hctxt(s,y,c)

  --print string off screen to get width
  local w = print(s, 0, -10)

  --print cenred using width
  print(s, 64-w/2, y,c)

end

function save_state()

 local state='day:'..gt_day..', '.. 'houses: '..houses
 printh(state,'tinyhold_state.txt',true)

end