#################################################################################################
This README.txt explains steps to obtain 
(a) wav/, 
(b) etc/txt.done.data, 
(c) lab_{wd/phn}_level/
for building TTS system, given just audio (BIG_FILE.wav) without corresponding text.
The BIG_FILE.wav is split into shorter wavefiles using sil. detection algo, and are
copied to wav/ directory.
The etc/txt.done.data and lab/ directory are produced by decoding audiobook using 
Librispeech acoustic model in Kaldi framework. 
#################################################################################################
(1) Downloading Kaldi
(2) Installing Kaldi on Linux
(3) Set variables and execute run.sh 


(1) Downloading Kaldi
    -- Make sure that subversion (svn) is installed
    -- Type the following
       svn co https://svn.code.sf.net/p/kaldi/code/trunk kaldi-trunk
    -- In case, above command throws error, edit ~/.subversion/servers to make
       [global]
       http-proxy-host = proxy.iiit.ac.in  (line 144)
       http-proxy-port = 8080              (line 145)
 

(2) Installing Kaldi on Linux
    -- A folder named "kaldi-trunk" must have been created in the present directory
    -- cd kaldi-trunk/tools
    -- make -j <num_free_CPUs>    // use -j option for faster installation
    -- cd ../src
    -- ./configure
    -- make depend -j <num_free_CPUs>
    -- make -j <num_free_CPUs>
    -- Kaldi installation is complete. 
    -- Add .../kaldi-trunk/src/*bin, .../kaldi-trunk/tools/openfst-1.3.4/src/bin and 
       .../kaldi-trunk/tools/irstlm/bin to $PATH in ~/.bashrc file


(3) Set variables and execute run.sh
    -- Unzip prep_data_for_TTS.zip
    -- Set KALDI-ROOT variable to .../kaldi-trunk (abs. path where Kaldi is installed) 
       in prep_data_for_TTS/scripts/run_kaldi/path.sh file
    -- cd prep_data_for_TTS/, set the following variables in run.sh, and run
       BIG_FILE="./BIG_FILE.wav" 
       expt_name="EMMA"
       spk_gender="f"        // (m/f)
       num_free_CPUs=20
       Ngram=1
       adapt="yes"           // (yes/no). If yes, transcript produced using 
                             // Librispeech models is used for adapting the model to 
                             // audiobook data. 
