# Sortable-List

[Blog-Entry](http://drblinken.github.io/2016/09/01/sortable-list.html)

This is a demo/tryout to use RubaXa's Sortable library
https://github.com/RubaXa/Sortable together with Rails 5.

Instead of using the acts_as_list gem, I wanted the
position to be stored outside the items like this,
creating the associations using has_many :through
(see http://guides.rubyonrails.org/association_basics.html#the-has-many-through-association )
<pre>
__________          ______________         __________
| List   |          | Position   |         | Item   |     
|        |          |            |         |        |     
| header |          | item_id    |         | label  |     
|        |          | list_id    |         |        |     
|        |          | position   |         |        |     
__________          ______________         __________     
</pre>

## Steps

- created the list in app/views/show.html.erbs
- added bootstrap-sass gem as described in https://github.com/twbs/bootstrap-sass
- downloaded Sortable.js from https://github.com/RubaXa/Sortable to vendor/assets/javascripts and included it in application.js (version 1.3.0)
- added ajax call in app/views/show.html.erbs
- added reorder action in list controller
- implemented the reorder functionality just as needed in the list model
- Note: with this model, the positions are stored outside the Items. Thus, each
  item could be contained in several lists.

## Learnings/Things that didn't work
- include sortable-rails gem in Gemfile  https://github.com/otaq/sortable-rails/ -
this didn't work - older version? thus included version 1.3.0 manually
