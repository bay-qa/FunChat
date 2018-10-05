#!/bin/bash
mongo mongodb://ds129801.mlab.com:29801/heroku_qt25j2rs -u heroku_qt25j2rs -p 4gauh5npcl7r74295btd9028ls << EOF

db.channels.deleteMany( { name: /^\?\?\?/m } )
db.users.deleteMany( { name: /^\?\?\?/m } )
db.accounts.deleteMany( { username: /^\?\?\?/m } )
db.messages.deleteMany( { userName: /^123/m } )
EOF
