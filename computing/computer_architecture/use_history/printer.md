+++
title = "Printer"
+++

## Canon MF 264dw
- Features 
  - Black and white printer.
  - Authorized Original Toner vendor
    - Cauvery Infotech, Basaveshvaranagara Bengaluru. Ordered via email and whatsapp.
    - Duplicates on internet.
  - Wifi.

### Arch Linux setup
- Add as LPD printer - `lpd://192.168.1.26/queue`
- Driver - Canon imageRunner 330s - CUPS+Gutenprint v5.3.4 Simplified 

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


##  HP ColorLaserJet M255dw
- Features
  - Color printer
- Autodetected on Arch Linux

```
Description:	HP ColorLaserJet M255-M256
Location:	
Driver:	HP ColorLaserJet M255-M256 Postscript (recommended) (color, 2-sided printing)
Connection:	socket://192.168.1.27
Defaults:	job-sheets=none, none media=iso_a4_210x297mm sides=two-sided-long-edge
```