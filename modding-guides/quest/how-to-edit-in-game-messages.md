# How to edit in-Game Messages

although not needed in the mod it's best to have the cooked\_journal.journal open as to make it easier to find what you're looking for it's path being base\journal\cooked\_journal.journal

<figure><img src="../../.gitbook/assets/Screenshot 2024-10-29 204140.png" alt=""><figcaption></figcaption></figure>

the main file needed is the onscreens.json depending on your preferred language it could be in base\localization under:

* `ar-ar`: Arabic (العربية)
* `cz-cz`: Czech (čeština)
* `de-de`: German (Deutsch)
* `en-us`: English (English)
* `es-es`: Spanish (Español)
* `es-mx`: Latin American Spanish (Español latinoamericano)
* `fr-fr`: French (Français)
* `hu-hu`: Hungarian (Magyar)
* `it-it`: Italian (Italiano)
* `jp-jp`: Japanese (日本語)
* `kr-kr`: Korean (한국어)
* `pl-pl`: Polish (Polski)
* `pt-br`: Brazilian Portuguese (Português do Brasil)
* `ru-ru`: Russian (Русский)
* `th-th`: Thai (ไทย)
* `tr-tr`: Turkish (Türkçe)
* `ua-ua`: Ukrainian (Українська)
* `zh-cn`: Simplified Chinese (简体中文)
* `zh-tw`: Traditional Chinese (繁體中文)

for now we will be using the English version, once you choose your language go into the onscreens folder and choose onscreens.json once it has been added we can begin:

<figure><img src="../../.gitbook/assets/Screenshot 2024-10-29 203947.png" alt=""><figcaption></figcaption></figure>

now that we have both the cooked\_journal.journal and onscreens.json added we can get to work for this mod we will be simply changing Panam's name to Valerie and have her tell us the mod is working to find panam go into the journal file and go into contacts after that open entries this is where ypu will spend some time searching to find the character you want: &#x20;

<figure><img src="../../.gitbook/assets/Screenshot 2024-10-29 204523.png" alt=""><figcaption><p>pay attention to the LocKey number it will be important</p></figcaption></figure>

for changing her name focus on the LocKey number this is found in the onscreens.json file as the PrimaryKey which will also require some searching

<figure><img src="../../.gitbook/assets/Screenshot 2024-10-29 204649.png" alt=""><figcaption><p>once found you can change the name in the FemaleVariant</p></figcaption></figure>

as for changing the conversation here we're gonna use the followup message after the hellman quest to make this easier check the [quest id list](https://wiki.redmodding.org/cyberpunk-2077-modding/for-mod-creators-theory/references-lists-and-overviews/reference-quest-ids):&#x20;

<div>

<figure><img src="../../.gitbook/assets/Screenshot 2024-10-29 205900.png" alt=""><figcaption><p>onscreens.json (message)</p></figcaption></figure>

 

<figure><img src="../../.gitbook/assets/Screenshot 2024-10-29 205916.png" alt=""><figcaption><p>cooked_journal.journal (message)</p></figcaption></figure>

 

<figure><img src="../../.gitbook/assets/Screenshot 2024-10-29 210015.png" alt=""><figcaption><p>onscreens.json (conversation strand)</p></figcaption></figure>

 

<figure><img src="../../.gitbook/assets/Screenshot 2024-10-29 210024.png" alt=""><figcaption><p>cooked_journal.journal (conversation strand)</p></figcaption></figure>

</div>

&#x20;this follows the same steps open the the contact you want in this case: Panam; until you find the quest you want, once you found what you're looking for you can edit the text in FemaleVariant to what you want and make sure to save all once done

if all steps have been followed and they are no conflicting files it should end up like this:

<figure><img src="../../.gitbook/assets/Screenshot 2024-10-28 221933.png" alt=""><figcaption></figcaption></figure>

if you see an error in game showing the LocKey number means you might have another mod that changed the same message and there is a conflict and you might have to uninstall it
