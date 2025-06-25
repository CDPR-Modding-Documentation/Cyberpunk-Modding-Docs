---
description: How sockets and name-ordinal indexing works for quest and scene nodes
---

# Name & Ordinals - Sockets 101

Imagine nodes are like LEGO blocks with connection points:

```
┌─────────────┐     ┌─────────────┐
│   Block A   │────▶│   Block B   │
│             │     │             │
│ OUT socket  │     │ IN socket   │
└─────────────┘     └─────────────┘
```

* **OUT sockets** = Where signals LEAVE a block
* **IN sockets** = Where signals ENTER a block
* **Name & Ordinal** in a nutshell is the "address" that tells signals which socket to use



## :clapper: Enter: Cut

When you're watching a movie and suddenly:

* **The phone rings** and interrupts the conversation
* **Explosions start** and everyone stops talking
* **An emergency happens** and the scene changes immediately

That's a **"Cut"** - something that **interrupts** the normal story flow

#### **In Cyberpunk:**

```
Normal Story Flow:
V talks to Jackie ───▶ Jackie responds ───▶ Conversation continues

With a Cut:
V talks to Jackie ───▶ 💥 COMBAT STARTS! ───▶ Conversation STOPS
                      ↑
                   Cut signal
```

#### **🔄 Two Types of Connections:**

1. **Normal connections** = "Continue the story naturally"
2. **Cut connections** = "INTERRUPT! Something urgent happened!"

Every node in a scene or quest can:

* **Send normal signals** = "Here's the next part of the quest or scene"
* **Send cut signals** = "STOP! Emergency!"
* **Receive normal signals** = "Ok, continuing the story..."
* **Receive cut signals** = "Oh no! I'm being interrupted!"

***

### 📬 **Now, How Do We Address These Messages?**

Every message between story blocks needs an **address label** with two numbers:

#### **📝 The Address System:**

* **Name** = "What KIND of message?" (Normal=0, Cut=1, etc.)
* **Ordinal** = "Which version/slot?" (Usually 0)

#### **🤔 But Here's the Tricky Part:**

**Quest nodes** and **Scene nodes** use **different rules** for these addresses. They speak different languages:

**Quest Node Logic:** "I organize by message type first"

* Normal message #1: `Name:0, Ordinal:0`
* Normal message #2: `Name:0, Ordinal:1` ← Same Name, different Ordinal
* Emergency message or a cut: `Name:1, Ordinal:0`

**Scene Node Logic:** "I organize by giving each path a unique ID"

* Normal message: `Name:0, Ordinal:0`
* Emergency message or a cut : `Name:1, Ordinal:0` ← Different Name, same Ordinal
* Story path 1: `Name:2, Ordinal:0`
* Story path 2: `Name:3, Ordinal:0`

#### **Think of it like this:**

* **Quest nodes** count: "Type 0: slot 1, slot 2, slot 3..."
* **Scene nodes** count: "Path 0, Path 1, Path 2, Path 3..."

**That's it!** The rest is just knowing which system each block type uses! 🎯

***

### &#x20;**The Complete Socket Reference Table**

| Node Type | Connection Type | Name | Ordinal | Socket Index | Socket Name      |
| --------- | --------------- | ---- | ------- | ------------ | ---------------- |
| **Quest** | Cut Destination | 0    | 0       | 0            | "CutDestination" |
| **Quest** | Normal Input    | 0    | 1       | 1            | "In"             |
| **Scene** | Normal Input    | 0    | 0       | 0            | "In"             |
| **Scene** | Cut Input       | 1    | 0       | 1            | "Cut"            |

#### **Output Sockets (Both Types):**

| Node Type | Output Type | Name | Ordinal | Socket Index |
| --------- | ----------- | ---- | ------- | ------------ |
| **Both**  | Normal Out  | 0    | 0       | 0            |
| **Both**  | Cut Out     | 1    | 0       | 1            |

***

### 🎨 **ASCII Visual Guide**

#### **Quest Node Layout:**

```
┌─────────────────────────────┐
│        Quest Node           │
│                             │
│ INPUT:                      │
│  ● [0] CutDestination       │ ← N:0, O:0
│  ● [1] In                   │ ← N:0, O:1
│                             │
│ OUTPUT:                     │
│  ● [0] Out (Normal)         │ ← N:0, O:0
│  ● [1] Out (Cut)            │ ← N:1, O:0
└─────────────────────────────┘
```

#### **Scene Node Layout:**

```
┌─────────────────────────────┐
│        Scene Node           │
│                             │
│ INPUT:                      │
│  ● [0] In                   │ ← N:0, O:0
│  ● [1] Cut                  │ ← N:1, O:0
│                             │
│ OUTPUT:                     │
│  ● [0] Out (Normal)         │ ← N:0, O:0
│  ● [1] Out (Cut)            │ ← N:1, O:0
└─────────────────────────────┘
```

***

### 🔗 **Connection Flow Examples**

#### **Normal Story Flow:**

```
Quest Node ────────────────▶ Scene Node
N:0, O:1 (Out)              N:0, O:0 (In)
"Normal flow"               "Normal input"
```

#### **Cut/Interrupt Flow:**

```
Scene Node ────────────────▶ Scene Node
N:1, O:0 (Cut Out)          N:1, O:0 (Cut In)
"Interrupt signal"          "Interrupt input"
```

#### **Mixed Example:**

```
┌─────────────┐    Normal    ┌─────────────┐    Cut      ┌─────────────┐
│ Quest Node  │─────────────▶│ Choice Node │────────────▶│ Section     │
│             │  N:0, O:1    │             │  N:1, O:0   │             │
│ ● Out       │              │ ● In        │             │ ● Cut       │
└─────────────┘              │ ● Cut       │             └─────────────┘
                             └─────────────┘
```

***

### 📋 **Quick Reference for Modders**

#### **When Creating Connections:**

**TO Quest Nodes:**

* Normal flow: `Name: 0, Ordinal: 1`
* Cut flow: `Name: 0, Ordinal: 0`

**TO Scene Nodes:**

* Normal flow: `Name: 0, Ordinal: 0`
* Cut flow: `Name: 1, Ordinal: 0`

**FROM Any Node (Outputs):**

* Normal output: `Name: 0, Ordinal: 0`
* Cut output: `Name: 1, Ordinal: 0`

***

### ⚠ **Common Mistakes to Avoid**

#### **DON'T Mix Systems:**

```
❌ BAD: Scene node with N:0, O:1 (Quest pattern on Scene node)
✅ GOOD: Scene node with N:1, O:0 (Proper Scene pattern)
```

#### **Remember the Rule:**

* **Quest nodes**: Ordinal determines socket
* **Scene nodes**: Name determines socket type
