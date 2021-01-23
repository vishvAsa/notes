+++
title = "Cables"
+++

## Types
- Cat 6 - 10 Gbps. 2x Performance of Cat 5 & 5e - frequency up to 250 MHz
- Cat 5e - 1Gbps
- Cat 5 - 100MBPs

## Conductor


## Shielding
- Indoor cables must overcome interference from other wires. So shielding is needed.
- Unshielded cables are generally ok for outdoor use.

### Types
- U/UTP (Unshielded Twisted Pair) means the cable consists of 4 unshielded twisted pairs and no outer shielding.
- CAT6A F/UTP (Foiled Unshielded Twisted Pair) means the cable consists of 4 unshielded twisted pairs however it contains an outer foil shield.
- S/FTP (screened/foiled twisted pair) cable, normally a CAT7 cable that has four individually shielded pairs and an outer screen braid around all four pairs.

## Crimping
- Video [here](https://www.youtube.com/watch?v=NmtMPSu--q0&feature=emb_logo) .

### Wire-terminal matching
T-568B is most commonly used.

```
                 T-568B                         T-568A
       --------------------------      ------------------------
Pin    Color             RJ-45 use      Color          RJ-45 use
---    -------------     --------      -------------   --------
 1     Orange Stripe     Tx+           Green Stripe    Rx+
 2     Orange            Tx-           Green           Rx-
 3     Green Stripe      Rx+           Orange Stripe   Tx+
 4     Blue              Not Used      Blue            Not Used
 5     Blue Stripe       Not Used      Blue Stripe     Not Used
 6     Green             Rx-           Orange          Tx-
 7     Brown Stripe      Not Used      Brown Stripe    Not Used
 8     Brown             Not Used      Brown           Not Used
```

- The other two colors (blue and brown) may be used for a second Ethernet line or for phone connections.

### Straight vs cross-over ends
- Straight-through cable, as its name suggests, connects pin 1 to pin 1, pin 2 to pin 2, pin 3 to pin 3, and pin 6 to pin 6.
- Cross-over cables are used to connect TX+ to RX+, and TX- to RX-, which connects pin 1 to pin 3, pin 2 to pin 6, pin 3 to pin 1 and pin 6 to pin 2. 


## RJ (Registered jack) Terminals
- RJ-11 is a 6-position, 4-conductor jack used in telephone wiring
- RJ-45 is used for LAN.