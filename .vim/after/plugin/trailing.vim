scriptencoding utf-8

AutoCmd InsertEnter * :set listchars-=trail:⌴
AutoCmd BufEnter,InsertLeave * :set listchars+=trail:⌴
