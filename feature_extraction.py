from sklearn.feature_extraction.text import TfidfTransformer, CountVectorizer
import numpy as np 
import pandas as pd 
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
    # os.chdir('/datasets')
    with open('SMSSpamCollection', 'r', encoding='utf-8') as f:
        data = f.readlines()
        f.close()
    print('the length of data:',len(data))
    label = binary_label(extract_label(data))
    corpus = extract_corpus(data)
    
    # sklearn to extract the feature
    vectorizers = []
    vectorizer = CountVectorizer(stop_words='english')
    vectorizers.append(vectorizer)
    # use this method to finish a bigram feature and bag-of-word
    bigram_vectorizer = CountVectorizer(ngram_range=(2, 2), stop_words='english') 
    vectorizers.append(bigram_vectorizer)
    for i, j in enumerate(vectorizers):
        X = j.fit_transform(corpus)
        X = X.toarray()
        label = np.array(label).reshape(X.shape[0], 1)
        print(i, X.shape)
        print(i, X[0, :])
        data = np.concatenate((X, label), axis=1)
        
        if i == 1:
            np.savetxt('SMSSpamCollection_bigram-{}.csv'.format(i), data, delimiter = ',')

        # use TF-IDF to further extraction
        X = TfidfTransformer().fit_transform(X)
        X = np.array(X.todense())
        data = np.concatenate((X, label), axis=1)
        
        np.savetxt('SMSSpamCollection(TF_IDF)_bigram-{}.csv'.format(i), data, delimiter = ',')
    

if __name__ == '__main__':
    main()