---
title: User interface
---

## GUI Metaphors

The most common graphical user interfaces use the desktop/ workspace and the windows metaphor.

### Desktop

A desktop/ workspace corresponds to a big area in the available screen space whence applications are launched, and within which statuses, widgets and windows are displayed.

There may be multiple workspaces on a device - especially in case of devices with limited screen size.

#### Layering

Various windows, widgets and the desktop conceptually form a stack of various displays available to the user. This concept is useful when understanding widgets.

### Taskbar, statusbar

A narrow portion of the screen is sometimes dedicated to displaying the statuses of various running applications, outputs of widgets displaying info like time, weather etc..; and to provide place for menus to launch applications.

### Windows

A window is an area of the screen which is dedicated as an input/ output interface. A window may be overlaid with another, or ’minimized’ to have 0 screen area - and the corresponding area available for interaction with the window is correspondingly reduced. A window may be fully closed, possibly resulting in the termination of the corresponding application.

In case of small desktop workspaces (as in pocket computers), the active window occupies all of the available area on the workspace.

#### Task switching

Switching between windows is done using a program called ’task manager’, which is generally invoked using the taskbar or special key combinations.

### Views and perspectives

The Window is designed to be a collection of various views. Eg: Eclipse, RapidMiner. Perspectives are particular arrangements of certain views. UI’s often allow (re)definition of perspectives by moving or adding views.

### Widget

A widget is a window which is always on the layer immediately above the desktop. So, whenever one views the desktop, the widget is necessarily seen on top of it. Unlike windows, they usually don’t have simple means to close them.

## GUI Software Stack

Graphical user interfaces are implemented using a stack of software. The software stack, with examples is as follows:

- Windowing system: provides abstraction from hardware, provides graphics primitives, basic window drawing abilities. Eg: xorg server.

- Login session manager. Enables selection of desktop environment. Eg: gdm, kdm, lxdm, simpledm.

- Desktop environment. Eg: gnome, kde (programmed with widgeting toolkits gtk+ and qt respectively). application ivocation: mouse driven or keyboard driven (possibly with autocompletion). transferring copied content, drag/ drop. Status panel showing useful updates like time, weather, input language.

- Window managers. Eg: gnome-shell, compiz. Responsible for: Working with multiple windows, switching between them, positioning them (possibly in different workspaces).


### Comparison

Keyboard shortcuts for the above are jointly provided.

Various GUI software stacks differ in the facilities they provide. The penalty for greater facility comes in terms of memory and processing power used to merely provide the desktop environment.

#### Look vs utility

There is additional cost due to fashion - newer, heavier window managers are provided not just to provide greater facility, but to provide alternative looks favored by the hip crowd which is often not dense with power-users. Also, newer window managers could be experimental or unstable in many regards - eg: Ubuntu Unity in 2011.

## Special input hardware

### Buttons

Buttons are often provided, dedicated for a simgle (possibly broad) purpose. These include buttons to power off, adjust volume, reset the computer etc.. They provide a useful, cheap ever-present way of accepting input from the user, which is partly why they are not located on the screen.

### Dials

Dials - simulated or otherwise - are very useful for accepting numeric input; and are therefore provided in case of clocks, timers, etc..

## Special indicators

### Lighted icons

Sometimes lighted icons are provided to provided binary information about something. Eg: is the caps-lock on, is there a waiting notification.

## Logging systems

Examples include various java logging frameworks including log4j.

### Requirements

One is to be able to log at various levels, usually named debug, info, error etc..

Log messages should be informative and customizable: printing things like the name of the function where it originates, the class-name, the line number, the time, the log-message level etc..

Logging is to have a simple, yet expressive syntax for constructing messages.

One is to be able to set logging levels for various modules at various levels, so as to filter out relatively unimportant messages out of the log.

One is to be able to direct the log messages of various modules to arbitrary files, web-services or consoles.
