-- cursor code

function make_cursor()
 c={}
 c.x=3
 c.y=2
 c.sprite=16
end

function draw_cursor()
  spr(c.sprite,c.x*8,c.y*8)
end

function move_cursor()
 newx=c.x
 newy=c.y
 
 if (btnp(⬅️)) newx-=1
 if (btnp(➡️)) newx+=1
 if (btnp(⬆️)) newy-=1
 if (btnp(⬇️)) newy+=1
 
 c.x=mid(0,newx,128)
 c.y=mid(0,newy,64)
 
 if (is_tile(building,c.x,c.y)) then
  -- turn cursor yellow if on
  -- building tile
  c.sprite=32
 elseif (is_tile(impass,c.x,c.y)) then
  -- if tile is impassable
  c.sprite=32
 else
  c.sprite=16
 end
 
end

-- interface code

function draw_ui()
 camera()
 rectfill(0,112,127,127,15)
 
 gp="28"
 
 if gt_day<10 then
  print(gt_day.." "..mnth[gt_mth].." "..gt_yrs,6,114,4)
 else
  print(gt_day.." "..mnth[gt_mth].." "..gt_yrs,2,114,4)
 end
 
 print("⌂"..houses.." 😐7 ♥+5",79,114,4)
 print("12   20   14   0",10,121,4)
 spr(10,2,121,1,1)
 spr(26,22,121,1,1)
 spr(42,42,121,1,1)
 spr(58,62,121,1,1)
end