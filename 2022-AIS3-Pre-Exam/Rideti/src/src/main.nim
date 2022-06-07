import nico
import strformat
import std/deques
import math
import random

const DELTA = uint32(2654435769)
const orgName = "artis24106"
const appName = "rideti"
const MAX_BULLET_TTL = 3

# XXTEA encrypted flag
const cf = [uint32(0x35059ed),
uint32(0x1ea69f2a),
uint32(0x6b29ac88),
uint32(0x2da5ff64),
uint32(0xba2c44db),
uint32(0xeac2d9e8),
uint32(0xcbcc50e1),
uint32(0x9d79575a),
uint32(0xfccddc45),
uint32(0x7cec1d5a),
uint32(0xe3371316),
].toDeque

const char_x = 6
const char_y = 6
var char_sprite = 0
var char_hf:bool = false
var char_vf:bool = false

var show_space_to_start:bool = true

type
  Bullet_type = enum
    None = 0, Yello = 1, Red = 2, Blue = 3, Purple = 4
  Direction = enum
    NoDir, Up, Down, Left, Right

  Bullet* = object
    b_type: Bullet_type
    b_dir: Direction

var buttonDown = false
var button_dir = Direction.Down
var level = 1 # current level
var s:int64 = 0 # score
# s = 3962971405739 - 3

var k:Deque[uint32] = [ # key to decrypt flag
  uint32(0xde762f90), 
  uint32(0xadde0d23), 
  uint32(0xbead8763), 
  uint32(0xefc03786)
].toDeque 

var bullet_queue = [
  Bullet(b_type: Bullet_type.None, b_dir: Direction.NoDir),
  Bullet(b_type: Bullet_type.None, b_dir: Direction.NoDir),
  Bullet(b_type: Bullet_type.None, b_dir: Direction.NoDir),
  Bullet(b_type: Bullet_type.None, b_dir: Direction.NoDir),
  Bullet(b_type: Bullet_type.None, b_dir: Direction.NoDir),
  Bullet(b_type: Bullet_type.None, b_dir: Direction.NoDir),
].toDeque

const level_bullet = [
  [Bullet_type.Yello, Bullet_type.Yello],
  [Bullet_type.Yello, Bullet_type.Red],
  [Bullet_type.Yello, Bullet_type.Blue],
  [Bullet_type.Yello, Bullet_type.Purple],
]
var bullet_off:int = 0

var button_prev_dir: Direction = NoDir # [TODO] not working?
var bullet_det: Direction = NoDir
var bullet_det_ttl = MAX_BULLET_TTL

const MAX_SPEED = 16
var speed = MAX_SPEED * 3 # update frame
var new_speed = 0
var frame_counter = 0

var scene_state = 0

var pause_countdown:int = 0

proc rand(T: typedesc): T = 
  rand(T.low..T.high)

proc xxtea_dec(d: Deque[uint32], len: uint32, key: Deque[uint32]): Deque[uint32] = 
  var data:Deque[uint32] = d
  
  var n:uint32 = len - 1
  var z:uint32 
  var y:uint32 = data[0]
  var p:uint32
  var q:uint32 = 6 + 52 div (n + 1)
  var sum:uint32 = q * DELTA
  var e:uint32

  if n < 1:
    return data

  while sum != 0:
    e = sum shr 2 and 3

    for p in countdown(n, 1):
      z = data[p - 1]
      data[p] -= (((z shr 5) xor (y shl 2)) + ((y shr 3) xor (z shl 4)) xor (sum xor y) + (key[(p and 3) xor e] xor z))
      y = data[p]
    z = data[n]
    data[0] -= (((z shr 5) xor (y shl 2)) + ((y shr 3) xor (z shl 4)) xor (sum xor y) + (key[(p and 3) xor e] xor z))
    y = data[0]
    sum -= DELTA

  return data

# convert `num` to `Deque[uint32]` with `size`
proc uint_to_uint32_dq(num: uint64, size: uint32): Deque[uint32] = 
  var data:Deque[uint32]
  var n = num

  for i in 0..<size:
    var seg:uint64 = n mod 10000
    var tmp = 0
    for j in countdown(3, 0):
      tmp = tmp or (((seg mod 10) xor 0x30) shl (8 * j))
      seg = seg div 10
    n = n div 10000
    data.addFirst(uint32(tmp))
  return data

proc pause() =
  pause_countdown = 6

proc dir_rotate_cw(dir: Direction): Direction =
  var ret: Direction
  case dir:
    of NoDir:
      ret = NoDir
    of Up:
      ret = Right
    of Down:
      ret = Left
    of Left:
      ret = Up
    of Right:
      ret = Down
  return ret

proc dir_rotate_ccw(dir: Direction): Direction =
  var ret: Direction
  case dir:
    of NoDir:
      ret = NoDir
    of Up:
      ret = Left
    of Down:
      ret = Right
    of Left:
      ret = Down
    of Right:
      ret = Up
  return ret

proc dir_rotate_flip(dir: Direction): Direction =
  var ret: Direction
  case dir:
    of NoDir:
      ret = NoDir
    of Up:
      ret = Down
    of Down:
      ret = Up
    of Left:
      ret = Right
    of Right:
      ret = Left
  return ret

proc set_bullet_dir(idx: int) =
  case bullet_queue[idx].b_type:
    of Red:
      bullet_queue[idx].b_dir = dir_rotate_cw(bullet_queue[idx].b_dir)
    of Blue:
      bullet_queue[idx].b_dir = dir_rotate_ccw(bullet_queue[idx].b_dir)
    of Purple:
      bullet_queue[idx].b_dir = dir_rotate_flip(bullet_queue[idx].b_dir)
    else:
      discard

proc set_level() = 
  if s == 10:
    level = 2
  elif s == 30:
    level = 3
  elif s == 50:
    level = 4
  
proc set_speed() = 
  if s == 60:
    new_speed = MAX_SPEED
    pause()
  elif s == 30:
    new_speed = MAX_SPEED * 2
    pause()

proc gameInit() =
  loadFont(0, "font.png")
  loadSpriteSheet(0, "bullet.png", 16, 16)

proc update_menu() = 
  if keyp(K_SPACE):
    scene_state = 1

  frame_counter += 1
  if frame_counter >= 45:
    frame_counter = 0
    show_space_to_start = not show_space_to_start

proc update_game() = 
  button_prev_dir = button_dir
  if keyp(K_UP):
    char_sprite = 0
    char_hf = false
    char_vf = false
    button_dir = Direction.Down
  elif keyp(K_DOWN):
    char_sprite = 0
    char_hf = false
    char_vf = true
    button_dir = Direction.Up
  elif keyp(K_LEFT):
    char_sprite = 5
    char_hf = true
    char_vf = false
    button_dir = Direction.Right
  elif keyp(K_RIGHT):
    char_sprite = 5
    char_hf = false
    char_vf = false
    button_dir = Direction.Left

  frame_counter += 1
  if frame_counter >= speed:
    frame_counter = 0
    var curr = bullet_queue.popFirst

    # update determin bullet & TTL
    bullet_det = curr.b_dir
    bullet_det_ttl = MAX_BULLET_TTL
  
    # add new bullet
    if pause_countdown > 0:
      bullet_queue.addLast(Bullet(b_type: Bullet_type.None, b_dir: Direction.NoDir))
      pause_countdown -= 1
    else:
      bullet_queue.addLast(Bullet(b_type: rand(level_bullet[level - 1][0]..level_bullet[level - 1][1]), b_dir: rand(Direction)))
    bullet_off = 0

    # check speed update
    if bullet_queue.peekFirst.b_type == Bullet_type.None and new_speed > 0:
      speed = new_speed

    # update s
    s += 1
    set_level()
    set_speed()
    
    # check if s is fine
    if s == 3962971405739:
      scene_state = 2
      k = uint_to_uint32_dq(uint64(s), 4)

    # rotate bullet if needed
    set_bullet_dir(2)
  else:
    bullet_off = ceilDiv(frame_counter, ceilDiv(speed, 16))

  # check if defense or not
  if bullet_det != Direction.NoDir:
    if bullet_det_ttl == 0:
      scene_state = 3
    elif bullet_det == button_dir or bullet_det == button_prev_dir: # success
      bullet_det = Direction.NoDir

    bullet_det_ttl -= 1

proc scene_menu() = 
  setColor(7)
  printc("RIDETI", screenWidth div 2, screenHeight div 2 - 50, scale = 4)

  setColor(6)
  printr("Artis24106", screenWidth - 5, screenHeight - 10)

  if show_space_to_start:
    setColor(6)
    printc("PRESS SPACE TO START", screenWidth div 2, screenHeight div 2 + 30)

proc scene_game() = 
  setColor(3)
  print(fmt"LEVEL {level}", 5, 5)
  printr(fmt"SCORE: {s}", screenWidth - 5, 5)

  setColor(if buttonDown: 6 else: 3)

  # debug grid
  setColor(1)

  # render character
  spr(10, 4+char_x*16, 4+char_y*16)
  spr(char_sprite, 4+char_x*16, 4+char_y*16, hflip=char_hf, vflip=char_vf)

  # render bullet
  var b_x = 0
  var b_y = 0
  var b_hf:bool = false
  var b_vf:bool = false
  var b_t_off = 0 # left, right -> 5
  for i in 0..<bullet_queue.len:
    case bullet_queue[i].b_dir:
      of Direction.Up, Direction.NoDir:
        b_x = 4+16*6
        b_y = 4+16*(8+i) - bullet_off
        b_hf = false
        b_vf = false
        b_t_off = 0
      of Direction.Down:
        b_x = 4+16*6
        b_y = 4+16*(4-i) + bullet_off
        b_hf = false
        b_vf = true
        b_t_off = 0
      of Direction.Left:
        b_x = 4+16*(8+i) - bullet_off
        b_y = 4+16*6
        b_hf = true
        b_vf = false
        b_t_off = 5
      of Direction.Right:
        b_x = 4+16*(4-i) + bullet_off
        b_y = 4+16*6
        b_hf = false
        b_vf = false
        b_t_off = 5

    if bullet_queue[i].b_type != Bullet_type.None:
      spr(ord(bullet_queue[i].b_type) + b_t_off, b_x, b_y, hflip = b_hf, vflip = b_vf)

proc scene_final() =
  var f = ""
  for el in xxtea_dec(cf, uint32(cf.len), k):
    if el == 0:
      break
    for i in 0..3:
      f &= chr((el shr (i * 8)) mod 0x100)
  try:
    setColor(6)
    printc(f, screenWidth div 2, screenHeight div 2)
    setColor(3) 
    printc("CONGRATULATIONS!", screenWidth div 2, screenHeight div 2 - 40, scale = 3)
  except:
    setColor(8) 
    printc("TRY HARDER :)", screenWidth div 2, screenHeight div 2 - 20, scale = 3)

proc scene_died() = 
    setColor(8)
    printc("YOU DIED :(", screenWidth div 2, screenHeight div 2 - 20, scale = 3)

proc gameUpdate(dt: float32) =
  case scene_state:
    of 0:
      update_menu()
    of 1:
      update_game()
    else:
      discard

proc gameDraw() =
  cls()

  case scene_state:
    of 0:
      scene_menu()
    of 1:
      scene_game()
    of 2:
      scene_final()
    else:
      scene_died()
  

nico.init(orgName, appName)
nico.createWindow(appName, 216, 216, 4, false)
nico.run(gameInit, gameUpdate, gameDraw)
