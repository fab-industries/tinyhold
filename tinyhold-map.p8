-- map code

function map_setup()
 -- sprite flags
 impass=0
 building=1
 interact=2
end

function draw_map()
 -- get the camera to follow
 -- the cursor
 mapx=c.x*8-60
 mapy=c.y*8-60
 mapx=mid(0,mapx,128)
 mapy=mid(0,mapy,96)
 camera(mapx,mapy)
 map(0,0,0,0,32,32)
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