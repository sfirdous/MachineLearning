### Dataset Used

The dataset used in this assignment is the [IMDb movie review dataset](https://huggingface.co/datasets/imdb). It consists of 50,000 movie reviews, equally split into 25,000 for training and 25,000 for testing. Each review is labeled as either positive (1) or negative (0).

For faster training and evaluation, a smaller subset of this dataset is used:
*   **Training samples**: 5,000
*   **Test samples**: 1,000

### How to Run the Code

To run this code, follow these steps in a Google Colab environment:

1.  **Open the Notebook**: Ensure you have this notebook open in Google Colab.
2.  **Install Libraries**: The notebook automatically installs the required libraries (`transformers`, `datasets`, `torch`, `matplotlib`, `numpy`, `sklearn`) if they are not already present.
3.  **Execute Cells Sequentially**: Run each code cell in the notebook from top to bottom. You can do this by clicking the 'Run' button for each cell or by pressing `Shift + Enter`.
    *   **Task 1: Load and Inspect a Transformer Model**: This section loads the `distilbert-base-uncased` model and its tokenizer, then displays its configuration and parameters.
    *   **Task 2: Load Dataset and Build Classification Pipeline**: This section loads the IMDb dataset, tokenizes it, and prepares it for training using PyTorch DataLoaders. It then initializes the `DistilBERT` model for sequence classification and sets up the training loop.
    *   **Task 3: Evaluate & Interpret**: After training, this section evaluates the model's performance using accuracy, F1 score, and a confusion matrix. It also displays misclassified examples and plots training curves.
    *   **Task 4: Model Efficiency Analysis**: This section compares the trained `DistilBERT` model with a `BERT-base-uncased` model in terms of parameters, size, and inference time.
