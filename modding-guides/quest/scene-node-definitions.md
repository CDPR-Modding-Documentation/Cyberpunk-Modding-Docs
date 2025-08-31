# Scene Node Definitions

## 🔀Flow Control

[`scnFlowControlNode`](https://nativedb.red4ext.com/c/3716001461228230) and [`questFlowControlNodeDefinition`](https://nativedb.red4ext.com/c/34001554939364)

A compact **gating tool** that counts how many signals arrive while it is **open** and how many arrive while it is **closed**. It is a stateful node.

\
You steer it in two ways:

* **Window parameters** `opensAt` / `closesAt` – an automatic _first-N / next-M_ limiter.
* **Control pins** `Open` / `Close` / `Switch` – instant manual override.

Because the node exists in both the **Scene player** and the **Quest system**, its counters live in different places, but the behaviour you see as a modder is identical.

### What it does:

**It maintains three state variables (or facts)**

* A count of signals received while the gate is _open_ (let's call this internal counter: `openCounter`)
* A count of signals received while the gate is _closed_ (let's call this internal counter `closedCounter`)
* The current open/closed state (this is stored in the node property: `isOpen`)

Every time a signals hits **In** the node of a Flow Control:

It checks the `isOpen` property. One of the following things happen:

1. If it is set to true (i.e. it's opened) then the `openCounter` is incremented.&#x20;
   1. Then a simple range check is done: has the `openCounter` we just incremented reached the `closesAt` yet?
2. If it is set to false (i.e. it's closed) then the `closeCounter` is incremented
   1. Then a simple range check is done, has the `closeCounter` we just incremented reached the `opensAt`yet?

**If the answer is “No”** to either question → the gate **forwards the signal** and keeps its current `isOpen` state.

**If the answer is “Yes”** → the gate **flips its isOpen state** _first_ and then re-checks:

* if the currrent final flipped state = open → it forwards the signal via it's output socket
* or if the final state is closed → it swallows/does not forward the signal



What do the sockets do then? They are overrides. You can just not use `opensAt` and `closesAt` params, and use Flow Control as a simple 'latch' with the sockets alone.

**The Sockets always win**

* `Open`sets state = open.
* `Close` sets state = closed.
* `Toggle`toggles the state.



Scope:

* **Scene runtime** stores the counters in the scene resource and are reset outside the scene
* **Quest runtime** stores them in a fact scoped to the _Phase_ that owns the node



If you know how to code, you can also understand the Flow Control with this Python snippet:

```python
class FlowControl:
    def __init__(self, opens_at: int = 0, closes_at: int = 0,
                 start_open: bool = False):
        self.opensAt      = opens_at
        self.closesAt     = closes_at
        self.isOpen       = start_open          # latch flag
        self.openCounter  = 0                   # signals while open
        self.closedCounter = 0                  # signals while closed
        self._override    = None                # None / True / False

    # ─ pin handlers ────────────────────────────────────────────────
    def pinOpen(self):
        self._override = True                   # force state for THIS frame

    def pinClose(self):
        self._override = False

    def pinSwitch(self):
        self._override = not self.isOpen

    # ─ main entry: returns True if signal forwarded ─────────────────
    def signal(self) -> bool:
        # 1) apply any override that came in earlier this frame
        if self._override is not None:
            self.isOpen = self._override
        self._override = None                   # override lasts one frame

        # 2) bump the appropriate counter
        if self.isOpen:
            self.openCounter += 1
            # 3) test open-side limit
            if self.openCounter >= self.closesAt and self.closesAt != 0:
                self.isOpen = False             # flip latch
        else:
            self.closedCounter += 1
            # 3) test closed-side limit
            if self.closedCounter >= self.opensAt:
                self.isOpen = True              # flip latch

        # 4) forward or swallow
        return self.isOpen

```

### Sockets

| Socket             | Scene flavour            | Quest flavour | Notes                                                                      |
| ------------------ | ------------------------ | ------------- | -------------------------------------------------------------------------- |
| **In**             | ✔                        | ✔             | Signal you want to gate                                                    |
| **Out**            | ✔                        | ✔             | Forwarded signal (if gate passes)                                          |
| **Open**           | _should wor&#x6B;_&#xB9; | ✔             | Signal → state = open                                                      |
| **Close**          | _should wor&#x6B;_&#xB9; | ✔             | Signal → state = closed                                                    |
| **Switch**         | _should wor&#x6B;_&#xB9; | ✔             | Signal → state toggles                                                     |
| **CutDestination** | ✔                        | ✔             | Standard interrupt used when you want to interrupt/bypass the entire check |

{% hint style="info" %}
_should wor&#x6B;_&#xB9; : This is untested but it should work. Existing scene files never never uses the sockets on a scene Flow Control node. But it should be easy to verify! If you do, please update this part of the guide or let us know in #quest-and-scenes in the Cyberpunk discord.
{% endhint %}



**Key properties**

| Name       | Meaning                                               | Typical values                           |
| ---------- | ----------------------------------------------------- | ---------------------------------------- |
| `opensAt`  | Lower limit checked while gate is **closed**          | 0 (let the very first pulse open)        |
| `closesAt` | Upper limit checked while gate is **open**            | 1 (one-shot), 2 (two-shot), 0 (infinite) |
| `isOpen`   | Cached flag (true / false) saved with the scene/phase | You can pre-set to open or closed        |

### Examples & Use-cases

| Use-case                                 | Scene setting                  | Quest setting                                            | Wiring sketch                                             |
| ---------------------------------------- | ------------------------------ | -------------------------------------------------------- | --------------------------------------------------------- |
| **One-shot VO** – play once, never again | `opensAt 0 / closesAt 1`       | same                                                     | Trigger → FlowCtrl → Section VO                           |
| **Dual-shot** – play twice, then stop    | `0 / 2`                        | same                                                     | Distance Pause → FlowCtrl → animation                     |
| **Auto-cap at N, but re-arm later**      | `0 / N`, sockets optional      | same + QuestEvent → **Open**                             | Timer loop → FlowCtrl → bark Section                      |
| **Toggle every signal**                  |                                | numbers default, wire same signal to **In** & **Switch** | Event → (split) → Switch & In                             |
| **Scene “bump” two-shot**                | `0 / 2`                        | n/a                                                      | Distance ≤ 2 m → 100 ms Pause → FlowCtrl → bump VO + anim |
| **Scene capped bark loop**               | Two gates: `[0-2)` and `[2-3)` | n/a                                                      | Randomizer → Hub → GateA / GateB → Pause → loop-back      |
| **Phase-scoped call-cap**                | n/a                            | `opensAt 0 / closesAt 2` (no sockets)                    | PhaseOut → FlowCtrl → Output call                         |
| **Manual latch**                         |                                | sockets only, numbers `0/0`                              | QuestEvent.On → **Open**, QuestEvent.Off → **Close**      |

#### Choosing between **numbers** and **sockets**

| Want                                      | Easiest choice                                               |
| ----------------------------------------- | ------------------------------------------------------------ |
| “Fire a fixed N times, then never again.” | Just set `opensAt / closesAt` and ignore sockets.            |
| “Enable/disable it on command.”           | Leave numbers at `0 / 0`  and wire **Open / Close** sockets. |
| “Cap at N but allow re-arm.”              | Window `[0-N)`, plus **Open** pin to re-arm trigger.         |

### Checklist

1. **Scene logic** – drop Flow Control where you need “play this node only the first N times.”
2. **Quest logic** – use it as a lightweight latch; sockets give you full control, numbers give you auto-limits.
3. Remember: the counters are scoped within a **scene instance** (for scenes) or the **Phase node** (for quests) ends.

***

## **🌐Hub**

### What it does

The Hub node is one of the simplest but most essential tools for organizing scene graphs. Its sole function is to be a **signal merger** or **funnel**. It takes any number of incoming execution paths and combines them into a single, unified output path.

Like the CutControlNode, the Hub is a "dumb," stateless node. It contains no internal logic. It doesn't care which input socket received a signal or how many signals it has received; it simply fires a signal from its Out socket every time any of its In sockets are triggered.

While the Hub's main job is to merge inputs, it's important to remember that its single Out socket can be connected to multiple downstream nodes. This allows a Hub to also act as a signal distributor, broadcasting a unified signal to several paths at once. This is often used to trigger multiple parallel events after a set of preceding conditions have been met and merged.

### Sockets

| Pin            | Direction | Type      | Description                                                                                                                        |
| -------------- | --------- | --------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| `In`, `In1`, … | In        | Execution | Any number of dynamically created input sockets. When you drag a connection to a Hub, a new input socket is automatically created. |
| `Out`          | Out       | Execution | A single output socket that fires whenever any input is triggered.                                                                 |

### Examples & Use-cases

**Example 1: Converging Logic Branches (The "Collector")**

This is the most common use case: cleaning up the graph after several different logic branches have concluded.

* **The Goal:** Ensure that multiple, mutually exclusive outcomes all lead to the same final step.
* **The Mechanism:** As seen in the example image, a scene might have several FactsDBManager nodes that set different game states (holo\_setup\_active, holo\_setup\_started, holo\_setup\_ended). Each of these represents the end of a small logic branch. Instead of drawing a messy "spider web" of connections from all these nodes to a single End node, a Hub (\[289]) is used as a collector. Each FactsDBManager connects to one of the Hub's input sockets. The Hub then provides a single, clean output connection to the final End node (\[235]).

<figure><img src="../../.gitbook/assets/image (636).png" alt=""><figcaption><p>Hub example</p></figcaption></figure>

**Example 2: Re-joining after a Condition**

* **The Goal:** After splitting the execution flow with a CutControlNode (e.g., for a lifepath-specific dialogue line), you often need to bring the paths back together to continue with actions that are common to all outcomes.
* **The Mechanism:**
  1. A CutControlNode splits the flow: Out0 (Success) goes to a "Corpo" dialogue Section, and Out1 (Failure) goes to the "Streetkid" dialogue Section.
  2. The Out sockets of both the "Corpo" and "Streetkid" Section nodes are connected to the input sockets of a single Hub.
  3. The Hub's single Out socket then connects to the next part of the scene that all players experience, regardless of which dialogue branch they took.



Checklist

* Use a Hub whenever you need to merge two or more execution paths into a single path or when you need to split signals
* It's an organizational tool: stateless, with no internal logic or properties.
* It helps keep complex scene graphs tidy and easy to read by reducing visual clutter.



## 🚪Xor

`scnXorNode`

The `Xor` node (short for Exclusive OR) is a **'first-come, first-served' gate**. It's designed to solve a common problem: what to do when multiple different events could trigger the same outcome, and you need to ensure that outcome only happens _once_.

It listens to all its inputs, but only allows the **very first** signal that arrives to pass through to its `Out` socket. Once it has fired, it enters a "latched" or "closed" state and will ignore all subsequent signals. This prevents unwanted "double triggers" from multiple sources.

### **Sockets**

| Pin              | Direction | Type      | Description                                                                 |
| ---------------- | --------- | --------- | --------------------------------------------------------------------------- |
| `In`, `In1`, ... | In        | Execution | Any number of dynamically created input sockets.                            |
| `Cancel`         | In        |           |                                                                             |
| `Out`            | Out       | Execution | Fires a single time when the _first_ signal is received on any `In` socket. |

### **Examples & Use-cases**

**Example 1: Player Action vs. Timer (The Holocall Race)**

* **Scene:** `ep1\quest\holocalls\alex\alex_holocall.scene`

<figure><img src="../../.gitbook/assets/image (637).png" alt=""><figcaption></figcaption></figure>

**The Goal:** A holocall is ringing. The scene must proceed if the player picks it up, OR if a certain amount of time passes and the player _doesn't_ pick it up. We only care about whichever happens first.

* **The Mechanism:**
  1. The flow is broadcast to two `PauseCondition` nodes simultaneously.
  2. `PauseCondition [326]` is a `SystemCondition` waiting for the player to perform a `PhonePickUp`.
  3. `PauseCondition [22]` is a `TimeCondition` acting as a timer (in this case, 4 seconds and 15 milliseconds).
  4. Both of these nodes feed into the inputs of the `Xor` node `[104]`.
  5. **Scenario A (Player is fast):** The player picks up the phone. Node `[326]` fires, its signal passes through `Xor [104]`, and the scene continues down the "answered call" path. A few moments later, the timer in `[22]` finishes. Its signal hits the already-fired `Xor` node and is swallowed, preventing the "missed call" path from also triggering.
  6. **Scenario B (Player is slow):** The timer in `[22]` finishes first. Its signal passes through `Xor [104]` and the scene proceeds down the "missed call" path. If the player eventually picks up the phone, the signal from `[326]` hits the `Xor` and is ignored.



**Example 2: Player Action vs. Proximity Trigger (The Cryo-Freezer Reveal)**

<figure><img src="../../.gitbook/assets/image (640).png" alt=""><figcaption></figcaption></figure>



* **Scene:** base\quest\side\_quests\sq021\scenes\sq021\_03\_trailer\_park.scene

**The Goal:** After the player agrees to talk, a welcome scene should trigger as soon as either the player or Sobchak enters the trailer. The scene must not trigger twice if they both enter.

* **The Mechanism:**
  1. The player makes a Choice \[1085]. The first option outputs to start two simultaneous checks.
  2. **Path 1 (Check NPC):** PauseCondition \[685] checks if Sobchak is IsInside the trailer's trigger area.
  3. **Path 2 (Check Player):** PauseCondition \[599] checks if the Player is IsInside the same trigger area.
  4. Both conditions feed into the Xor node \[1098].
  5. The Xor's output starts the conversation Section \[781].
* **Why the Xor is Necessary:**\
  The player and Sobchak can easily be inside the trigger area at the same time.
  * If a Hub were used, it would receive a signal from the player check and a signal from the Sobchak check, firing its output twice. This would cause the welcome dialogue in Section \[781] to restart, creating a bug.
  * The Xor guarantees that the first entity detected - whether it's the player or the NPC, triggers the scene. The Xor immediately latches shut, and when the second entity is detected moments later, that signal is simply ignored. The conversation correctly starts only once.



**Checklist**

* Use Xor whenever you need to ensure an action is triggered **exactly once**, especially when there are multiple possible triggers (e.g., player action, a timer, a proximity check).
* It's a "one-shot" gate: it fires on the first signal it receives and then ignores everything else until it is reset.

***

## 🔗And

{% hint style="warning" %}
This is a signal-stopping node
{% endhint %}

### What it does

The And node is a **synchronization point** or a **gatekeeper**. Its purpose is to pause the execution flow until multiple, separate, parallel paths have all been completed.

It waits until it has received a signal on **every single one** of its input sockets. Only when the last required signal has arrived does the And node fire a single signal from its Out socket.



**Sockets**

| Pin          | Direction | Type      | Description                                                                                                                                                                |
| ------------ | --------- | --------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| In, In1, ... | In        | Execution | The node will wait until a signal has been received on every one of these input sockets. The number of sockets is determined by how many connections are made to the node. |
| Out          | Out       | Execution | Fires a single time, only after all input sockets have received a signal.                                                                                                  |

### **Examples**

**Example 1: Waiting for Characters to Spawn**

* **Scene:** base/quest/side\_quests/sq026/scenes/sq026\_12\_penthouse\_gameplay.scene

<figure><img src="../../.gitbook/assets/image (641).png" alt=""><figcaption></figcaption></figure>

This is the most common and critical use case for an And node: ensuring all necessary characters are present before a scene begins.

* **The Goal:** Start a conversation in a penthouse, but only after two specific characters, Roxanne and Tom, have both finished spawning and are present in the scene.
* **The Mechanism:**
  1. The execution flow splits to start two simultaneous checks.
  2. **Path 1:** PauseCondition \[283] pauses the flow until the character roxanne has CharacterSpawned.
  3. **Path 2:** PauseCondition \[281] pauses the flow until the character tom has CharacterSpawned.
  4. The outputs of both PauseCondition nodes are connected to the inputs of the And node \[289].
  5. The Out socket of the And node connects to the next part of the scene (e.g., the main dialogue Section).
* **Why the And is Necessary:**\
  Spawning characters can take a variable amount of time. Without the And node, the scene's timing would be unreliable.
  * If you only waited for Roxanne to spawn, the conversation could start while Tom is still invisible or not yet in the world, leading to characters talking to empty space or other visual bugs.
  * The And node acts as the rendezvous point. It doesn't matter if Roxanne spawns first or Tom spawns first. The And node will patiently wait, holding the scene, until it receives signals from both spawn checks. Only then does it allow the scene to proceed, guaranteeing that all participants are ready and the scene can play out correctly.

***





