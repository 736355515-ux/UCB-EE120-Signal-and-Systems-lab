#!/usr/bin/env bash

echo "========================================"
echo " 修复 matplotlib 中文乱码 / 中文字体警告"
echo "========================================"

set -u

echo
echo "[1/6] 检查并安装中文字体..."

if command -v apt >/dev/null 2>&1; then
    sudo apt update
    sudo apt install -y fonts-wqy-microhei fonts-wqy-zenhei fonts-noto-cjk fontconfig
else
    echo "未检测到 apt，跳过自动安装字体。"
    echo "请手动安装 WenQuanYi 或 Noto CJK 中文字体。"
fi

echo
echo "[2/6] 使用 sudo 刷新系统字体缓存..."

if command -v fc-cache >/dev/null 2>&1; then
    sudo fc-cache -fv || {
        echo "sudo fc-cache 失败，尝试仅刷新当前用户字体缓存..."
        fc-cache -fv || true
    }
else
    echo "未找到 fc-cache，请检查 fontconfig 是否安装成功。"
fi

echo
echo "[3/6] 删除 matplotlib 字体缓存..."

rm -rf "$HOME/.cache/matplotlib"
rm -rf "$HOME/.matplotlib"

echo
echo "[4/6] 写入 matplotlib 默认配置..."

MPL_DIR="$HOME/.config/matplotlib"
MPL_RC="$MPL_DIR/matplotlibrc"

mkdir -p "$MPL_DIR"

cat > "$MPL_RC" <<'EOF'
font.family: sans-serif
font.sans-serif: WenQuanYi Micro Hei, WenQuanYi Zen Hei, Noto Sans CJK SC, Noto Sans CJK JP, Noto Sans CJK TC, SimHei, Microsoft YaHei, DejaVu Sans
axes.unicode_minus: False
EOF

echo "已写入：$MPL_RC"

echo
echo "[5/6] 检查系统是否能找到中文字体..."

echo "WenQuanYi Micro Hei:"
fc-match "WenQuanYi Micro Hei" || true

echo
echo "WenQuanYi Zen Hei:"
fc-match "WenQuanYi Zen Hei" || true

echo
echo "Noto Sans CJK SC:"
fc-match "Noto Sans CJK SC" || true

echo
echo "[6/6] 生成 notebook 中可选的字体设置代码..."

cat > "$HOME/.config/matplotlib/matplotlib_chinese_fix.py" <<'EOF'
import matplotlib.pyplot as plt

plt.rcParams['font.sans-serif'] = [
    'WenQuanYi Micro Hei',
    'WenQuanYi Zen Hei',
    'Noto Sans CJK SC',
    'Noto Sans CJK JP',
    'Noto Sans CJK TC',
    'SimHei',
    'Microsoft YaHei',
    'DejaVu Sans',
]
plt.rcParams['axes.unicode_minus'] = False
EOF

echo "已生成：$HOME/.config/matplotlib/matplotlib_chinese_fix.py"

echo
echo "========================================"
echo " 修复完成"
echo "========================================"
echo
echo "接下来请："
echo "1. 重启 Jupyter Notebook / JupyterLab"
echo "2. 重启当前 notebook 的 kernel"
echo "3. 重新运行画图单元"
echo
echo "如果仍有警告，在 notebook 第一格加入："
echo
cat <<'EOF'
import matplotlib.pyplot as plt
plt.rcParams['font.sans-serif'] = ['WenQuanYi Micro Hei', 'WenQuanYi Zen Hei', 'Noto Sans CJK SC']
plt.rcParams['axes.unicode_minus'] = False
EOF
echo
