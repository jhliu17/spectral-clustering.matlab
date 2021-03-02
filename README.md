# Spectral Clustering MATLAB

<img src=img/intro.png width = "80%" height = "80%"/>

This is an intuitive implementation of Spectral Clustering with MATLAB. You can easily finish a spectral clustering analysis using Scikit-Learn similar API (the comparison between spectral clutsering and others is [here](https://scikit-learn.org/stable/modules/clustering.html#overview-of-clustering-methods)). For more deatils about spectiral clustering, you can read the references below or [a brief introduction](https://jhliu17.github.io/codes/spectral_clustering_slide.pdf) written by us. (GPU accelerated version will be coming soon...)


## Getting Started

1. Clone this repo and run `main.m` to see the demo
2. Usage Details
- **Specify your data matrix X and label vector y, or get the built-in data**

    ``` [X, y] =  make_digits_dataset(300, true, false); % 300 examples, balance, no shuffle```

    In this project, we provide 6 datasets including 3 toys and 3 real datasets. You can find them in `datasets`.

- **Construct your graph**

    ```W = fullyconnected(X, 7.8, 'rbf');```

    There havs 3 types of graph you can use. Find them in `graph`.

- **Run the Spectral Clustering Solver**

    ```[C, ~] = SpectralClustering(W, size(unique(y), 1), 2);```

    C is the predicted clusters.

- **You can also easily metric the predicted answer with the functions under the `metric`.**


## Contributors

- Junhao Liu, SCUT
- jinlai Nin, SCUT
- dedong Huang, SCUT
- Hao Wen, SCUT


## Reference

1. Von Luxburg, Ulrike. "A tutorial on spectral clustering." Statistics and computing 17.4 (2007): 395-416.
