# UCB EE120: Signal and Systems 中文翻译与实验完成版

## 中文说明

### 项目简介

本项目基于 UC Berkeley 的 **EE120: Signal and Systems** 课程实验材料整理而成。EE120 是一门信号与系统课程，主要面向已经具备一定编程、微积分和线性代数基础的学习者。

根据课程介绍，该课程具有如下特点：

- 所属大学：UC Berkeley
- 课程名称：UCB EE120: Signal and Systems
- 先修要求：CS61A、CS70、微积分、线性代数
- 编程语言：Python
- 课程难度：较高
- 预计学习时间：约 100 小时

课程内容围绕信号与系统的核心概念展开，包括连续时间信号、离散时间信号、卷积、滤波、频域分析、傅里叶变换等内容。课程实验使用 Python、NumPy 和 Matplotlib 进行编程实践，通过代码和图像帮助学习者理解抽象的数学概念。

这门课最有价值的部分之一是配套的编程实验。实验会引导学习者使用 Python 解决信号与系统中的实际问题，例如实现 FFT 算法、分析图像数据、进行信号滤波与恢复等。因此，本项目希望在保留原课程实验价值的基础上，让中文学习者更容易阅读、运行和复现实验内容。

### 本项目做了什么

本项目主要完成了以下工作：

1. **修正源文件中的部分问题**  
   对原始实验 notebook 中的一些兼容性问题和容易导致运行错误的代码进行了修正。例如新版 Matplotlib 中部分参数不再适用、部分绘图代码容易产生多余输出、中文字体显示可能出现警告等问题。

2. **将实验内容翻译为中文**  
   为了方便中文学习者阅读，本项目对实验文档中的英文说明进行了中文翻译，尽量保证翻译通顺、自然，并保留原实验的教学逻辑。

3. **制作中文完成版实验文件**  
   在中文翻译的基础上，补全实验中的代码、问题回答和结果分析，形成中文完成版 notebook，便于学习者参考。

4. **制作英文完成版实验文件**  
   为了方便对照原始课程内容，本项目也保留并整理了英文完成版，使学习者可以同时参考英文原文和中文翻译版本。



### 项目适合谁

本项目适合以下学习者：

- 正在学习信号与系统课程的学生；
- 想通过 Python 实验理解卷积、滤波和傅里叶分析的人；
- 想参考 UC Berkeley EE120 课程实验内容的学习者；
- 希望阅读中文版本实验说明的人；
- 想学习如何使用 NumPy 和 Matplotlib 进行基础信号处理实验的人。

### 运行环境

建议使用 Conda 创建独立环境：

```bash
conda create -n EE_lab python=3.12
conda activate EE_lab
pip install numpy matplotlib jupyter
```

启动 Jupyter Notebook：

```bash
jupyter notebook
```

或者启动 JupyterLab：

```bash
jupyter lab
```

如果环境已经创建，只需要安装缺失依赖：

```bash
pip install numpy matplotlib jupyter
```

### 中文乱码处理

如果运行 notebook 画图时出现中文乱码，或者出现类似下面的字体警告：

```text
Glyph xxxx missing from font(s) DejaVu Sans
findfont: Font family ... not found
```

说明 Matplotlib 当前使用的字体不支持中文。

可以在终端中执行中文字体修复脚本：

```bash
chmod +x fix_matplotlib_chinese_font_v2.sh
./fix_matplotlib_chinese_font_v2.sh
```

执行完成后，需要重启 Jupyter Notebook 或 JupyterLab，并重启当前 notebook 的 kernel，然后重新运行绘图代码。

如果只想在 notebook 中临时修复，也可以在第一个代码单元加入：

```python
import matplotlib.pyplot as plt

plt.rcParams['font.sans-serif'] = [
    'WenQuanYi Micro Hei',
    'WenQuanYi Zen Hei',
    'Noto Sans CJK SC',
    'DejaVu Sans'
]
plt.rcParams['axes.unicode_minus'] = False
```

需要注意的是，`plt.xkcd()` 会强制使用漫画风格字体，容易导致中文字体设置失效。如果图中包含中文标题或中文坐标轴标签，建议不要使用 `plt.xkcd()`，或者保留英文标签。

### 项目说明

本项目主要用于学习和交流。原课程材料属于 UC Berkeley EE120 相关课程资源，本项目仅在学习目的下进行整理、翻译、修正和实验补全。若你希望系统学习信号与系统，建议结合原课程资料、教材和课堂笔记一起使用。

---

# UCB EE120: Signal and Systems Chinese Translation and Completed Labs

## English Description

### Project Overview

This project is based on the lab materials from **UC Berkeley EE120: Signal and Systems**. EE120 is a course on signals and systems for students with background knowledge in programming, calculus, and linear algebra.

According to the course introduction, the course has the following features:

- University: UC Berkeley
- Course: UCB EE120: Signal and Systems
- Prerequisites: CS61A, CS70, calculus, linear algebra
- Programming language: Python
- Difficulty: relatively high
- Estimated workload: about 100 hours

The course covers core topics in signals and systems, including continuous-time signals, discrete-time signals, convolution, filtering, frequency-domain analysis, Fourier transform, and related concepts. The labs use Python, NumPy, and Matplotlib to help students understand abstract mathematical ideas through executable code and visual results.

One of the most valuable parts of this course is its programming labs. These labs guide students to solve practical signal-processing problems with Python, such as implementing FFT algorithms, analyzing image data, applying filters, and restoring signals. This project aims to preserve the educational value of the original labs while making them easier to read, run, and reproduce for Chinese-speaking learners.

### What This Project Provides

This project mainly provides the following work:

1. **Fixes for several issues in the original source files**  
   Some compatibility and runtime issues in the original notebooks were fixed, such as deprecated Matplotlib parameters, plotting code that may produce unnecessary output, and Chinese font display warnings.

2. **Chinese translation of the lab content**  
   The English explanations in the notebooks were translated into Chinese to make the materials more accessible to Chinese-speaking learners. The translation aims to be smooth and natural while preserving the original teaching logic.

3. **Completed Chinese lab notebooks**  
   Based on the Chinese translation, the TODO code cells, answers, and analysis sections were completed to provide a full Chinese reference version.

4. **Completed English lab notebooks**  
   An English completed version is also provided so that learners can compare the Chinese translation with the original English context.



### Target Users

This project is suitable for:

- Students studying signals and systems;
- Learners who want to understand convolution, filtering, and Fourier analysis through Python experiments;
- Learners interested in UC Berkeley EE120 lab materials;
- Chinese-speaking learners who prefer translated explanations;
- Beginners who want to practice basic signal processing with NumPy and Matplotlib.

### Environment Setup

It is recommended to create an independent Conda environment:

```bash
conda create -n EE_lab python=3.12
conda activate EE_lab
pip install numpy matplotlib jupyter
```

Start Jupyter Notebook:

```bash
jupyter notebook
```

Or start JupyterLab:

```bash
jupyter lab
```

If the environment has already been created, install missing dependencies with:

```bash
pip install numpy matplotlib jupyter
```

### Fixing Chinese Font Issues

If Chinese characters are not displayed correctly in plots, or if warnings similar to the following appear:

```text
Glyph xxxx missing from font(s) DejaVu Sans
findfont: Font family ... not found
```

it means that the current Matplotlib font does not support Chinese characters.

Run the provided font-fix script in the terminal:

```bash
chmod +x fix_matplotlib_chinese_font_v2.sh
./fix_matplotlib_chinese_font_v2.sh
```

After running the script, restart Jupyter Notebook or JupyterLab, restart the notebook kernel, and run the plotting cells again.

For a temporary notebook-level fix, add the following code to the first code cell:

```python
import matplotlib.pyplot as plt

plt.rcParams['font.sans-serif'] = [
    'WenQuanYi Micro Hei',
    'WenQuanYi Zen Hei',
    'Noto Sans CJK SC',
    'DejaVu Sans'
]
plt.rcParams['axes.unicode_minus'] = False
```

Note that `plt.xkcd()` forces Matplotlib to use comic-style fonts, which may conflict with Chinese font settings. If a plot contains Chinese titles or labels, it is recommended not to use `plt.xkcd()`, or to keep the labels in English.

### Notes

This project is intended for learning and communication. The original course materials belong to the related UC Berkeley EE120 course resources. This repository only organizes, translates, fixes, and completes the materials for educational purposes. For systematic study, it is recommended to use this project together with the original course materials, textbooks, and lecture notes.
