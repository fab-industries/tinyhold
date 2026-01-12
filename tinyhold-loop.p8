-- game loop

function _init()
 version="0.00.001"
 state="logo"
 t=0
 filt=0
 gt_hrs=0
 gt_day=1
 gt_mth=1
 gt_yrs=1401
 mnth={"jan","feb","mar","apr","may","jun","jul","aug","sep","oct","nov","dec"}
 blnkclr=4
 blnkindex=1
 blnkframe=0
 blnkspd=10
 blnkseq={4,10}
 countd=-1
 animcount=0
 houses=2
 
 map_setup()
 make_cursor()
end

function _update()
 t+=1
 if state=="logo" then
  update_logo()
 elseif state=="title" then
  update_title()
 elseif state=="game" then
  update_game()
 end
end

function update_logo()
 if filt<500 then
  filt+=1
 end
 
 if filt>=120 then
  state="title"
 end
 
end

function update_title()
 blink()
 -- when ❎ is pressed, this
 -- makes the text blink faster
 -- and starts a countdown
 -- before loading the game
 if countd<0 then
  if btnp(❎) then
   sfx(00)
 	 countd=40
 	 blnkspd=1
 	 blnkseq={9,10,7,10}
  end
 else
  countd-=1
  if countd<=0 then
   countd=-1
   state="game"
  end
 end
end

function update_game()
 adv_time()
 move_cursor() 
end

function _draw()
 cls(0)
 if state=="logo"then
  draw_logo()
 elseif state=="title" then
  draw_title()
 elseif state=="game" then
  draw_game()
 end
end

function draw_logo()
 if t<121 and filt==1 then
  sfx(1)
 end
 
 if t<121 and filt<121 then
  spr(128,32,20,8,4)
  spr(192,32,52,8,4)
  print("(c) 2023-2026",37,100,8)
  print("fab.industries", 36,108,9)
 else
  return
 end
end

function draw_title()
 cls()
 -- title screen encoded into
 -- string
 title="`ト`トiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiwjai♪jai○jaizikjmibjbi☉jci}jciyijjlicjdi●jei{jeiejbiqiijlicjfi░jgiyjgidjcipihjliejdi●jfizjficjeioigjligjbi☉jei{jeibjginifjaihjaijjai웃jei{jeicjgimiojai⬆️jei{jeidjfiminjbijjaiijaiejaiijbifjbifjeibjainjaiijeiejfilimjciijcigjcicjcigjdidjdiejeiajciljcihjeifjfikiljdihjeiejeiajeiejfibjfidjjijjeigjeigjfijikjeigjgicjmicjgiajgidjkiijfifjeihjfiiikjeihjfidjmidjeicjeidjligjhiejeigjhihikjeiijeiejeiajfidjeicjeidjeiajfifjciajfidjeifjciajfigikjeiijeiejeibjeidjeicjeidjeibjeiejdiajfidjeiejdiajfigikjeiijeiejeibjeidjeicjeidjeibjeidjeibjeidjeidjeibjeigikdeiideiedeibdeiddeicdeiddeibdeiddeibdeiddeiddeibdeigikdeiideiedeibdeiddeicdeiddeibdeiddeibdeiddeiddeibdeigikdeiideiedeibdeiddeicdeiddeibdeiddeibdeiddeiddeibdeigikdeiideiedeibdeiddeicdeiddeibdeiddeibdeiddeiddeibdeigikdeiideiedeibdeiddeicdeiddeibdeiddeibdeiddeiddeibdeigikdeiideiedeibdeiddeicdeiddeibdeiddeibdeiddeiddeibdeigikdeiideiedeibdeiddfibdeiddeibdeiddeibdeiddeiddeibdeigikdeiideiedeibdeiddgiadeiddeibdeiddeibdeiddeiddeibdeigikdeiideiedeibdeiedliddeibdeiddeibdeiddeiddeibdeigikdeiideiedeibdeifdkiddeibdeiddeibdeiddeiddeibdeigikdeiideiedeibdeifdkiddeibdeiddeibdeiddeiddeibdeigikdeiideiedeibdeiedbiadciadeiddeibdeiddfiaddiedeiddfiaddihikdeiideiedeibdeiedaicdaibdeiddeibdeiddfiadcifdeiddfiadciiikdfihdeiedeibdeiedaifdeiddeibdeiedhigdeiedhijikdgigdfiddfiadficdaigdeiddfiadfiedgigdfiedgijikdeiidgicdnibdaigdeiddniedeihdgiedeikildcikddifddicddiedaiedfieddicddihdcijddihdcilimdaimdbihdbiedbifdaiddfigdbiedbijdaildbijdaimiˇdaibdfiけi∧dgiこi❎deiさi▤dciしi▥daiすiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナiナ"
 -- decode and print
 -- title screen
 rle1(title,0,0,0)
 print("v "..version,82,53,4)
 hctxt("a cosy town building game",67,5)
 hctxt("press ❎ to start",97,blnkclr)
end

function blink()
 -- makes text change colour
 blnkframe+=1
 if blnkframe>blnkspd then
  blnkframe=0
  blnkindex+=1
  if blnkindex>#blnkseq then
   blnkindex=1
  end
  blnkclr=blnkseq[blnkindex]
 end   
end

function draw_game()
 cls()
 draw_map()
 animcount+=1
 if animcount>90 then
  animcount=0
 end
 anim_tiles()
 draw_cursor()
 draw_ui()
end