+++
title = "Lock"
+++

## Features
- Handedness - Just for looks, people prefer Left or Right locks so that they can be installed without being turned upside down.
- Inside vs outside opening: The lock tooth is curved on one side so as to slide in when pushed against an obstacle from a particular direction. This can be changed upon disassembly.
- Deadlocking: Explained [here](https://www.youtube.com/watch?v=16CDy-o6TeQ). Can ensure that the door does not lock or unlock automatically.


## Electronic locks
- Popular brands India 2020: Alba, CP plus (Indian HQ and manufacturing, good reach, comes with 5 keys). Navkar OEM - has deadlocking fefature unlike CP Plus ([YT](https://www.youtube.com/watch?v=WIT3zKhLyvw), [NS](http://navkarsys.com/Electronic-Door-Lock-Stainless-Steel-for-Wooden-and-Metal-Doors-with-Dead-Locking-Lock-Can-Be-Free-NSEL-390)).
- Principle: when power is supplied, lock is unlocked.
- Installation video
  - CP Plus [here](https://www.youtube.com/watch?v=BtK7Fis9Pck) .
  - Navkar demo [here](https://www.youtube.com/watch?v=16CDy-o6TeQ)
- Power: 12V DC. Power: higher than 3A or 12W. So, need a power adaptor.
- Keeping the power supply on for longer than 8 seconds could damage the lock (CP Plus warning).

## Wifi controllers
### Tinxy 
- Indian company
- Demo [here](https://www.youtube.com/watch?v=WiY89FcC-Eo).
- Wiring diagram [here](https://tinxy.in/wp-content/uploads/2019/09/REMOTE7-1012x1024.jpg).  Instruction manual [here](https://docs.google.com/document/d/19CUIW6-FGX7kiGI2oPKC09dlQ9MQ3XdqsDB7JVbGHM0/edit).
  - 240 V input at P1. P2 - connection to the lock. P3 - switch or other device (like keypad). P4 - door close sensor.
- Controller Dimensions: 14cm, 7.5cm, 3.7cm

### Alternates
- Uwanxt - [Amazon](https://www.amazon.in/UwaNxt-Electronic-Silver-Standard-Single/dp/B083M3HSK8/)

## Authentication devices
### RFID + keypad + bell
- Wiring described in [this vid](https://www.youtube.com/watch?v=VsZLFqE_iLc). One set for input power - 12V. One set for open switch. One for door bell. One for locking. A reset pin pair (to restore security passwords). Often comes with a power supply box which supplies 12V output and accepts door unlocking control signals to operate the lock for x seconds (adjustible).

#### Indian sellers
- [Secureeye India](https://www.industrybuying.com/biometric-secureye-SEC.BIO.91016006/)
- [Navkar](navkarsys.com/Imported-RFID-Door-Lock-Access-Control-System-with-10-Keyfobs).
- [Kiron](https://kiron.co.in/products/B00G4UF7NA) made in USA.
- [Premium av](https://www.flipkart.com/premiumav-security-rfid-proximity-entry-door-lock-access-control-system-smart/p/itmf5bbwn2egnc7n). Size: 3.5 inch sq.
- [Kitsguru](https://www.flipkart.com/kitsguru-security-rfid-proximity-entry-door-lock-access-control-system-500-user-circuit-motion-detector-electronic-hobby-kit/p/itmf87xwnudnm7h8?pid=EHKF87RPUCM7MHT4). Size: 4 inch sq.

#### Attacks
- For low RW security id tags: Key fob cloning is very easy. Shown in [this vid](https://www.youtube.com/watch?v=VsZLFqE_iLc).
- One can open the authentication box and short the unlock wires.