import numpy as np 
import os
import re

def extract_label(data):
    pat = re.compile(r'\w+')
    label = [pat.search(i.split(' ')[0]).group() for i in data]
    assert len(label) == len(data)
    return label

def binary_label(label):
    return [1 if i == 'spam' else 0 for i in label ]

def extract_corpus(data):
    split_data = [i.strip().split(' ')[1:] for i in data]
    return [' '.join(i) for i in split_data]

def main():
    with open('SMSSpamCollection', 'r', encoding='utf-8') as f:
        data = f.readlines()
        f.close()
    label = binary_label(extract_label(data))
    corpus = extract_corpus(data)
    print('the length of data:', len(corpus))

    # using gensim to bulid copora
    dim = 128
    token_corpus = [[w.lower() for w in text.split(' ')] for text in corpus]
    model = gensim.models.Word2Vec(size=dim, min_count=0, sg=1, hs=0, iter=1000)
    model.build_vocab(token_corpus)
    model.train(token_corpus, total_examples=model.corpus_count, epochs=model.iter)
    model.save('word2vec.{}d.{}k.bin'.format(dim, len(model.wv.vocab)//1000))
    model.wv.save_word2vec_format('word2vec.{}d.{}k.w2v'.format(dim, len(model.wv.vocab)//1000))

if __name__ == '__main__':
    main()