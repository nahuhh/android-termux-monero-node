# Monerod-in-Termux
Run a Full or Pruned Monero Node on Android using Termux

<center> 
<figure>
<img src="assets/notification.jpeg" width="400">
<figcaption>Monero Node Status in Android Notifications </figcaption>
</figure>
</center>

## Table of Contents
- [TLDR](#quick-start-guide)
- [Table of Contents](#table-of-contents)
  - [Why](#why)
  - [Contributing to the Monero Network](#contributing-to-the-monero-network)
  - [WARNING...](#warning)
  - [Install](#install)
  - [Controls Overview](#controls-overview)
  - [Connecting to your Node / Seeding the Network](#connecting-to-your-node--seeding-the-network)
    - [Wallet Connections](#wallet-connections)
    - [P2P Seeding](#p2p-seeding)
  - [Updates](#updates)
  - [TODO's](#todos)
  - [Donate](#donate)

# Why

The goal of this project is to give newbs a stupid-easy way to run an energy-efficient, full or pruned Monero node with decent defaults on an Android device.... ideally, this is a few year old device that's currently sitting in a drawer doing nothing.  Why not set it up as a Monero node that sits at your house all day or you toss in a bag for making ultra-secure Monero transactions on the go?  This code and install process isn't meant for power users, people with extreme use cases, etc. If you're already that smart, you should just hack up my code and use it however you like.

Battery Life
- Recommend keeping plugged in during initial sync (can take a couple days).
Usage afterward sync completion is quite low, but not 0 due to wake-lock being enabled. 
While node can be run on your main device, it is recommended to keep the device plugged in when running, or better, to run on a spare/old device. 

Data Usage
- Over 100 gb initial download.
- After synced, a few hundred mb/day. 
- You can check for yourself using the "XMR Node Status" shortcut from the widget.

Running a Monero node allows you to connect your wallet (Feather, CakeWallet, Monerujo etc) to your node, running on the same device or same local network.
While Monero is private, using a remote node involves some level of trust. 
A remote node receives certain information from you, such as the date, time of a tx and the ip that sent it to the node.  
Running a node on Android is an easy and more decentralized way to use Moneero.


# Quick Start Guide

Notes:
- SD card recommended
- Will use SD card for node if available.
- During install, select "Pruned node" if you have under 150gb of free storage. 
- A Pruned node requires ~ 50gb if free space.
- Termux:Boot only necessary if you want the node to run automatically at boot.

1. Install the [F-Droid App Store](https://f-droid.org/)
2. Install these Apps from F-Droid (Do NOT install from Play store. If any of these are already installed from gplay, uninstall them)
- [Termux](https://f-droid.org/packages/com.termux)
- [Termux:Boot](https://f-droid.org/packages/com.termux.boot)
- [Termux:Widget](https://f-droid.org/packages/com.termux.widget)
- [Termux:API](https://f-droid.org/packages/com.termux.api)

2. Set permissions:
     Go to
     1. Settings > Apps
     2.  Then select: Termux > permissions
     And
     - disable battery optimization
     - enable draw over apps / draw on top
     3. Go back to settings > apps
     4. Then select: Termux:boot > permissions
     And
     - disable battery optimization 

3. In termux, issue the command 
```bash
sh -c "$(curl -fsSL https://raw.githubusercontent.com/CryptoGrampy/android-termux-monero-node/main/src/full-monero-node-external-sd-install.sh)" 
```
4. Follow the prompts. 

**- All New Users, and SD Users:** _Select Y when asked to setup storage folders._

**- All Users of pre 2022 versions, who were NOT using an SD:** _Select N_

**- All Users:** _Press Y when/if asked to use package maintainers version of sources.list_

5. Add the 2x2 Termux widget to your home screen.

6. If you want the node to run on boot, you'll have to open the termux boot app (once).

7. If you'd like the node to run in the foreground, stop and start the node from widget and select "foreground"

8. Have a look at [Wallet Connections](#wallet-connections) on how to connect your wallet to your node.
  - Optional: [Forwarding P2P ports](#p2p-seeding). See [Contributing to the Monero Network](#contributing-to-the-monero-network) for more info.

# Contributing to the Monero Network

If you run this software without [forwarding P2P ports](#p2p-seeding), you be leeching from the rest of the users of the network.  [Forwarding P2P port 18080](#p2p-seeding) will allow you to contribute to the network by seed (distributing) the Monero blockchain. 
To verify you're helping seed the network and that you've set up your router correctly, you will see  🌱 P2P: 5 (some number larger than 0) in your Android notifications.   

While I DO recommend connecting your wallet to your Android node from within your local network using RPC..
I don't recommend opening port 18089 - to the Restricted RPC port (18089) in your router unless access from outside the LAN is necessary.
_Do not forward 18081 (the UNRESTRICTED) RPC port._

More info on running a Monero Node:

https://www.reddit.com/r/Monero/comments/kkr04n/infographic_running_a_node_which_ports_should_i/
https://www.reddit.com/r/Monero/comments/kkgly6/message_to_all_monero_users_we_need_more_public/
https://www.reddit.com/r/Monero/comments/ko0xd1/i_put_together_a_new_guide_for_running_a_monero/

# WARNING...

1. Ideally you should store node on external storage (MicroSD etc. Will prompt during install)
   Regardless of whether the node is stored on SD or Internal..
   Run this code AT YOUR OWN RISK and READ THE CODE (and feel free to reach out if you have any improvements 😜).

2. Monero is mostly writes and reads- not rewrites which are what kill storage the fastest.

3. You may risk data saved on your microSD / Internal storage.  Recommended to backup before running this code.

4. If things go awry, delete all of the Termux apps you're about to install, and all will be back to normal. ^ except for corrupt data.


# Install

Video Install Guide (Use the code linked in this repo down below rather than the Pastebin shown in the video): 

[![Monero Full Node Install](https://img.youtube.com/vi/z46zAy-LoHE/0.jpg)](https://www.youtube.com/watch?v=z46zAy-LoHE)

1. Hardware Prep:
    - Android 7.0+ with ARMv8/v7 architecture
      - The script will check the architecture before running
    - aprox. 45-128gb free space for pruned node
    - 150+gb (256GB+ Preferred) for Full Node

 <center> 
  <figure>
    <img src="assets/cpu-architecture.png" width="300">
    <figcaption>Example ARMv8 CPU Instruction Set</figcaption>
  </figure>
</center>


1. Install Necessary Apps
    - Install the Fdroid App Store (https://f-droid.org/)
    - Install these Apps from Fdroid (Do NOT install from Play store.  If any of these are already installed, uninstall them)
      - [Termux](https://f-droid.org/packages/com.termux)
      - [Termux:Boot](https://f-droid.org/packages/com.termux.boot)
      - [Termux:Widget](https://f-droid.org/packages/com.termux.widget)
      - [Termux:API](https://f-droid.org/packages/com.termux.api)

<center> 
<figure>
  <img src="assets/apps.jpeg" width="300">
  <figcaption>Apps to Install from F-Droid Store </figcaption>
</figure>
</center>

3. Set Android Permissions (Go into Android settings and search for the permission names if you're having trouble locating them)
  - Battery Optimization: Don't Optimize: Termux and Termux:Boot
  - Display Over Other Apps: Termux

<center> 
  <img src="assets/android-permissions-1.png" width="300">
  <img src="assets/android-permissions-2.png" width="300">
</center>

4. Add the 'Termux Widget 2x2' Widget to your Android home screen (press the refresh button after you've finished the install process)

<center> 
<img src="assets/termux-widget.jpeg" width="300">
</center>

5. Install

  Quick Install- Copy and paste this into Termux, and press Enter
  ```bash
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/CryptoGrampy/android-termux-monero-node/main/src/full-monero-node-external-sd-install.sh)" 
  ```

6. SUCCESS!

# Controls Overview

Using the Termux Widget, you can 'Start XMR Node', 'Stop XMR Node', 'Update XMR Node', and check the 'XMR Node Status'. Try them all- you're not going to break anything.  Tap the arrow in the Android Termux notification in your swipe-down Android notifications to see detailed info on your Node.  If a Monero update is available, it will be present in this notification. 

The notification will be automatically be updated every 15 minutes. The first notification after starting your node will not appear until after 30 seconds have passed.

The notification might not be 100% accurate on slower devices. If you press the 'XMR Node Status' button in the Termux widget, you will briefly see the actual command line status of Monerod pop up in a Termux shell, and the Android notification will also update with the most recent node information (useful if you don't want to wait 15 minutes for an update).

Alternatively, you can "Stop" the node, and "Start" it in the foreground.

# Connecting to your Node / Seeding the Network

There are a few ip addresses and ports you need to know when running a wallet on the Android device itself, when you're pointing ANOTHER device in your LOCAL network at your new full or pruned node, or when you're opening up your router to seed the network.

## Wallet Connections

NOTE:  YOU WILL NOT BE ABLE TO TRANSACT UNTIL YOUR NODE IS 100% SYNCED.  Continue using remote nodes/whatever you were using before until you're fully synced.  

| Wallet relationship to node: | IP (Why?) | Port (Why?) | Forward? |
| ---------------------------- | ------ | ------ | --- |
| The same device | 127.0.0.1 (This is Localhost!) | 18081 (Unrestricted RPC Port) | Yes |
| Different devices on the same local network | Check Notification | 18089 (Restricted RPC Port) | No |
| Different devices on seperate networks | Public / Internet facing IP. [Search DuckDuckGo for ”my ip"](https://ddg.gg/my+ip)| 18089 (Restricted RPC Port) | Yes |

These are the default ports set in the config file.
You can edit the config file (located at crypto/monero-cli).
[Here is a nice Monerod reference guide]([src/full-monero-node-install](https://monerodocs.org/interacting/monerod-reference/)) 

## P2P Seeding

If you want to seed (help distribute) the Monero network (Recommended)
| Internal IP | Port (Why?) |
| -------------- | ------------- |
| Check Notification for IP | 18080 (P2P Port) |

This process varies by router, but if you [DuckDuckGo "port forwarding"](https://ddg.gg/port-forwarding) and add the name / brand of your router, you will find a guide.

For instance, this is how mine is setup: 

<center> 
<img src="assets/p2p-setup2.png" width="800">
</center>

<center> 
<img src="assets/p2p-setup.png" width="800">
</center>


Once you've enabled port forwarding of 18080, like magic, the P2P value in the Monero node notifications on your Android device will begin to tick up in value.  You're helping the network. 

If you decide, for whatever reason, that you want to stop seeding the network, simply stop forwarding port 18080 in your router/remove the port forwarding rule.  

Troubleshooting:
  - If P2P suddenly stops working for you, it's possible your router changed the IP of your Android device (this is normal behavior for a router).  
    
    You will likely need to set up your Android device to use a 'static ip'... For this..

    Open Android Setting, and go to: wifi > tap & hold on current network > edit/modify > [show advanced] > ip settings

    Change DHCP from "auto/dynamic" to "manual/static". 

# Updates

- Termux Node Code:  Simply run
```bash
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/CryptoGrampy/android-termux-monero-node/main/src/full-monero-node-external-sd-install.sh)" 
  ```
  and follow the prompts.

- Monero:  If a new version is available, you can run the 'Update XMR Node' shortcut to install the new version.  

# TODO's:

- TBD

# Donate:

If you enjoy this software, please feel free to send a tip to:

**[CryptoGrampy](https://twitter.com/CryptoGrampy)!** $XMR:
```
85HmFCiEvjg7eysKExQyqh5WgAbExUw6gF8osaE2pFrvUhQdf1HdD6XSTgAr4ECYMre6HjWutPJSdJftQcYEz3m2PYYTE6Y
```

**_[nahuhh](https://github.com/nahuhh)_** ☠️ $XMR:
```
8343hzpypz2BR5ybAMNvvhaLtbXSMgCT7KqYSTfLBk3DF8Yayi5b7JGRWZc2GdqNu1EkALEFv1FHkCgeQ1zzkUFVMqtcTBy
```
