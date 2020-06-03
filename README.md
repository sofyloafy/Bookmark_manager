## Bookmark Manager
Pairing with Sophie B
<br>
First user story:

```
As a user
So that I can view a list of useful websites
I want to be shown a list of bookmarks
```

```
As a user
So that I can continue storing links
I would like to add a bookmark
```
<br><br>

Domain model for first user story:
<p align="center">
<img src=/images/Updated_1stDomain_Model.png width=60%>
</p>

## How to set up

1) Connect to psql
2) Create the database using the psql command CREATE DATABASE "bookmark_manager";
3) Connect to the database using the pqsl command \c bookmark_manager;
4) Run the query we have saved in the file 01_create_bookmarks_table.sql
