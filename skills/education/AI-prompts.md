+++
title = "AI prompts"
+++

## Telugu stories
A 6yo kid is learning telugu from a teacher, who asks for simple stories.  
Translate a random Hindu or animal story (could be myth or history) to telugu such that 

- sentences are short
- vocabulary is small
- no complicated words are used
- story is true to the source.

## Comics
### Prompt generation
Ask Gemini to write a prompt for imagegen.

### Image geneartion
AI image generators have two main limitations with a prompt like this:

1.  *Multi-Panel:* It will not create an 8-panel comic strip in one go. It will likely generate only one of the panels described.
2.  *Sanskrit Text:* It is notoriously bad at rendering text, especially non-Latin scripts like Devanagari. The text will almost certainly be garbled.

*Therefore, the best method is to generate each panel's image individually and add the text yourself.*

Or do 2-3 panels at a time/

### Perfect Comic

1.  *Generate each panel's image one by one, using a modified prompt without the text.* For example, for Panel 1:
    > "A comic book panel in a timeless, illustrative style with clean linework and natural earth tones. A sleek, dark crow is flying low and with great effort over a vast, parched, cracked-earth landscape under a glaring, hot sun. Its expression is one of exhaustion and desperation."

2.  *Repeat this for all 7-8 panels*, saving the best result for each.
3.  *Use any image editor* (Canva, Photoshop, GIMP, etc.) to arrange your saved images into a comic strip grid.
4.  *Add the Sanskrit text* in clean, readable caption boxes over each image. This gives you complete creative control and guarantees accuracy.