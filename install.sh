# # #/bin/bash

# # root_dir=$(pwd)
# # echo "Setting up the environment in the $root_dir"

# # # --------------------------------------------------------------
# # #          create and activate the virtual environment
# # # --------------------------------------------------------------
# # echo "Creating a virtual environment with python3"
# # conda create -n itv2 python=3.9 -y
# # conda activate itv2

# # echo "Installing all the dependencies"
# # conda install pip
# # python3 -m pip install --upgrade pip==24.0


# # --------------------------------------------------------------
# #                   PyTorch Installation
# # --------------------------------------------------------------
# python3 -m pip install torch --extra-index-url https://download.pytorch.org/whl/cu118


# # --------------------------------------------------------------
# #       Install IndicNLP library and necessary resources
# # --------------------------------------------------------------
# git clone https://github.com/anoopkunchukuttan/indic_nlp_resources.git
# export INDIC_RESOURCES_PATH=$root_dir/indic_nlp_resources

# # we use version 0.92 which is the latest in the github repo
# git clone https://github.com/anoopkunchukuttan/indic_nlp_library.git
# cd indic_nlp_library
# python3 -m pip install ./
# cd $root_dir

# # --------------------------------------------------------------
# #               Install additional utility packages
# # --------------------------------------------------------------
# python3 -m pip install nltk sacremoses regex pandas mock transformers==4.28.1 sacrebleu==2.3.1 urduhack[tf] mosestokenizer ctranslate2==3.9.0 gradio
# python3 -c "import urduhack; urduhack.download()"
# python3 -c "import nltk; nltk.download('punkt')"

# # --------------------------------------------------------------
# #               Sentencepiece for tokenization
# # --------------------------------------------------------------
# # build the cpp binaries from the source repo in order to use the command line utility
# # source repo: https://github.com/google/sentencepiece
# python3 -m pip install sentencepiece

# # --------------------------------------------------------------
# #               Fairseq Installation from Source
# # --------------------------------------------------------------
# git clone https://github.com/pytorch/fairseq.git
# cd fairseq
# python3 -m pip install ./
# cd $root_dir

# echo "Setup completed!"


#!/bin/bash

# Set the root directory to the current working directory
root_dir=$(pwd)
echo "Setting up the environment in $root_dir"

# --------------------------------------------------------------
#                Install dependencies in the virtualenv
# --------------------------------------------------------------
# Activate the virtual environment (assuming we're in a shell where this will be executed)
source /content/drive/MyDrive/translation/indictrans_env/bin/activate

echo "Installing/upgrading pip"
python3 -m pip install --upgrade pip==24.0

# --------------------------------------------------------------
#                   PyTorch Installation
# --------------------------------------------------------------
echo "Installing PyTorch"
python3 -m pip install torch --extra-index-url https://download.pytorch.org/whl/cu118

# --------------------------------------------------------------
#       Install IndicNLP library and necessary resources
# --------------------------------------------------------------
echo "Cloning and setting up Indic NLP resources"
git clone https://github.com/anoopkunchukuttan/indic_nlp_resources.git
export INDIC_RESOURCES_PATH=$root_dir/indic_nlp_resources

echo "Cloning and installing Indic NLP library"
git clone https://github.com/anoopkunchukuttan/indic_nlp_library.git
cd indic_nlp_library
python3 -m pip install ./
cd $root_dir

# --------------------------------------------------------------
#               Install additional utility packages
# --------------------------------------------------------------
echo "Installing additional utility packages"
python3 -m pip install nltk sacremoses regex pandas mock transformers==4.28.1 sacrebleu==2.3.1 urduhack[tf] mosestokenizer ctranslate2==3.9.0 gradio

echo "Downloading UrduHack and NLTK resources"
python3 -c "import urduhack; urduhack.download()"
python3 -c "import nltk; nltk.download('punkt')"

# --------------------------------------------------------------
#               Sentencepiece for tokenization
# --------------------------------------------------------------
echo "Installing Sentencepiece for tokenization"
python3 -m pip install sentencepiece

# --------------------------------------------------------------
#               Fairseq Installation from Source
# --------------------------------------------------------------
echo "Cloning and installing Fairseq"
git clone https://github.com/pytorch/fairseq.git
cd fairseq
python3 -m pip install ./
cd $root_dir

echo "Setup completed!"
