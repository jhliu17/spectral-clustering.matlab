from gensim.models import KeyedVectors, Word2Vec
import numpy as np 
import pandas as pd
import os
import re
from toolz import curry


def extract_label(data):
    pat = re.compile(r'\w+')
    label = [pat.search(i.split(' ')[0]).group() for i in data]
    assert len(label) == len(data)
    return label

def binary_label(label):
    return [1 if i == 'spam' else 0 for i in label ]

def extract_corpus(data, split=False):
    split_data = [i.strip().lower().split(' ')[1:] for i in data]
    if split:
        return split_data
    else:
        return [' '.join(i) for i in split_data]

def load_model(path):
    # w2v = KeyedVectors.load(path) # 'word2vec.128d.13k.w2v'
    model = Word2Vec.load(path)
    return model

@curry
def convert_to_vector(w2v, word):
    try:
        vec = w2v.wv[word]
    except KeyError:
        vec = None
    return vec

def merge_vector(word_vectors, label):
    ans = [np.concatenate(i, axis=0) for i in word_vectors]
    sum_ans = [np.sum(i, axis=0).reshape(1, 128) for i in ans]
    stacked_ans = np.concatenate(sum_ans, axis=0)
    label = np.array(label).reshape(-1, 1)
    assert stacked_ans.shape[0] == label.shape[0]
    matrix = np.concatenate([stacked_ans, label], axis=1)
    return matrix

def save(path, array):
    np.savetxt(path, array, delimiter = ',')

def test_data(data, label):
    assert len(data) == len(label)
    new_data = []
    new_label = []
    for i in range(len(data)):
        if data[i] == []:
            continue
        else:
            new_data.append(data[i])
            new_label.append(label[i])
    return new_data, new_label

def main():
    with open('SMSSpamCollection', 'r', encoding='utf-8') as f:
        data = f.readlines()
        f.close()
    print('the length of data:',len(data))
    label = binary_label(extract_label(data))
    corpus = extract_corpus(data, split=True)
    corpus, label = test_data(corpus, label)

    # merge_method = '+'
    model_path = 'word2vec.128d.13k.bin'
    model = load_model(model_path)
    w2v = convert_to_vector(model)

    word_vectors = [[w2v(i).reshape(1,128) for i in text if w2v(i) is not None] for text in corpus]
    ans = merge_vector(word_vectors, label)
    save('SMSSpamCollection_w2v.csv', ans)

if __name__ == '__main__':
    main()