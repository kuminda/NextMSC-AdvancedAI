# Exercise 02: Multiclass Image Classification with CNN

**Course:** DXB-MSC AI-CS7003NU — Advanced AI Technologies  
**Topic:** Convolutional Neural Networks (CNN) for Multiclass Classification  
**Dataset:** [CIFAR-10](https://www.cs.toronto.edu/~kriz/cifar.html)

---

## Overview

In this exercise, you will build, train, and evaluate a **Convolutional Neural Network (CNN)** to classify color images into **10 different categories**. Unlike the diabetes prediction model (binary classification), this task requires the network to distinguish between multiple classes — a classic **multiclass classification** problem.

You will learn how CNNs automatically extract visual features (edges, textures, shapes) from images and use them for classification, all without manual feature engineering.

---

## Learning Objectives

By completing this exercise, you will be able to:

1. **Understand CNN Architecture**
   - Explain the role of Convolutional layers, Pooling layers, and Fully Connected (Dense) layers
   - Understand why CNNs outperform standard neural networks on image data

2. **Prepare Image Data for Deep Learning**
   - Normalize pixel values to the [0, 1] range
   - Convert integer labels to one-hot encoded vectors
   - Visualize sample images from each class

3. **Build and Compile a CNN in Keras**
   - Stack Conv2D, MaxPooling2D, Dropout, Flatten, and Dense layers
   - Choose appropriate activation functions (ReLU, Softmax)
   - Configure the optimizer, loss function, and metrics

4. **Train the Model and Monitor Performance**
   - Observe how loss decreases and accuracy increases epoch by epoch
   - Use callbacks (EarlyStopping, ModelCheckpoint) to prevent overfitting
   - Interpret training vs. validation curves

5. **Evaluate and Interpret Results**
   - Compute test accuracy on unseen data
   - Analyze the Confusion Matrix to identify misclassified classes
   - Review Precision, Recall, and F1-Score per class
   - Visualize predictions with confidence scores

---

## Prerequisites

### Software Requirements
- **Miniconda** installed (see root `start-jupyter.bat` / `start-jupyter.sh`)
- **Conda Environment:** `advanced-ai` (already configured with required packages)
- **IDE:** VS Code with Python & Jupyter extensions (recommended)

### Required Packages
These are pre-installed in your `advanced-ai` environment:

| Package | Purpose |
|---------|---------|
| `tensorflow` | Deep learning framework (Keras API) |
| `numpy` | Numerical computations |
| `matplotlib` | Plotting training curves and images |
| `seaborn` | Enhanced confusion matrix visualization |
| `scikit-learn` | Classification report & confusion matrix metrics |

> **If TensorFlow is missing**, install it via:
> ```bash
> conda activate advanced-ai
> pip install tensorflow
> ```

---

## Dataset: CIFAR-10

| Property | Value |
|----------|-------|
| **Total Images** | 60,000 |
| **Training Set** | 50,000 images |
| **Test Set** | 10,000 images |
| **Image Size** | 32 × 32 pixels (RGB) |
| **Channels** | 3 (Red, Green, Blue) |
| **Classes** | 10 |

### Class Labels

| Index | Class Name |
|:-----:|------------|
| 0 | airplane |
| 1 | automobile |
| 2 | bird |
| 3 | cat |
| 4 | deer |
| 5 | dog |
| 6 | frog |
| 7 | horse |
| 8 | ship |
| 9 | truck |

> The dataset will download automatically (~170 MB) the first time you run the notebook. It is cached locally and will not re-download on subsequent runs.

---

## Step-by-Step Instructions

### Step 1: Launch Jupyter
From the **project root folder**, run:

**Windows (PowerShell / Command Prompt):**
```powershell
.\start-jupyter.bat
```

**Git Bash:**
```bash
./start-jupyter.sh
```

### Step 2: Open the Notebook
In Jupyter or VS Code, open:
```
02_multiclass_image_classification/02_multiclass_image_classification.ipynb
```

### Step 3: Select the Correct Kernel
In VS Code, click the kernel selector (top-right) and choose:
```
Python 3.12 (advanced-ai)
```

### Step 4: Run the Notebook Cell-by-Cell
Press `Shift + Enter` to execute each cell in sequence.

| Section | What to Observe |
|---------|-----------------|
| **1. Imports** | Verify TensorFlow loads without errors |
| **2. Load Data** | CIFAR-10 downloads automatically; check shapes |
| **3. Visualize** | See sample images from each of the 10 classes |
| **4. Preprocessing** | Pixel values normalized to [0, 1]; labels one-hot encoded |
| **5. Build CNN** | Review the model summary — count parameters and layers |
| **6. Compile** | Note the optimizer (`Adam`), loss (`categorical_crossentropy`), metric (`accuracy`) |
| **7. Train** | **Watch the output!** Loss should decrease; accuracy should increase every epoch. EarlyStopping may halt training if validation loss plateaus. |
| **8. Plot Curves** | Training vs. Validation accuracy/loss. Small gap = good. Large gap = overfitting. |
| **9. Test Evaluation** | Final test accuracy (typically 70-80% with this architecture). |
| **10. Confusion Matrix** | Which classes are confused? (e.g., cats vs. dogs) |
| **11. Classification Report** | Per-class Precision, Recall, F1-Score |
| **12. Sample Predictions** | Green = correct, Red = wrong. Confidence percentages shown. |
| **13. Probability Bars** | Understand how the model distributes confidence across all 10 classes |

---

## Expected Outputs

### Training Curves
- **Training Accuracy:** Should reach ~85-95%
- **Validation Accuracy:** Should reach ~70-80%
- **Training Loss:** Steady downward trend
- **Validation Loss:** Should decrease alongside training loss

> A large gap between training and validation accuracy indicates **overfitting**. This is addressed using **Dropout layers** and **EarlyStopping** in the notebook.

### Test Set Performance
- **Test Accuracy:** ~72-78% (with the provided architecture)
- The model is intentionally kept simple so training completes in a reasonable time on CPU.

---

## CNN Architecture Used

```
Input: 32x32x3 (RGB Image)
    |
    v
[Conv2D: 32 filters, 3x3] ---> [Conv2D: 32 filters] ---> [MaxPool 2x2] ---> [Dropout 25%]
    |
    v
[Conv2D: 64 filters, 3x3] ---> [Conv2D: 64 filters] ---> [MaxPool 2x2] ---> [Dropout 25%]
    |
    v
[Conv2D: 128 filters, 3x3] ---> [MaxPool 2x2] ---> [Dropout 25%]
    |
    v
[Flatten] ---> [Dense: 128 neurons] ---> [Dropout 50%]
    |
    v
[Dense: 10 neurons] ---> [Softmax]
    |
    v
Output: Probability distribution over 10 classes
```

**Key Design Choices:**
- **Conv2D layers** detect local features (edges, corners, textures)
- **MaxPooling** reduces spatial dimensions, lowering computation
- **Dropout** randomly disables neurons during training to prevent overfitting
- **Softmax** ensures output probabilities sum to 1.0 across all 10 classes

---

## Homework & Experiments

After running the base notebook, try the following modifications and observe the impact on accuracy and training time:

### 1. Adjust Network Depth
- Add another Conv2D block (e.g., 256 filters)
- Remove one block
- **Question:** How does depth affect accuracy and training speed?

### 2. Modify Dropout Rates
- Change dropout from 25% to 10% or 50%
- **Question:** What happens to the gap between training and validation accuracy?

### 3. Experiment with Optimizers
Replace `Adam` with:
- `SGD` (Stochastic Gradient Descent)
- `RMSprop`
- **Question:** Which converges fastest? Which achieves the best final accuracy?

### 4. Adjust Learning Rate
```python
from tensorflow.keras.optimizers import Adam
optimizer = Adam(learning_rate=0.001)  # Try 0.0001, 0.01, 0.1
```
- **Question:** Too high = unstable training. Too low = very slow convergence.

### 5. Change Batch Size
- Try `batch_size=32` vs `batch_size=128`
- **Question:** How does this affect training stability and speed?

### 6. Data Augmentation
Add an `ImageDataGenerator` to artificially expand the training set:
```python
from tensorflow.keras.preprocessing.image import ImageDataGenerator

datagen = ImageDataGenerator(
    rotation_range=15,
    width_shift_range=0.1,
    height_shift_range=0.1,
    horizontal_flip=True
)
```
- **Question:** Does augmentation reduce overfitting?

### 7. Transfer Learning (Advanced)
Replace the custom CNN with a pre-trained model:
- `ResNet50`
- `MobileNetV2`
- `VGG16`

Load weights from ImageNet and fine-tune on CIFAR-10.
- **Question:** How much does pre-training improve accuracy?

---

## Key Concepts to Remember

| Concept | Explanation |
|---------|-------------|
| **Convolution** | Sliding a filter (kernel) over the image to detect features like edges |
| **Feature Map** | The output of a convolution layer — a filtered version of the input |
| **Pooling** | Downsampling to reduce dimensions and emphasize dominant features |
| **Dropout** | Randomly zeroing out neurons during training to prevent over-reliance |
| **One-Hot Encoding** | Converting a single label (e.g., `3`) into a binary vector `[0,0,0,1,0,0,0,0,0,0]` |
| **Softmax** | Converts raw scores into probabilities that sum to 1.0 |
| **Cross-Entropy Loss** | Measures how far predicted probabilities are from the true labels |
| **Overfitting** | Model memorizes training data but performs poorly on new data |
| **EarlyStopping** | Automatically stops training when validation performance stops improving |

---

## Troubleshooting

| Problem | Solution |
|---------|----------|
| `ModuleNotFoundError: No module named 'tensorflow'` | Run: `pip install tensorflow` inside the `advanced-ai` environment |
| Training is very slow | This is normal on CPU. Consider reducing epochs or using Google Colab for GPU access |
| Out of Memory error | Reduce `batch_size` (e.g., from 64 to 32) |
| Validation accuracy is much lower than training accuracy | Increase Dropout, add data augmentation, or reduce model complexity |
| Notebook kernel dies | Restart the kernel and re-run cells sequentially |

---

## Submission Checklist

- [ ] Notebook runs end-to-end without errors
- [ ] Training curves are plotted and interpreted
- [ ] Confusion Matrix is generated
- [ ] Classification Report is reviewed
- [ ] At least **one experiment** from the Homework section is attempted
- [ ] A brief written reflection (2-3 sentences) on what you observed

---

## References

1. [CIFAR-10 Dataset](https://www.cs.toronto.edu/~kriz/cifar.html)
2. [TensorFlow Keras Documentation](https://www.tensorflow.org/api_docs/python/tf/keras)
3. [CS231n: Convolutional Neural Networks for Visual Recognition](https://cs231n.github.io/)
4. [Deep Learning with Python (Francois Chollet)](https://www.manning.com/books/deep-learning-with-python)

---

**Good luck, and enjoy building your first CNN!** 🚀
