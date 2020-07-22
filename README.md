# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|password|string|null: false|
|country|string|null: false|
|job|string|null: false|
|term|string|null: false|
|image|image||
|introduction|text||
|group_id|integer||
|room_id|integer||
|message_id|integer||

### Association
- has_many :groups, through users-groups
- has_many :messages
- has_many :entries
- has_many :dm_messages
- has_many :users-groups

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|info|text|null: false|
|image|image||
|user_id|integer||
|group_message_id|integer||

### Association
- has_many :users, through users-groups
- has_many :messages
- has_many :users-groups

## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|contents|text|null: false|
|user_id|integer||
|group_id|integer||

### Association
- belongs_to :user
- belongs_to :group

## users-groupsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key true|
|group_id|integer|foreign_key true|

### Association
- belongs_to :user
- belongs_to :group

## entryテーブル
|Column|Type|Options|
|------|----|-------|
|room_id|integer|foreign_key true|
|user_id|integer|foreign_key true|

### Association
- belongs_to :room
- belongs_to :user

## roomsテーブル
|Column|Type|Options|
|------|----|-------|
|entry_id|integer|foreign_key true|
|dm_message_id|integer|foreign_key true|

### Association
- has_many :entries
- has_many :dm_messages

## dm-messagesテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null false|
|room_id|integer|foreign_key true|
|user_id|integer|foreign_key true|

### Association
- belongs_to :room
- belongs_to :user