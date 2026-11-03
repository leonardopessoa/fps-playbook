# Start here: more FPS, no experience needed

*Em português: [COMECE-AQUI.md](COMECE-AQUI.md)*

You don't need to know anything about PCs or AI. You'll use a free AI chat as your guide. It looks at a report about your PC and tells you what to do, one step at a time.

**Time:** about 30 minutes for the first part.
**Cost:** free.
**You need:** a Windows PC and a web browser.

## Three rules that keep you safe

1. **Nothing changes unless you change it.** The report in Part 2 only reads information from your PC.
2. **If you don't understand a step, don't do it yet.** Ask the AI: *"What does this do, what could go wrong, and how do I undo it?"*
3. **Never give the AI your passwords, recovery keys or card details.** It doesn't need them. If it asks, say no.

AI can be wrong, even when it sounds sure. If something seems risky, ask a friend who knows PCs.

## Part 1: Measure your FPS now

Do this first. Without a "before" number, you won't know if anything worked.

### Playing Counter-Strike 2? Use the benchmark map

This widely used CS2 map plays the same scene every time, so your before and after numbers are fair. Use it to compare your own PC: the map's author says results don't carry over to real matches, because your PC also simulates the whole game.

1. Open the [CS2 FPS BENCHMARK DUST2 page](https://steamcommunity.com/workshop/filedetails/?id=3240880604) and click **Subscribe**. You may need to sign in to Steam.
2. Start CS2. Go to **SETTINGS > Game** and turn on **Enable Developer Console**.
3. Open the console with the key to the left of **1**, type `fps_max 0`, and press **Enter**. This removes the FPS limit for the test. Press the same key to close the console.
4. Go to **PLAY > Workshop Maps** and start the benchmark. If you don't see it, restart CS2 and give the map a minute to download.
5. Don't touch anything until it finishes. It took about 2 minutes on our test PC.
6. Your results appear in the console, in purple. Look for a line like this:

   `[VProf] FPS: Avg=490.0, P1=174.1`

   **Avg** is your average FPS, and **P1** is your 1% low, which shows how bad the worst moments are. If the console doesn't open, press the key to the left of **1**, and scroll up if needed.
7. Run it **3 times**, and take a phone photo of each result. Ignore the first run, which can be affected by loading, and write down the numbers from the other two.

When the AI asks for your FPS, give it these numbers.

### Playing another game?

1. Open your game and turn on its FPS counter. If you can't find it, search the web for "[your game] show FPS". If the game has a built-in benchmark, use that.
2. Play for a few minutes on a map or level you know.
3. Write down your usual FPS, and the lowest it drops to in a fight.

## Part 2: Create the report about your PC

1. [Click here to download the ZIP](https://github.com/leonardopessoa/fps-playbook/archive/refs/heads/main.zip). Or open the [repo's page](https://github.com/leonardopessoa/fps-playbook), click the green **Code** button, then **Download ZIP**.
2. Open your **Downloads** folder, right-click the ZIP, and choose **Extract All**, then **Extract**.
3. Open the new folder. You should see files named [`audit.ps1`](audit.ps1) and [`PLAYBOOK.md`](PLAYBOOK.md). If you only see another folder, open that one.
4. Right-click an empty spot in the folder, and choose **Open in Terminal**. A window with text appears. That's normal.
   - Don't see it? Click **Show more options** and look for **Open PowerShell window here**.
5. Want to see what the script does before you run it? [Open `audit.ps1` here](audit.ps1). Then copy this whole line, paste it into that window with a right-click, and press **Enter**:

   ```powershell
   powershell -NoProfile -ExecutionPolicy Bypass -File .\audit.ps1 -OutFile audit.txt
   ```

6. Wait for the text to stop scrolling. A new file named `audit.txt` appears in the folder.
7. Double-click `audit.txt` and skim it. It lists your PC's parts and settings. Delete anything you don't want to share, then save.

Red error text in a section or two is usually fine. Continue anyway, and show it to the AI if you're worried.

## Part 3: Ask the AI

1. Open a free AI chat in your browser, such as [Claude](https://claude.ai), [ChatGPT](https://chatgpt.com) or [Gemini](https://gemini.google.com). You may need to make a free account.
2. Attach `PLAYBOOK.md` (it's in the folder you extracted) and `audit.txt` (the file you made in Part 2). Look for a paperclip or **+** button near the message box. If there isn't one, paste the text instead: for `PLAYBOOK.md`, [open the plain text here](https://raw.githubusercontent.com/leonardopessoa/fps-playbook/main/PLAYBOOK.md), press **Ctrl+A** and **Ctrl+C**, and paste it in. For `audit.txt`, open the file and do the same.
3. Copy the message below, fill in the brackets, and send it:

   > I'm a complete beginner. Use the attached PLAYBOOK.md to find why my game could run faster, using my attached audit.txt.
   >
   > My game: [game name]
   > My FPS now: about [number], dropping to about [number] in fights
   > Other game platforms or anti-cheat I use: [for example FACEIT, or "none"]
   >
   > Please explain things in simple words and give me only the 3 easiest and safest things to try first. Give me one step at a time, tell me exactly where to click, tell me how to undo it, and wait for me to say it worked before the next step. Tell me clearly if any step is risky.

4. Do one step at a time. Stuck? Take a phone photo of your screen, send it to the AI, and ask: *"What do I do now?"*

## Part 4: See if it worked

Run the same test as Part 1, the same way, and tell the AI your new numbers. Ask: *"What's next, and is it worth the risk?"*

**It's fine to stop whenever you're happy.** If your FPS is already above your monitor's refresh rate and the game feels smooth, you may not need anything else.

## Extra: the CS2 video settings from our example

These are the settings from the example PC in the [README](README.md). They're based on what pros commonly use, and they're safe to try because you can change them back in the menu.

1. In CS2, take a phone photo of your current video settings, so you can go back.
2. Go to **SETTINGS > Video**, then open **Advanced Video**.
3. Change these, then run the Part 1 benchmark again:

| Setting | Our value | Most common among pros |
|---|---|---|
| Display Mode | Fullscreen | Not in the survey |
| Boost Player Contrast | On | On |
| Global Shadow Quality | High | High |
| Dynamic Shadows | All | All |
| Model / Texture Detail | High | Low |
| Shader Detail | Low | Low |
| Particle Detail | Low | Low |
| Ambient Occlusion | Disabled | Disabled |
| High Dynamic Range | Quality | Quality |
| Multisampling Anti-Aliasing Mode | 4x MSAA | 8x MSAA |
| Texture Filtering Mode | Anisotropic 4X | Bilinear |
| FidelityFX Super Resolution | Disabled | Not in the survey |
| NVIDIA Reflex Low Latency | Enabled | Not in the survey |

The pro column comes from a 2025 survey of 40 pros. Your eyes matter more than any table, so if you can't spot players easily, change it back. Keep **Dynamic Shadows on All**, because shadows can give away enemies.

## Before you chase more FPS

What we learned on our example PC, so you can save some time:

- **Don't assume an app is off.** Two apps its owner thought weren't running turned out to be running in the background. Ask the AI to check.
- **Extreme tweaks may do nothing.** Tighter RAM timings took hours of testing and gave no measurable FPS gain. One tighter setting wouldn't even let the PC start.
- **CPU overclocking usually isn't worth it for games.** In the best test we found, it added about 2% FPS or less, with a lot more heat under full load.
- **Small differences don't count.** Run the benchmark a few times. Our runs varied by about 8 FPS on their own, so don't trust a change smaller than your normal variation.
- **If you ever need a RAM test,** download the current MemTest86 USB image, not the old "V4" one. If your PC goes back to the BIOS instead of starting the test, you may have the wrong version, so show the AI what's on your USB stick first.

## Stop signs

**Stop and get help from someone who knows PCs if:**
- The AI sends you into the **BIOS**, the settings screen that appears before Windows starts, and you feel unsure. This is where the bigger gains can be, but mistakes can stop your PC from starting. Most problems can be reversed, but take your time.
- The AI suggests updating the BIOS. Don't turn off your PC during an update.
- The AI asks you to turn off **Windows Security** or antivirus. Say no.
- The AI asks you to turn off **VBS, Secure Boot or TPM**. Check your anti-cheat rules first, because you could get locked out of your game.
- The AI asks you to download a "tweak" or "booster" tool you've never heard of. Say no until someone you trust has checked it.
- Your PC starts crashing after a change. Undo the last change, and tell the AI.

**On a laptop?** Many of the bigger fixes won't apply, and heat matters more. Tell the AI it's a laptop.

## The words you'll see

| Word | What it means |
|---|---|
| **FPS** | Frames per second. Higher usually feels smoother |
| **1% lows** | How bad the worst moments are. Low numbers feel like stutter |
| **Hz (refresh rate)** | How many times per second your monitor updates |
| **CPU** | The main processor. In many competitive games, this limits FPS |
| **GPU** | The graphics card |
| **RAM** | Fast short-term memory. It often runs slower than it's rated for until you turn on its profile |
| **BIOS** | The settings screen that appears before Windows starts |
| **XMP / DOCP / EXPO** | A BIOS setting that runs RAM at its advertised speed |
| **Overclocking** | Running parts faster than their rated speed, which can make your PC unstable |
| **Driver** | Software that lets Windows talk to a part, like your graphics card |

## Want the technical version?

See [README.md](README.md) for the example results and [PLAYBOOK.md](PLAYBOOK.md) for the AI's full instructions.
