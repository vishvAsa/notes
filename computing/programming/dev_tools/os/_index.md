+++
title = "+OS"
+++

## Major components
- Kernel and drivers to support one's devices.
- GUI. 
  - Stack: In Linux, this first involves: A display/ login manager (gdm, lxdm etc..) along with greeters. This spawns window manager (kde plasma, gnome, cinnamon ...) + communication manager (wayland, xll ...).
  - Good window management - support for multiple monitors, a good panel for various continuously running apps (clock, speaker, keyboard switcher etc..), screen lock, multiple workspaces ...


## Factors
### Updates
Once a good functioning system is installed, updates and additional software can be a problem.  
In a complex system with independently updated parts, breakages can be hard to diagnose and fix, despite alternatives available.

Periodic releases

- Positives
  - Greater stability. Especially if period between releases is huge (as in the case of Debian), allowing proper testing and fixing. 
- Negatives
  - You won't get "easy to install" latest software, with bug fixes.
  - Full system upgrade may still brick the computer - so it ought be very rare (once in 5 years?).

Continuous update model - Eg. Arch Linux, Manjaro.

- This periodically causes problems - GUI may not function. Login screen may become broken (202402). Re-awakening after suspension may not work (202402). 

### Redundancy
- Redundancy is desired for important tools such as editors.
- Redundancy may not be adequate in case of complex system with independently updated parts.
  - For example - Some redundancy in terms of display managers and desktop environments is good (especially in case of unstable systems). (Though this did not help in 202402.)
 
### Apps
- Should have a vast collection of easy-to-install apps.

## Strategy
- High conservativism and stability for the core system (GUI, drivers) - even at the loss of some fancy features. A failure here is most frustrating.
  - Hence, something like Debian.
- Flexibility with peripheral tools (editors, browsers ... ), taking advantage of redundancy.


## Virtual machines, emulators
An emulator provides the same interface as another operating system to some application. A virtual machine simulates computer hardware.

### Emulators on linux
WINE emulates windows.

mono emulates standardized part of the .Net framework. Command: mono something.exe.

