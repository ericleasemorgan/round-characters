#!/usr/bin/env python

# https://medium.com/swlh/make-your-bot-understand-the-context-of-a-discourse-4b740d46166c

import spacy


def find_antecedent(sent_prev):
  for ent in sent_prev.ents:
    if ent.label_ == 'PERSON':
      return ent.text
  return False
  
nlp = spacy.load('en_core_web_lg')


doc = nlp(u'Who was Raphael Santi? What did he draw?')
doc_sents = list(doc.sents)
sent_prev = doc_sents[0]
sent_cur = doc_sents[1]
sent_upd = sent_cur.text
prons = ['he', 'she', 'him', 'his', 'her', 'they', 'them', 'their']
for token in sent_cur:
  if (token.tag_ == 'PRP' or token.tag_ == 'PRP$') and token.text.lower() in prons:
    ent = find_antecedent(sent_prev)
    if ent:
      pron_i = token.i - sent_cur[0].i
      sent_upd = sent_cur[:pron_i].text + ' ' + ent + ' ' + sent_cur[pron_i + 1:].text
print(sent_upd)
