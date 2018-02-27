# Employee Tracker

#### _Simple app to tracks employees and divisions_

#### By _**Misha Petrov**_

![view 1](https://i.imgur.com/lVlgQxA.png)

## Setup/Installation Requirements

#### You can view the app live by visiting: (currently unavailable)


#### Or to deploy on local machine: 

Clone to your local machine. In terminal, navigate to the root directory of the project
Recreate the database by using the following commands in terminal:

* _`$ rake db:create`_

* _`$ rake db:migrate`_

#### In case this doesnt'create necessary relations, in terminal, type:

* _`$ rake db:create_migration NAME=create_tables`_

Then, from the project's root directory navigate to db/migrate and edit the freshly created migration file to add the following lines of code:

    class CreateTables < ActiveRecord::Migration[5.1]
      def change
        create_table(:employees) do |e|
          e.column(:name, :string)
          e.column(:name, :string)
          e.column(:division_id, :integer)
          e.timestamps()
        end
        create_table(:divisions) do |d|
          d.column(:name, :string)
          d.timestamps()
        end
      end
    end

Save the changes and run this command in a terminal window:

* _`$ rake db:migrate`_

Use this command in terminal to run app on the localhost:

* _`$ ruby app.rb`_

## Running tests

Run `bundle exec rspec` in terminal to test.

## Specifications (use case scenarios)

* User can view, add, update and delete divisions.
* User can add employees
* User can view employees in each division
* User can assign employee to a division
* User can edit and delete employees for the division

## Support and contact details

_modesau@gmail.com_

## Technologies Used

Ruby, Sinatra, Postgres, Active Record, HTML, CSS

## Screenshots

![view 2](https://i.imgur.com/gB56421.png)
![view 3](https://i.imgur.com/6v0DRgu.png)
![view 4](https://i.imgur.com/DnF3yNM.png)


### License

*Licensed under MIT license*

Copyright (c) 2018 **_Misha Petrov_**

