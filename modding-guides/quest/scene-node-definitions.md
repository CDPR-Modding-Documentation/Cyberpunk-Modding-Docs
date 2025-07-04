# Scene Node Definitions

## :scissors: Cut Control&#x20;

&#x20;[`scnCutControlNode`](https://nativedb.red4ext.com/c/4636270759012682)&#x20;

### What it does

The `scnCutControlNode` is a fundamental logic gate in the scene system. Its one and only function is to act as a simple, high-speed Result-Route&#x72;**. It's a signal splitter.**

The node itself is "dumb," stateless, and contains no internal logic or data fields. Its power comes from its interaction with the signals it receives. Signals can be **tagged with a `SUCCESS` or `FAILURE` state** by a "smart" node that sent it.

If you're familiar with programming, a Cut Control is basically an if-else statement that operates the check on the signal.

The `CutControlNode`'s job is to inspect this tag on the incoming signal and route the execution flow down one of its two dedicated paths. This provides designers with a clean, reusable component to create conditional branches based on the outcome of a gameplay action or check.

#### Why the Name "CutControl"?

The name can be confusing. It does not mean it can only "cut" as in interrupt a node. Think of it like using scissors on a wire - the Cut Control node literally cuts the signal into two: the true signal via Out0 and the false signal via Out1.

### Sockets

#### Inputs

| Socket Name (ID) | Type    | Description                                                                                                                |
| ---------------- | ------- | -------------------------------------------------------------------------------------------------------------------------- |
| **In** (`0,0`)   | `Input` | The single entry point. It receives a signal that has been tagged with a `SUCCESS` or `FAILURE` state by an upstream node. |

#### Outputs

| Socket Name (ID)  | Recommended Editor Label | Description                                                        |
| ----------------- | ------------------------ | ------------------------------------------------------------------ |
| **Out0** (`0, 1`) | **Success / True**       | The path taken when the incoming signal is tagged with `SUCCESS`.  |
| **Out1** (`1, 0`) | **Failure / False**      | The path taken when the incoming signal is tagged with `FAILURE`.  |

### The Source of the Logic: "Smart" Nodes

The conditional check does **not** happen inside the `CutControlNode`. It happens in an upstream "smart" node that then generates the tagged signal. The most common state producers are:

1. **`scnChoiceNode`:** A specific dialogue option can have a condition (like a stat check or payment) attached to it as a property. When the player selects that option, the `ChoiceNode` performs the check and tags its output signal with the result.
2. `scnQuestNode` -> `Condition` node: sometimes a Condition node is set upstream and at a later point, the signals are converged into a single output (via a Hub) - which then again at a later point is split into the true/false signals via `CutControlNode` &#x20;

### Examples

#### Example 1: Narrative Branching (The Lifepath Check)

This is the clearest example of the node's primary purpose. **Scene:** `base/open_world/street_stories/watson/kabuki/sts_wat_kab_04/scenes/sts_wat_kab_04_receptionist.scene`

* **The Goal:** Show a different version of a conversation based on V's Lifepath.
* **The Mechanism:**
  1. The player makes a dialogue choice. A `questConditionNode` upstream checks the player's lifepath and fires a signal tagged `SUCCESS` for Corpo or `FAILURE` for others.
  2. The **`CutControlNode [84]`** receives this tagged signal.
  3. It routes the flow:
     * **`Out0 (Success)`** leads to `Section [15]`, the professional "Corpo" dialogue.
     * **`Out1 (Failure)`** leads to `Section [28]`, the rougher "Streetkid" dialogue.

#### Example 2: Looping Dialogue State (The Braindance Dealer)

This shows how the node is used to control a looping conversation. **Scene:** `base/quest/main_quests/part1/q105/scenes/q105_04c_braindance_dealer.scene`

* **The Goal:** Keep the player in a conversation until they successfully purchase the required item.
* **The Mechanism:**
  1. After the player makes a choice, a linked `questConditionNode` checks if the objective is complete.
  2. It sends a `SUCCESS` or `FAILURE` tagged signal to the **`CutControlNode [1437]`**.
  3. The `CutControl` routes the flow:
     * **`Out0 (Success)`** breaks the loop and ends the conversation.
     * **`Out1 (Failure)`** routes the flow back to the start of the idle/choice loop, preventing the conversation from ending prematurely.

***

## 🔀Flow Control

[`scnFlowControlNode`](https://nativedb.red4ext.com/c/3716001461228230) and [`questFlowControlNodeDefinition`](https://nativedb.red4ext.com/c/34001554939364)

A compact **gating tool** that counts how many signals arrive while it is **open** and how many arrive while it is **closed**. It is a _very_ stateful node. It is not dumb.

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

