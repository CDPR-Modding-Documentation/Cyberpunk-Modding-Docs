---
description: How does MLSB's tag browser work?
---

# The MLSB library search

In 1.6.8, the MLSetupBuilder library has been completely overhauled. This page will tell you how to find things there.

The model browser of 1.6.7 has been transformed from a tree with sub-branches into a table with many capability. One of those capability is **tags filtering**.

## How does this work?

{% hint style="info" %}
If you don't care for the theory, skip directly to [#how-do-i-start-using-tags-filters](the-mlsb-library-search.md#how-do-i-start-using-tags-filters "mention")
{% endhint %}

Filtering will only consider an item's name, but not its visual appearance:&#x20;

<figure><img src="../../../.gitbook/assets/mlsb_tags_guide_1" alt=""><figcaption><p>Tags visualization with badges, the one selected in the datas will be like <strong>base,man,massive,head</strong></p></figcaption></figure>

Tags are displayed to the right, but are written text-like in the Database. Every keyword is divided from the other with a <mark style="color:yellow;">**space**</mark>. As the caption says, the selected line tags is written like : **base man massive head**

### Why is this important ?

It is important because there are some rules to this syntax that will help you atomize the search of one model  into the 40K+ models paths stored in the Database.\
\
The most important rule is that every model starts with :&#x20;

* <mark style="color:yellow;">**base**</mark> - for Vanilla Cyberpunk 2077 models
* <mark style="color:yellow;">**PL**</mark> - for Phantom Liberty ONLY models

## How do i start using tags filters ?

In the **Models Library** panel, click on the <mark style="color:yellow;">tags filter</mark> button in the header of the table

<figure><img src="../../../.gitbook/assets/mlsb_tags_guide_2" alt=""><figcaption><p>Collapsible interface of the tags filter</p></figcaption></figure>

#### Example

Let's say we wanna search only in the models of the **Phantom Liberty** expansion for <mark style="color:yellow;">**man**</mark> models.\
We will add a first condition specifying in the options that our tags _Starts with_ the word `PL`

<figure><img src="../../../.gitbook/assets/mlsb_tags_guide_3" alt=""><figcaption><p>filtering Phantom Liberty only models</p></figcaption></figure>

Then we can click on **Add Condition** and specify that the tags need to _Contains_ the word  `man` with a <mark style="color:yellow;">**space**</mark>** before** the word `man`\
The space is NEEDED since the also the keyword <mark style="color:yellow;">**woman**</mark> contain the word <mark style="color:yellow;">**man**</mark>

<figure><img src="../../../.gitbook/assets/mlsb_tags_guide_4" alt=""><figcaption><p>The search will look like this</p></figcaption></figure>

You will see that for every condition you add, the datas will be filtered in realtime.\
You can remove and add tags filtering condition as you like.\
Clicking to the little `x` in the <mark style="color:yellow;">**right upper corner**</mark> of the tags filtering panel you can toggle the panel and access the list you got.

You can combine the tags filtering with the basic search field in the table interface to find what you need.

{% hint style="danger" %}
The basic search field search model by their path in the archives, this means that ALL the part of the path can match a text filter like that.
{% endhint %}

### List of the actual TAGS used with Tags System

* base
* PL
* player
* man
* woman
* child
* big
* fat
* massive
* animals
* gloves
* arms
* head
* item
* legs
* shoes
* torso
* vehicle
* mechanical
* weapons
* firearms
* melee
* explosives
* environment

Details about the keyworks:

* <mark style="color:yellow;">player</mark> identify all those materials that by model name are for sure assigned to the game player
* <mark style="color:yellow;">animal</mark> identify the models related to the Animals Gang member body size

### A more complex example

<figure><img src="../../../.gitbook/assets/mlsb_tags_guide_5" alt=""><figcaption><p>We're searching models in vanilla cyberpunk for fat man that are related to the legs</p></figcaption></figure>

<figure><img src="../../../.gitbook/assets/mlsb_tags_guide_6" alt=""><figcaption><p>As you can see we got 9 models out of 44.300 for our search</p></figcaption></figure>

Tag filtering ca be combined with the default path search to display only legs models related in this case to <mark style="color:yellow;">**jeans**</mark>

<figure><img src="../../../.gitbook/assets/mlsb_tags_guide_7" alt=""><figcaption></figcaption></figure>
