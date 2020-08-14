+++
title = "GUI Software Stack"

+++

Graphical user interfaces are implemented using a stack of software. The software stack, with examples is as follows:

- Windowing system: provides abstraction from hardware, provides graphics primitives, basic window drawing abilities. Eg: xorg server.

- Login session manager. Enables selection of desktop environment. Eg: gdm, kdm, lxdm, simpledm.

- Desktop environment. Eg: gnome, kde (programmed with widgeting toolkits gtk+ and qt respectively). application ivocation: mouse driven or keyboard driven (possibly with autocompletion). transferring copied content, drag/ drop. Status panel showing useful updates like time, weather, input language.

- Window managers. Eg: gnome-shell, compiz. Responsible for: Working with multiple windows, switching between them, positioning them (possibly in different workspaces).


## Comparison

Keyboard shortcuts for the above are jointly provided.

Various GUI software stacks differ in the facilities they provide. The penalty for greater facility comes in terms of memory and processing power used to merely provide the desktop environment.

### Look vs utility

There is additional cost due to fashion - newer, heavier window managers are provided not just to provide greater facility, but to provide alternative looks favored by the hip crowd which is often not dense with power-users. Also, newer window managers could be experimental or unstable in many regards - eg: Ubuntu Unity in 2011.
