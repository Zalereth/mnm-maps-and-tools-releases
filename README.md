# M&M Cartographer - downloads

A minimap overlay for **Monsters & Memories**. It shows where you are, a compass, the zone, and the game and PC clocks, on top of your game. It only reads the game, never changes it, and sends nothing anywhere.

## Install

1. Click **Releases** on the right of this page, then the newest version at the top.
2. Under **Assets**, click **MnM-Overlay-Beta.exe** to download it.
3. Run it, click the big button, and say **Yes** when Windows asks for permission.

### If Windows blocks it

Windows is careful with programs from the internet, and this one is not signed by a registered company. It is safe to continue. Do either of these:

- When a blue **Windows protected your PC** box appears: click **More info**, then **Run anyway**.
- Or, before running it: right-click the downloaded file, choose **Properties**, tick **Unblock** at the bottom, click **OK**, and run it again.

### Easier: one line, nothing to unblock

Press the Windows key, type **PowerShell**, open it, paste this line and press Enter:

```
irm https://raw.githubusercontent.com/Zalereth/mnm-overlay-releases/main/install.ps1 | iex
```

It downloads the newest version, checks it, and opens the setup window. You can read what it does first: [install.ps1](install.ps1).

## Updates

After the first install the app tells you when a newer version is posted and installs it for you. Nothing to download by hand.

This page holds only the finished program, not its source code.
