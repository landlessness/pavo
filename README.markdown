
# Pavo App Design

---

## Models
* Exhibit
* Product
* Person
* Tag
* Category
* Purchase
* Store
* Brand
* Comment
* Like
* Follow
* Point (more complete, more points, networks, tags per Exhibit, comments, like)
* Leaderboard

## Attributes

All models will have timestamp attributes for created and updated timing. All attributes are strings unless noted otherwise.

* Exhibit
  * caption
  * photo url
* Product
  * name
  * color
  * style
  * description - text
* Person
  * screen name
  * full name
  * photo url
* Tag
* Category
  * name
  * photo url
* Purchase
* Store
* Brand
  * name
  * logo url
* Comment
* Like
* Follow

## Associations
* Exhibit
  * belongs to a Person
  * has many Tags
  * has many Products through Tags
  * maybe: link friends who were with you when you showed off
* Product
  * has many Tags
  * has many People through Tags
  * belongs to a Brand
  * belongs to a Category
* Person
  * has many Exhibits
* Tag
  * belongs to an Exhibit
  * belongs to a Product
* Category
  * has many Products
  * belongs to a Parent Category
  * has many Child Categories
* Purchase
  * belongs to a Product
  * belongs to a Person as Owner
  * belongs to a Store
  * maybe: link friends who were with you when you acquired
* Store
* Brand
* Comment
  * belongs to an Exhibit or a Tag (polymorphic)
* Like
  * belongs to an Exhibit or a Tag (polymorphic)
* Follow
  * belongs to a Person as Follower
  * belongs to a Person as Followee

## Depedencies
### Software
* OmniAuth
* Nifty Generators
* HAML

### Web Services
* Amazon API

