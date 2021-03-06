# Redmine landing page plugin

Allows users to select their landing page - the page one is redirected to after logging in or after requesting the root path.

# Requirements

Developed & tested on Redmine 2.3.3.

# Installation

1. Go to your Redmine installation's plugins/ directory.
2. `git clone http://github.com/efigence/redmine_landing_page`
3. Go back to root directory.
4. Migrate (depending on which environment you're currently working on):
`rake redmine:plugins:migrate RAILS_ENV=production` or
`rake redmine:plugins:migrate RAILS_ENV=development`
5. Restart Redmine.

# Usage

Each user has the possibility of selecting his landing page. In order to do it, log in and visit 'My account'. In preferences you should now see addditional select field - 'Landing Page'. After selecting the page of your choice and pressing save button, you will be redirected to this page each time you:

* log in successfully
* request redmine root path

# Management (admins)

There are three default landing pages defined in init.rb: 'Home', My Page' & 'Projects'.

To manage landing pages selectable by all users visit Administration -> Plugin. Afterwards, click on `Configure` link next to the plugin name. Here you can delete exisiting (by hitting the `remove` button), as well as add new landing pages (by hitting `add new` button and providing proper name and path afterwards).

# Note

This plugin was being initially developed by extending another one ([redmine landing page](https://github.com/biow0lf/redmine_landing_page)).

# License

    Redmine landing page plugin
    Copyright (C) 2014  efigence S.A.

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <http://www.gnu.org/licenses/>.
