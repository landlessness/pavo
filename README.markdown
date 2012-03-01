# Pavo App Design

---

## Models
* Exhibit
* Product
* Person
* Tag
* Category
* Brand
* Comment
* Like
* Relationship
* Reward
* Badge
### To Do
* Purchase
* Store

## Attributes

All models will have timestamp attributes for created and updated timing. All attributes are strings unless noted otherwise.

* Exhibit
  * caption
  * photo url
* Product
  * name
  * description - text
* Variation
  * color
  * style
  * size
* Person
  * screen name
  * full name
  * photo url
* Tag
* Category
  * name
  * photo url
* Brand
  * name
  * logo url
* Comment
  * body
* Like
* Relationship
  * status
* Reward
  * value
#TODO
* Badge
* Purchase
* Store

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
  * belongs to a Commentable - Exhibit or a Tag
  * belongs to a Person
* Like
  * belongs to a Likable - Exhibit or a Tag
  * belongs to a Person
* Relationship
  * belongs to a Person as Follower
  * belongs to a Person as Followee
* Reward
  * belongs to a Rewardable - Exhibit or a Tag
  * belongs to a Person
* Badge

## Depedencies
### Software
* OmniAuth
* Nifty Generators
* HAML

### Web Services
* Amazon API

## Photo Layouts

one
11
11

two horizontal
11
22

two ver
12
12

three top
11
23

three bottom
23
11

three right
21
31

three left
12
13

four
12
34