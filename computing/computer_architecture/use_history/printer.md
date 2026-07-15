+++
title = "Printer"
+++
## Epson L15180 (Inkjet EcoTank):
### Power
• Operating power consumption: Approximately 20-25 watts during printing  
• Peak startup current: Minimal (under 1 amp) due to Heat-Free Technology
• No high-current fuser unit like laser

##  HP ColorLaserJet M255dw
- Features
  - Color printer
- Drivers (Manjaro linux)
  - generic pcl laser color printer.
  - Autodetected on Arch Linux HP ColorLaserJet M255-M256 driver - stopped working properly 
    - repeated "Broken pipe" error while printing large docs

```
Description:	HP ColorLaserJet M255-M256
Location:	
Driver:	HP ColorLaserJet M255-M256 Postscript (recommended) (color, 2-sided printing)
Connection:	socket://192.168.1.27
Defaults:	job-sheets=none, none media=iso_a4_210x297mm sides=two-sided-long-edge
```

### Power
Operating power consumption: Approximately 400-500 watts during active printing  
• Peak startup current: 8-12 amps during fuser warm-up (first 10-30 seconds)  
• Highest power draw occurs when fuser heating element reaches operating temperature

## Canon MF 264dw
- Features
  - Black and white printer.
  - Authorized Original Toner vendor
    - Cauvery Infotech, Basaveshvaranagara Bengaluru. Ordered via email and whatsapp.
    - Duplicates on internet.
  - Wifi.

### Arch Linux setup
- Add as LPD printer - `lpd://192.168.1.26/queue`
- Drivers which work
  - Generic PCL 5e printer.
  - Canon imageRunner 330s - CUPS+Gutenprint v5.3.4 Simplified

```
Description:	
Location:	
Driver:	Canon imageRunner 330s - CUPS+Gutenprint v5.3.4 Simplified (grayscale, 2-sided printing)
Connection:	lpd://192.168.1.26/queue
Defaults:	job-sheets=none, none media=iso_a4_210x297mm sides=two-sided-long-edge

```

Alternate (stopped working after some time):

```
DeviceURI dnssd://Canon%20MF260._ipp._tcp.local/?uuid=01c80000-fe7f-11de-8a39-74bfc08b5f30
```

