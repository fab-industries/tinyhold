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

function rle1(s,x0,y,tr)
 -- jadelombax's string-based rendering system
 local x,mw=x0,x0+ord(s,2)-96
 for i=5,#s,2do
  local col,len=ord(s,i)-96,ord(s,i+1)-96
  if(col!=tr) line(x,y,x+len-1,y,col)
  x+=len if(x>mw) x=x0 y+=1
 end
end