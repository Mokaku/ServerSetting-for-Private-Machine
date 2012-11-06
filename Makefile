################################
## | make # .zshrc, .vimrc, .vimのシンボリックリンクを作成
## | make zsh # .zshrcのシンボリックリンクを作成
## | make vim # .vimrc, .vimのシンボリックリンクを作成
## | make clean # .zshrc, .vimrc, .vimのシンボリックリンクを削除
################################


DOT_FILES = .zshrc .vimrc .vim .bashrc .screenrc .tmux.conf bin

all: zsh vim bash screen tmux bin

zsh: $(foreach f, $(filter .zsh%, $(DOT_FILES)), link-dot-file-$(f))

vim: $(foreach f, $(filter .vim%, $(DOT_FILES)), link-dot-file-$(f))

bash: $(foreach f, $(filter .bash%, $(DOT_FILES)), link-dot-file-$(f))

screen: $(foreach f, $(filter .screen%, $(DOT_FILES)), link-dot-file-$(f))

tmux: $(foreach f, $(filter .tmux%, $(DOT_FILES)), link-dot-file-$(f))

bin: $(foreach f, $(filter bin%, $(DOT_FILES)), link-dot-file-$(f))
	  
.PHONY: clean
	clean: $(foreach f, $(DOT_FILES), unlink-dot-file-$(f))
	  

link-dot-file-%: %
	  @echo "Create Symlink $< => $(HOME)/$<"
	    @ln -snf $(CURDIR)/$< $(HOME)/$<

unlink-dot-file-%: %
	  @echo "Remove Symlink $(HOME)/$<"
	    @$(RM) $(HOME)/$<
