# FPS Playbook

Get more FPS from your Windows gaming PC with help from any AI assistant.

This repo holds a set of instructions your AI can follow, and a read-only script that takes a snapshot of your PC. The AI looks for what's holding you back, explains what it finds, and changes nothing without your approval.

**New to this? Go to [START-HERE.md](START-HERE.md).** It assumes no PC or AI experience.

**Iniciante? Veja o guia em português: [COMECE-AQUI.md](COMECE-AQUI.md).**

## How to use it

### With an AI that can run commands on your PC

Examples include Claude Code, Codex and similar tools. [Download this repo as a ZIP](https://github.com/leonardopessoa/fps-playbook/archive/refs/heads/main.zip), extract it, open your AI in the folder, and paste:

> Read PLAYBOOK.md and follow it to find where my PC is leaving FPS on the table in [your game]. Don't change anything without my explicit approval.

### With a chat-only AI

1. Read [`audit.ps1`](audit.ps1), so you know what it does.
2. [Download this repo as a ZIP](https://github.com/leonardopessoa/fps-playbook/archive/refs/heads/main.zip) and extract it. Open PowerShell in that folder and run:

   ```powershell
   powershell -NoProfile -ExecutionPolicy Bypass -File .\audit.ps1 -OutFile audit.txt
   ```

3. Read `audit.txt`, and remove anything you don't want to share.
4. Paste [`PLAYBOOK.md`](https://raw.githubusercontent.com/leonardopessoa/fps-playbook/main/PLAYBOOK.md) and `audit.txt` into the chat, and name your game and any competitive platforms you use.

## Example result

From one PC: Ryzen 9 5900X, RTX 3090, 32 GB DDR4, 280 Hz monitor, playing CS2 at 1440x1080.

| | Average FPS | 1% low |
|---|---|---|
| Owner's earlier best, from their own tuning | about 380 | not recorded |
| After this process (three benchmark runs) | 490 / 484 / 482 | 174 / 173 / 178 |
| After also tightening RAM timings (one run) | 485.8 | 175.9 |

The exact CS2 video settings used are in [START-HERE.md](START-HERE.md), [COMECE-AQUI.md](COMECE-AQUI.md) and [PLAYBOOK.md](PLAYBOOK.md), next to what pros commonly use.

**Please read this before quoting those numbers:**
- The 380 is the owner's recollection, not a controlled before-and-after run, and it may have been limited by a 400 FPS cap.
- The changes were made together, so we can't say which one helped most: BIOS update, RAM from 3200 to 3600, lower CS2 settings, and fewer background apps.
- The benchmark is the [CS2 FPS BENCHMARK DUST2 Workshop map](https://steamcommunity.com/workshop/filedetails/?id=3240880604), not a real match. It's the recommended way to compare your own CS2 results over time. Its author says results don't carry over to real matches, because the client also simulates the whole game.
- Tighter RAM timings made no measurable difference, and CAS 16 wouldn't boot on this kit. The details are in [`PLAYBOOK.md`](PLAYBOOK.md).
- The final RAM settings passed 2 MemTest86 passes, but **a full four-pass test had not been confirmed at the time of writing**.
- This is one PC. Yours may gain more, less or nothing. If your RAM is already tuned and your settings are already low, there may be little left to gain.

## What's in here

| File | Purpose |
|---|---|
| [`START-HERE.md`](START-HERE.md) | Plain-English guide for complete beginners |
| [`COMECE-AQUI.md`](COMECE-AQUI.md) | The same beginner guide in Brazilian Portuguese |
| [`PLAYBOOK.md`](PLAYBOOK.md) | Step-by-step instructions for the AI, including safety rules and mistakes to avoid |
| [`audit.ps1`](audit.ps1) | Read-only PC snapshot. Needs no admin rights, changes nothing, and sends nothing anywhere |

The script tries to hide your Windows account name, PC name and Steam ID. Board and part names remain, so check the output before sharing it.

## Good to know

- **Check your anti-cheat before following any FPS guide.** Some platforms require VBS, Secure Boot and TPM. FACEIT is one, so generic advice to disable them can lock you out.
- **AI can be wrong.** It may misread a setting or be out of date. In the session behind this playbook, the AI corrected its own advice more than once. Check anything risky against your motherboard manual.
- **You make the BIOS changes yourself.** Overclocking RAM or a CPU can cause crashes and data corruption, and may affect your warranty. You do this at your own risk.
- **Windows only** for now. The method applies elsewhere, but the script doesn't.

## Sources

- [CS2 FPS BENCHMARK DUST2 Workshop map](https://steamcommunity.com/workshop/filedetails/?id=3240880604)
- [FACEIT: Windows security requirements](https://support.faceit.com/hc/en-us/articles/23117181142556)
- [NVIDIA: System latency optimization guide](https://www.nvidia.com/en-us/geforce/guides/system-latency-optimization-guide)
- [Dust2.us: Video settings of 40 pros, Feb 2025](https://www.dust2.us/news/57753/donk-and-other-39-pros-reveal-their-video-settings)
- [ProSettings: CS2 settings guide](https://prosettings.net/guides/cs2-options/)
- [XDA: Testing frame-rate capping methods](https://www.xda-developers.com/everyone-has-a-different-formula-for-capping-frame-rate-so-i-tried-all-of-them/)
- [SkatterBencher: Ryzen 9 5900X overclocking strategies](https://skatterbencher.com/2021/08/18/skatterbencher-26-amd-ryzen-9-5900x-overclocked-to-5223-mhz/)
- [MemTest86: official download](https://www.memtest86.com/download.htm)

## License

MIT. See [`LICENSE`](LICENSE).
