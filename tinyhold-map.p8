-- map code

function map_setup()
 -- sprite flags
 impass=0
 building=1
end

function draw_map()
 -- get the camera to follow
 -- the cursor
 mapx=flr(c.x/16)*16
 mapy=flr(c.y/14)*14
 camera(mapx*8,mapy*8)
 map (0,0,0,0,128,64)
end

function anim_tiles()
 -- animates map tiles
 celx=0
 cely=0
 if animcount==30 or animcount==60 then
  for celx=0,128 do
   for cely=0,64 do  
    -- animate water tiles   
    if mget(celx,cely) == 4 then
     mset(celx,cely,20)
    elseif mget(celx,cely) == 20 then
     mset(celx,cely,36)
    elseif mget(celx,cely) == 36 then
     mset(celx,cely,4)
    end        
   end
  end
 end

 if animcount==20 or animcount==70 then
  for celx=0,128 do
   for cely=0,64 do  
    -- animate cottage   
    if mget(celx,cely) == 9 then
     mset(celx,cely,25)
    elseif mget(celx,cely) == 25 then
     mset(celx,cely,41)
    elseif mget(celx,cely) == 41 then
     mset(celx,cely,9)
    end        
   end
  end
 end

 
 if animcount==45 then
  for celx=0,128 do
   for cely=0,64 do
    -- animate wheat
    if mget(celx,cely) == 7 then
     mset(celx,cely,23)
    elseif mget(celx,cely) == 23 then
     mset(celx,cely,7)
    end
    -- animate pasture
    if mget(celx,cely) == 8 then
     mset(celx,cely,24)
    elseif mget(celx,cely) == 24 then
     mset(celx,cely,8)
    end
   end 
  end
 end
 
end

function is_tile(tile_type,x,y)
 tile=mget(x,y)
 has_flag=fget(tile, tile_type)
 return has_flag
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