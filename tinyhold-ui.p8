-- cursor code

function make_cursor()
 c={}
 c.x=10
 c.y=10
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
 
 c.x=mid(0,newx,31)
 c.y=mid(0,newy,25)

 cursor_col()

end

function cursor_col()

  -- white cursor
  c.sprite=16

  if (is_tile(impass,c.x,c.y)) then
    -- red cursor
    c.sprite=48
  end
  if (is_tile(interact,c.x,c.y)) then
    -- yellow cursor
    c.sprite=32
  end
  if (is_tile(building,c.x,c.y)) then
    -- yellow cursor
    c.sprite=32
  end

  return

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