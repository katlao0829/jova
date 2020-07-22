# アプリ名 [JO場(JOVA) ~JICA Old Volunteer Activity Space~]
App IP : 54.150.117.169
## アプリ概要
いわゆる途上国で2年間ボランティア活動をするという特殊な経験をしたJICA協力隊。
帰国後もボランティア経験を胸にいろいろな思いを持って様々な分野で活躍していると思います。
そんな特別な経験や今後の思いを共有するための"JICA協力隊によるJICA協力隊のため"のコミュニティスペースです。
### 特徴
- 国・職種・隊次・現地を象徴する写真など協力隊らしい自己紹介ができる場所です。
- 様々な目的を持ったグループを作ってチャットをすることができます。
- 気になった個人へのダイレクトメッセージも可能です。
- JICA協力隊が主催するイベントなども宣伝できます(実装中)
## 制作背景(意図)
  JICA協力隊とは、2年間、アフリカ、南米、アジア、中東、大洋州などいわゆる発展途上国と呼ばれる地域で、様々な職種で活動をするボランティアのことです。
  JICA協力隊の多くは１人で、配属先の現地の方と一緒に活動し、現地の方と同じ生活環境で深く任地に関わりながらボランティア活動を行います。JICA協力隊としての2年間というのは、帰国後も人生の中で深く心に残り続ける特別な経験です。日本に帰国後、2年間の経験や思い出、変化した人生観、逆カルチャーショックなど、共有したいことはたくさんあるのですが、周りの方々に共有しようにもJICA協力隊経験者でなければ伝わらないことがたくさんあるのも事実です。しかしながら、日本に帰国してみると、経験を言語化して協力隊同士で共有する場所であったり、同じ国・同じ派遣期間でなければ、協力隊というコミュニティであっても、繋がりを作る場所がとても少ないと感じています。さらに現在であれば、新型コロナウイルスの影響もあり、リアルのイベントで繋がることも難しく、より共有するための場所という需要があると考えています。
  そこで、私はJICA協力隊のいち経験者として、この需要に応えるべく、JICA協力隊のためのコミュニティスペースを制作しました。実際にサービスとして運用するレベルにはまだまだ程遠い出来ですが、いつか実現させたいと考えております。
## DEMO

## 今後実装予定の内容
- イベント登録機能(イベント開催者のみが修正可能)
- 国・職種・隊次での検索機能
- メッセージの非同期通信

# DB設計

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