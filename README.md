# Sortable-List

This is a demo/tryout to use RubaXa's Sortable library 
https://github.com/RubaXa/Sortable together with Rails 5.

Instead of using the acts_as_list gem, I wanted the
position to be stored outside the items like this,
creating the associations using has_many :through 
(see http://guides.rubyonrails.org/association_basics.html#the-has-many-through-association )

__________          ______________         __________
| List   |          | Position   |         | Item   |     
|        |          |            |         |        |     
| header |          | item_id    |         | label  |     
|        |          | list_id    |         |        |     
|        |          | position   |         |        |     
__________          ______________         __________     
                
				
## Steps

- include sortable-rails gem in Gemfile  https://github.com/otaq/sortable-rails/ 
